//
//  KBPlayer.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 14.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBPlayer.h"
#import "KBGameLayer.h"

@implementation KBPlayer
@synthesize sprite=_sprite;
@synthesize spriteBatchNode=_spriteBatch;
@synthesize currentAnimation = _currentAnimation;
@synthesize isWalking = _walking;
@synthesize walkingTo = _walkingTo;
- (id)init {
    self = [super init];
    if (self) {
        
        self.spriteBatchNode = [[CCSpriteBatchNode alloc] initWithFile:@"jack_walking.png" capacity:30];
        
        
        //CCSpriteSheet* sheet = [CCSpriteSheet spriteSheetWithFile:@"myTest"];
        
        
        self.sprite = [CCSprite spriteWithTexture:[self.spriteBatchNode texture] rect:CGRectMake(0, 0, 39, 37)];
        
        [self.spriteBatchNode addChild:self.sprite];
        
        
        _walkingSpeed = 10;
        
        
        //[self.sprite runAction:self.walkDownAction];
        //[sprite runAction:self.walkRightAction]
        //self.currentAction = self.walkDownAction;
        
        [self addChild:self.spriteBatchNode];
        
        [self.sprite runAction:[CCScaleBy actionWithDuration:0.1f scale:1.5f]];
        
        
        [self scheduleUpdate];
        
	}
	return self;

}

-(void) update:(ccTime)dt
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
        
        
        CGPoint pointOnMap = [[gameLayer map] tileCoordForPosition:ccpAdd(self.position, moveVector)];
        
        NSDictionary* props = [[gameLayer map] metaInformationAtPosition:pointOnMap];
        
        if([[props valueForKey:kCollidableProperty] isEqualToString:@"True"])
        {
            NSLog(@"can't move further!");
        }
        else
        {
            self.position = ccpAdd(self.position, moveVector);
        }
            
        
    }
    
    
    [gameLayer setViewpointCenter:self.position];
}

-(void)beginWalkingToSide:(Side)side
{
    self.isWalking = YES;
    
    _walkingTo = side;
    
    switch (side) {
        case Left:
            self.currentAnimation = [self walkAnimationWithRow:1 startPosition:1 spriteCount:2 side:Left];
            break;
        case Right:
            self.currentAnimation = [self walkAnimationWithRow:1 startPosition:4 spriteCount:2 side:Right];
            break;
        case Up:
            self.currentAnimation = [self walkAnimationWithRow:0 startPosition:1 spriteCount:2 side:Up];
            break;
        case Down:
            self.currentAnimation = [self walkAnimationWithRow:0 startPosition:4 spriteCount:2 side:Down];
            break;
        default:
            @throw [NSException exceptionWithName:@"Unknown Parameter Value" 
                                           reason:@"For the requested Side is no Animation information available" 
                                         userInfo:nil];
            break;
    }
    
    [self.sprite runAction:self.currentAnimation];
    
}

-(void)stopWalking
{
    self.isWalking = NO;
    [self.sprite stopAction:self.currentAnimation];
    self.currentAnimation = nil;
    
    switch (self.walkingTo) {
        case Left:
            self.currentAnimation = [self walkAnimationWithRow:1 startPosition:0 spriteCount:1 side:Left];
            break;
        case Right:
            self.currentAnimation = [self walkAnimationWithRow:1 startPosition:3 spriteCount:1 side:Right];
            break;
        case Up:
            self.currentAnimation = [self walkAnimationWithRow:0 startPosition:0 spriteCount:1 side:Up];
            break;
        case Down:
            self.currentAnimation = [self walkAnimationWithRow:0 startPosition:3 spriteCount:1 side:Down];
            break;
        default:
            @throw [NSException exceptionWithName:@"Unknown Parameter Value" 
                                           reason:@"For the requested Side is no Animation information available" 
                                         userInfo:nil];
            break;
    }
    
    [self.sprite runAction:self.currentAnimation];
    
}

-(CCAction *)walkAnimationWithRow:(int)y startPosition:(int)xPos spriteCount:(int)count side:(int)side
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
    
    return repeat;
}


@end
