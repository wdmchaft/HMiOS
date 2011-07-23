//
//  HelloWorldLayer.m
//  HarvestMoon
//
//  Created by Maurus KŸhne on 14.05.11.
//  Copyright KBDevers 2011. All rights reserved.
//

#import "KBGameLayer.h"
 
#pragma mark -
#pragma mark Implementation

@implementation KBGameLayer

#pragma mark -
#pragma mark Properties

@synthesize map = _map;

@synthesize player = _player;

@synthesize currentEvent = _currentEvent;

@synthesize gameMenuLayer = _gameMenuLayer;

@synthesize interactionHandler = _interactionHandler;

#pragma mark -
#pragma mark Class Methods

+ (CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    KBGameMenuLayer* menu = [KBGameMenuLayer node];
    
	// 'layer' is an autorelease object.
	KBGameLayer *layer = [KBGameLayer node];
	
    KBInteractionHandler* touchHandler = [KBInteractionHandler node];
    
    touchHandler.delegate = layer;
    
	// add layer as a child to scene
	
    
    [scene addChild:layer];
    [scene addChild:touchHandler];
    [scene addChild:menu];
	
	// return the scene
	return scene;
}

#pragma mark -
#pragma mark State Handling

// on "init" you need to initialize your instance
- (id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
        self.map = [[KBMap alloc] initWithMapName:[[[KBConfigurationManager sharedManager] configuration]valueForKey:kCurrentMapName]];
        
        //[self.map runAction:[CCScaleBy actionWithDuration:0.1 scale:0.5f]];
        
        
        [self addChild:self.map z:-1];
        
        self.player = [[KBPlayer alloc] init];
        
        [self addChild:self.player z:1];
        
        [[KBStandardGameController sharedController] setGameLayer:self];
        
        [self setViewpointCenter:self.player.position];
        
        [self scheduleUpdate];
        
    }
    return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark -
#pragma mark Update Logic

- (void) update:(ccTime) dt
{
    [self findAndRunEventAtPosition:self.player.position interactionType:TouchedByPlayer];
    
    [self setViewpointCenter:self.player.position];
}

-(void) loadMap:(NSString*)mapName playerPosition:(CGPoint)playerPosition withAnimation:(BOOL)animate
{
    [self removeChild:self.map cleanup:YES];
    
    [[[KBConfigurationManager sharedManager] configuration]setValue:mapName forKey:kCurrentMapName];
    
    //[self.map load];
    self.map = [[KBMap alloc] initWithMapName:mapName];
    [self.map load];
    
    [self.player updatePlayerForMapChange];
    
    [self addChild:self.map z:-1];
    
    self.player.position = ccp(playerPosition.x * self.map.tileWidth, playerPosition.y * self.map.tileHeight);
}

#pragma mark -
#pragma mark Camera Handling

- (void) setViewpointCenter:(CGPoint) position 
{
    if (![self.map centerPlayer]) {
        self.position = ccp(
                            ([[CCDirector sharedDirector] winSize].width / 2) - ([self.map mapWidthInPixels] / 2),
                            ([[CCDirector sharedDirector] winSize].height / 2)  - ([self.map mapHeightInPixels] / 2));
        return;
    }
    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    int x = MAX(position.x, winSize.width / 2);
    int y = MAX(position.y, winSize.height / 2);
    
    x = MIN(x, (self.map.mapWidth * self.map.tileWidth)
            - winSize.width / 2);
    y = MIN(y, (self.map.mapHeight * self.map.tileHeight)
            - winSize.height / 2);
    
    CGPoint actualPosition = ccp(x,y);
    
    CGPoint centerOfView = ccp(winSize.width/2,winSize.height/2);
    CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
    self.position = viewPoint;
}

#pragma mark -
#pragma mark Touch Events

-(void)shouldBeginMovingPlayerToSide:(Side)side
{
    [self.player beginWalkingToSide:side];
}

-(void)shouldChangePlayerMovementToSide:(Side)side
{
    [self.player beginWalkingToSide:side];
}

-(void)shouldStopPlayerMovement
{
    [self.player stopWalking];
}

- (void) findAndRunEventAtPosition: (CGPoint) tilePosition interactionType:(RunOnEvent)runOnEvent  {
  NSDictionary* playerObject = [self.map eventDataAtPosition:tilePosition];
    
    if(playerObject != nil && (self.currentEvent == nil || [self.currentEvent hasFinishedRunning])
       && ![_currentMapObject isEqualToDictionary:playerObject])
    {
        id<KBEvent> script = [KBSEventFactory eventForObject:playerObject];
        if([script runsOnEvent] == runOnEvent)
        {
            self.currentEvent = script;
        
            [script run];
        }
    }
    _currentMapObject = [playerObject retain];

}

-(void)touchedAtScreenCoordinate:(CGPoint)screenCoordinate
{
    screenCoordinate = [[CCDirector sharedDirector] convertToGL:screenCoordinate];
    
    
    [self findAndRunEventAtPosition:[self convertToNodeSpace:screenCoordinate ] interactionType:TouchedWithFinger];

}

#pragma mark -

@end
