//
//  HelloWorldLayer.m
//  HarvestMoon
//
//  Created by Maurus Kühne on 14.05.11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "GameLayer.h"

// HelloWorldLayer implementation
@implementation GameLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        _player = [[KBPlayer alloc] init];
        
        [self addChild:_player];
        
        self.isTouchEnabled = YES;
        
        
        }
    return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    
    
    CGPoint location = [touch locationInView:[touch view]];
    
    int width =[[CCDirector sharedDirector] winSize].width;
    int height =[[CCDirector sharedDirector] winSize].height;
    
    CGPoint middlePoint = CGPointMake(width/2, height/2);
    CGPoint lo = CGPointMake(0, 0);
    CGPoint lu = CGPointMake(0, height);
    CGPoint ro = CGPointMake(width, 0);
    CGPoint ru = CGPointMake(width, height);
    
    //left
    if ([self CGPoint:location inTriangleP1:lu P2:lo P3:middlePoint]) {
        [_player walkToSide:Left];
    }
    if ([self CGPoint:location inTriangleP1:ru P2:ro P3:middlePoint]) {
        [_player walkToSide:Right];
    }
    if ([self CGPoint:location inTriangleP1:lo P2:ro P3:middlePoint]) {
        [_player walkToSide:Up];
    }
    if ([self CGPoint:location inTriangleP1:lu P2:ru P3:middlePoint]) {
        [_player walkToSide:Down];
    }
    
    NSLog(@"TOUCH");
    
    
}

-(CGFloat) GBDot:(CGPoint)v1 point2:(CGPoint)v2
{
    return v1.x * v2.x + v1.y * v2.y;
}

-(CGPoint) GBSub:(CGPoint)v1 point2:(CGPoint)v2
{
    return CGPointMake(v1.x - v2.x, v1.y - v2.y);
}

-(BOOL) CGPoint:(CGPoint)point inTriangleP1:(CGPoint)p1 P2:(CGPoint)p2 P3:(CGPoint)p3
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

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
