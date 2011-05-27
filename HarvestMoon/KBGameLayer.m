//
//  HelloWorldLayer.m
//  HarvestMoon
//
//  Created by Maurus KŸhne on 14.05.11.
//  Copyright KBDevers 2011. All rights reserved.
//

#import "KBGameLayer.h"
 
// HelloWorldLayer implementation
@implementation KBGameLayer

#pragma mark -
#pragma mark Properties

@synthesize map = _map;

@synthesize player = _player;

@synthesize currentEvent = _currentEvent;

#pragma mark -
#pragma mark Class Methods

+ (CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	KBGameLayer *layer = [KBGameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

#pragma mark -
#pragma mark Init & Dealloc

// on "init" you need to initialize your instance
- (id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
        
        
        self.map = [[KBMap alloc] initWithMapName:
                    [[KBStoryController sharedController] currentMapName]];
        
        //[self.map runAction:[CCScaleBy actionWithDuration:0.1 scale:0.5f]];
        
        
        [self addChild:self.map z:-1];
        
        self.player = [[KBPlayer alloc] init];
        
        [self addChild:self.player z:1];
        
        self.player.position = [[KBStoryController sharedController] lastSavedPlayerPosition];
        
        
        self.isTouchEnabled = YES;
        
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
    NSDictionary* playerObject = [self.map.tileMap objectAtPosition:self.player.position];
        
    if(playerObject != nil && (self.currentEvent == nil || [self.currentEvent hasFinishedRunning])
       && ![_currentMapObject isEqualToDictionary:playerObject])
    {
        
        
        id<KBEvent> script = [KBSEventFactory eventForObject:playerObject];
        
        self.currentEvent = script;
        
        [script run];
        
    }
    _currentMapObject = [playerObject retain];
    [self setViewpointCenter:self.player.position];
}

-(void) loadMap:(NSString*)mapName withAnimation:(BOOL)animate
{
    [self removeChild:self.map cleanup:YES];
    
    self.map = [[KBMap alloc] initWithMapName:mapName];
    [self.player updatePlayerForMapChange];
    
    [self addChild:self.map];
}

#pragma mark -
#pragma mark Touch Handling

- (void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL) ccTouchBegan:(UITouch *) touch withEvent:(UIEvent *) event
{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    //touchLocation = [self convertToNodeSpace:touchLocation];
    
    int width =[[CCDirector sharedDirector] winSize].width;
    int height =[[CCDirector sharedDirector] winSize].height;
    
    CGPoint middlePoint = CGPointMake(width/2, height/2);
    CGPoint lo = CGPointMake(0, 0);
    CGPoint lu = CGPointMake(0, height);
    CGPoint ro = CGPointMake(width, 0);
    CGPoint ru = CGPointMake(width, height);
    
    
    if ([self CGPoint:touchLocation inTriangleP1:lu P2:lo P3:middlePoint]) {
        [self.player beginWalkingToSide:Left];
    }
    if ([self CGPoint:touchLocation inTriangleP1:ru P2:ro P3:middlePoint]) {
        [self.player beginWalkingToSide:Right];
    }
    if ([self CGPoint:touchLocation inTriangleP1:lo P2:ro P3:middlePoint]) {
        [self.player beginWalkingToSide:Up];
    }
    if ([self CGPoint:touchLocation inTriangleP1:lu P2:ru P3:middlePoint]) {
        [self.player beginWalkingToSide:Down];
    }
    
    return YES;
}

- (void) ccTouchMoved:(UITouch *) touch withEvent:(UIEvent *) event
{
    //Durchschleifen, 
    [self ccTouchBegan:touch withEvent:event];
}

- (void) ccTouchEnded:(UITouch *) touch withEvent:(UIEvent *) event
{
    
    [_player stopWalking];
    
    //[self setViewpointCenter:self.player.position];
    
}

- (CGFloat) GBDot:(CGPoint) v1 point2:(CGPoint) v2
{
    return v1.x * v2.x + v1.y * v2.y;
}

- (CGPoint) GBSub:(CGPoint) v1 point2:(CGPoint) v2
{
    return CGPointMake(v1.x - v2.x, v1.y - v2.y);
}

- (BOOL) CGPoint:(CGPoint) point inTriangleP1:(CGPoint) p1 P2:(CGPoint) p2 P3:(CGPoint) p3
{
    CGPoint v0 = [self GBSub:p3 point2:p1];
    CGPoint v1 = [self GBSub:p2 point2:p1];
    CGPoint v2 = [self GBSub:point point2:p1];
    
    CGFloat dot00 = [self GBDot:v0 point2:v0];
    CGFloat dot01 = [self GBDot:v0 point2:v1];
    CGFloat dot02 = [self GBDot:v0 point2:v2];
    CGFloat dot11 = [self GBDot:v1 point2:v1];
    CGFloat dot12 = [self GBDot:v1 point2:v2];
    
    
    CGFloat invDenom = 1/(dot00 * dot11 - dot01 * dot01);
    CGFloat u = (dot11 * dot02 - dot01 * dot12) * invDenom;
    CGFloat v = (dot00 * dot12 - dot01 * dot02) *invDenom;
    
    return (u > 0) && (v > 0) && (u + v < 1);
}

#pragma mark -
#pragma mark Camera Handling

- (void) setViewpointCenter:(CGPoint) position 
{
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

@end
