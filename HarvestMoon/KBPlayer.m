//
//  KBPlayer.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 14.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBPlayer.h"
#import "KBGameLayer.h"


//NSCoding
#define kInventoryKey @"_inventory"

@implementation KBPlayer

#pragma mark -
#pragma mark Properties

@synthesize sprite = _sprite;

@synthesize spriteBatchNode = _spriteBatch;

@synthesize currentAnimation = _currentAnimation;

@synthesize isWalking = _walking;

@synthesize walkingTo = _walkingTo;

@synthesize inventory = _inventory;

#pragma mark -
#pragma mark Init & Dealloc

- (id) init 
{
    self = [super init];
    if (self) {
        
        [[KBStandardGameController sharedController] setPlayer:self];
        
        self.spriteBatchNode = [[CCSpriteBatchNode alloc] initWithFile:@"jack_walking.png" capacity:30];
        
        
        //CCSpriteSheet* sheet = [CCSpriteSheet spriteSheetWithFile:@"myTest"];
        
        
        self.sprite = [CCSprite spriteWithTexture:[self.spriteBatchNode texture] rect:CGRectMake(0, 0, 39, 37)];
        
        [self.spriteBatchNode addChild:self.sprite];
        
        
        _walkingSpeed = 15;
        
        [self addChild:self.spriteBatchNode];
        
        [self.sprite runAction:[CCScaleBy actionWithDuration:0.1f scale:1.5f]];
        
        
        [self scheduleUpdate];
        
        _walkLeftAnimation = [self walkAnimationWithRow:1 startPosition:1 spriteCount:2 side:Left];
        _walkRightAnimation = [self walkAnimationWithRow:1 startPosition:4 spriteCount:2 side:Right];
        _walkUpAnimation = [self walkAnimationWithRow:0 startPosition:1 spriteCount:2 side:Up];
        _walkDownAnimation = [self walkAnimationWithRow:0 startPosition:4 spriteCount:2 side:Down];
        _stayLeftAnimation = [self walkAnimationWithRow:1 startPosition:0 spriteCount:1 side:Left];
        _stayRightAnimation = [self walkAnimationWithRow:1 startPosition:3 spriteCount:1 side:Right];
        _stayUpAnimation = [self walkAnimationWithRow:0 startPosition:0 spriteCount:1 side:Up];
        _stayDownAnimation = [self walkAnimationWithRow:0 startPosition:3 spriteCount:1 side:Down];
	
        self.inventory = [[KBInventory alloc] init];
    
    }
	return self;
    
}

#pragma mark -
#pragma mark CCNode Methods

- (void) update:(ccTime) dt
{
    KBGameLayer* gameLayer = ((KBGameLayer *)[[KBStandardGameController sharedController] gameLayer]);
    int mapPosX = 200;
    int mapPosY = 200;
    //int mapPosX = [gameLayer map].tileMap.mapSize.width * [gameLayer map].tileMap.tileSize.width;
    //int mapPosY = [gameLayer map].tileMap.mapSize.height * [gameLayer map].tileMap.tileSize.height;
    
    [self handleWalking];
    
    if (_centerPlayer)
    {
        [gameLayer setViewpointCenter:self.position];
    } else {
        [gameLayer setViewpointCenter:ccp(mapPosX, mapPosY)];
    }
}

#pragma mark -
#pragma mark MapChange Methods

- (void) updatePlayerForMapChange
{
    KBGameLayer* gameLayer = ((KBGameLayer *)[[KBStandardGameController sharedController] gameLayer]);
    _centerPlayer = [[gameLayer map] centerPlayer];
}

#pragma mark -
#pragma mark Walking

- (void) beginWalkingToSide:(Side) side
{
    if(self.isWalking && self.walkingTo == side)
        return;
    [self.sprite stopAllActions];
    
    self.isWalking = YES;
    
    _walkingTo = side;
    
    switch (side) {
        case Left:
            self.currentAnimation = _walkLeftAnimation;
            break;
        case Right:
            self.currentAnimation = _walkRightAnimation;
            break;
        case Up:
            self.currentAnimation = _walkUpAnimation;
            break;
        case Down:
            self.currentAnimation = _walkDownAnimation;
            break;
        default:
            @throw [NSException exceptionWithName:@"Unknown Parameter Value" 
                                           reason:@"For the requested Side is no Animation information available" 
                                         userInfo:nil];
            break;
    }
    
    [self.sprite runAction:self.currentAnimation];
    
}

- (void) stopWalking
{
    
    self.isWalking = NO;
    
    [self.sprite stopAllActions];
    
    
    switch (self.walkingTo) {
        case Left:
            self.currentAnimation = _stayLeftAnimation;
            break;
        case Right:
            self.currentAnimation = _stayRightAnimation;
            break;
        case Up:
            self.currentAnimation = _stayUpAnimation;
            break;
        case Down:
            self.currentAnimation = _stayDownAnimation;
            break;
        default:
            @throw [NSException exceptionWithName:@"Unknown Parameter Value" 
                                           reason:@"For the requested Side is no Animation information available" 
                                         userInfo:nil];
            break;
    }
    
    [self.sprite runAction:self.currentAnimation];
    
}

- (CCAction *) walkAnimationWithRow:(int) y 
                    startPosition:(int) xPos 
                      spriteCount:(int) count 
                             side:(int) side
{
    CCAnimation* walkAnimation = [CCAnimation animation];
    
    walkAnimation.delay = 0.45f;
    
    int frameCount = 0;
    
    for (int x = xPos; x < xPos + count; x++) {
        CCSpriteFrame* frame = [CCSpriteFrame frameWithTexture:[self.spriteBatchNode texture] 
                                                          rect:CGRectMake(x*39, y*37, 39, 37)];
        
        [walkAnimation addFrame:frame];
        
        frameCount++;
        
        if (frameCount == 30) {
            break;
        }
    }
    
    CCAnimate* walkAction = [CCAnimate actionWithAnimation:walkAnimation ];
    CCRepeatForever * repeat = [CCRepeatForever actionWithAction:walkAction];
    
    [repeat retain];
                                  
    return repeat;
}

- (void) handleWalking 
{  
    KBGameLayer* gameLayer = ((KBGameLayer *)[[KBStandardGameController sharedController] gameLayer]);
    CGPoint moveVector;
    
    if (self.isWalking) {
        switch (_walkingTo) {
            case Left:
                moveVector = ccp(-1,0);
                break;
            case Right:
                moveVector = ccp(1,0);
                break;
            case Up:
                moveVector = ccp(0,-1);
                break;
            case Down:
                moveVector = ccp(0,1);
                break;
            default:
                @throw [NSException exceptionWithName:@"Unknown Parameter Value" 
                                               reason:@"For the requested Side is no Animation information available" 
                                             userInfo:nil];
                break;
        }
        
        
        CGPoint arr[] = {
            [[gameLayer map].tileMap tileCoordForPosition:ccpAdd(
                   ccp(self.position.x - (self.sprite.textureRect.size.width / 2) - 7,self.position.y),
                   moveVector)],
            
            [[gameLayer map].tileMap tileCoordForPosition:ccpAdd(
                   ccp(self.position.x + (self.sprite.textureRect.size.width / 2),self.position.y)
                   , moveVector)],
            
            [[gameLayer map].tileMap tileCoordForPosition:ccpAdd(
                   ccp(self.position.x,self.position.y - (self.sprite.textureRect.size.height / 2)), 
                   moveVector)],
            
            [[gameLayer map].tileMap tileCoordForPosition: ccpAdd(
                   ccp(self.position.x,self.position.y + (self.sprite.textureRect.size.height / 6)), 
                   moveVector)]};
        
        BOOL canWalk = YES;
        for (int i = 0; i < 4; i++) 
        {
            NSDictionary* props = [[gameLayer map].tileMap metaInformationAtPosition:arr[i]];
            
            if([[props valueForKey:kCollidableProperty] isEqualToString:@"True"])
                canWalk = NO;
        }
        
        if (canWalk) {
            self.position = ccpAdd(self.position, moveVector);
        }
        
          
    }
}

#pragma mark -
#pragma mark NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.inventory = [aDecoder valueForKey:kInventoryKey];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder setValue:self.inventory forKey:kInventoryKey];
}
@end
