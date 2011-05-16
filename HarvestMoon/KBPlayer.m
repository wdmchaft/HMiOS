//
//  KBPlayer.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 14.05.11.
//  Copyright 2011 KBDevers. All rights reserved.
//

#import "KBPlayer.h"


@implementation KBPlayer
@synthesize sprite=_sprite;
@synthesize spriteBatchNode=_spriteBatch;
@synthesize walkUpAction = _walkUpAction;
@synthesize walkDownAction = _walkDownAction;
@synthesize walkLeftAction = _walkLeftAction;
@synthesize walkRightAction = _walkRightAction;
@synthesize currentAction = _currentAction;

- (id)init {
    self = [super init];
    if (self) {
        
        self.spriteBatchNode = [[CCSpriteBatchNode alloc] initWithFile:@"jack_walking.png" capacity:30];
        
        self.spriteBatchNode.position = ccp(100,100);
        
        //CCSpriteSheet* sheet = [CCSpriteSheet spriteSheetWithFile:@"myTest"];
        
        
        self.sprite = [CCSprite spriteWithTexture:[self.spriteBatchNode texture] rect:CGRectMake(0, 0, 39, 37)];
        
        [self.spriteBatchNode addChild:self.sprite];
        
        
        //
        
        [self initActions];
        
        [self.sprite runAction:self.walkDownAction];
        //[sprite runAction:self.walkRightAction]
        self.currentAction = self.walkDownAction;
        
        [self addChild:self.spriteBatchNode];
        
	}
	return self;

}

-(void)initActions
{
    self.walkLeftAction = [self initWalkActionWithRow:1 startPosition:1 spriteCount:2 side:Left];
    self.walkRightAction = [self initWalkActionWithRow:1 startPosition:4 spriteCount:2 side:Right];
    self.walkDownAction = [self initWalkActionWithRow:0 startPosition:1 spriteCount:2 side:Down];
    self.walkUpAction = [self initWalkActionWithRow:0 startPosition:4 spriteCount:2 side:Up];
}

-(CCAction *)initWalkActionWithRow:(int)y startPosition:(int)xPos spriteCount:(int)count side:(int)side
{
    CCSpawn* spawn;
    //CCSequence* sequence = [CCSequence actionWithDuration:1.f];
    CCAnimation* walkAnimation = [CCAnimation animation];
    
    walkAnimation.delay = 0.5f;
    
    
    
    int frameCount = 0;
    
    for (int x = xPos; x < xPos + count; x++) {
        CCSpriteFrame* frame = [CCSpriteFrame frameWithTexture:[self.spriteBatchNode texture] rect:CGRectMake(x*39, y*37, 39, 37)];
            
        [walkAnimation addFrame:frame];
            
        frameCount++;
            
        if (frameCount == 30) {
            break;
        }
    }
    
    CCAnimate* walkAction = [CCAnimate actionWithAnimation:walkAnimation ];
    
    int x = 0;
    int yCoord = 0;
    int speed = 40;
    
    switch (side) {
        case Left:
            x = -speed;
            break;
        case Right:
            x = speed;
            break;
        case Up:
            yCoord = speed;
            break;
        case Down:
            yCoord = -speed;
            break;
        default:
            break;
    }
    CCMoveBy* moveAction = [CCMoveBy actionWithDuration:1.f position:CGPointMake(x, yCoord)];
    
    //[sequence initOne:walkAction two:moveAction];
    
    spawn = [CCSpawn actions:moveAction, walkAction, nil];
    
    
    CCRepeatForever * repeat = [CCRepeatForever actionWithAction:spawn];
    
    
    
    return repeat;
}

-(void)walkToSide:(int)side
{
    
    [self.sprite stopAction:self.currentAction];
    switch (side) {
        case Left:
            self.currentAction = self.walkLeftAction;
            
            
            break;
        case Right:
            self.currentAction = self.walkRightAction;
            break;
            
        case Up:
            self.currentAction = self.walkUpAction;
            break;
            
        case Down:
            self.currentAction = self.walkDownAction;
            break;
            
        default:
            break;
    }
    
    [self.sprite runAction:self.currentAction];
}

-(void)setPosition:(CGPoint)point {
    [[KBStandardGameController sharedController] setViewpointCenter:point];
    [super setPosition:point];
}

@end
