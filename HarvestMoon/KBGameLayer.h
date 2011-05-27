//
//  HelloWorldLayer.h
//  HarvestMoon
//
//  Created by Maurus KŸhne on 14.05.11.
//  Copyright KBDevers 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "KBPlayer.h"
#import "KBStandardGameController.h"
#import "KBMap.h"
#import "KBGameLayer.h"
#import "GameConfig.h"
#import "KBStoryController.h"
#import "KBSEventFactory.h"
#import "KBTouchHandlerProtocol.h"
#import "KBTouchHandler.h"

// HelloWorldLayer
@interface KBGameLayer : CCLayer <KBTouchHandlerProtocol>
{
    KBPlayer* _player;
    
    KBMap* _map;
    
    id<KBEvent> _currentEvent;
    
    NSDictionary* _currentMapObject;
    
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) KBMap* map;

@property (nonatomic, retain) KBPlayer* player;

@property (nonatomic, retain) id<KBEvent> currentEvent;

#pragma mark -
#pragma mark Class Methods

// returns a CCScene that contains the HelloWorldLayer as the only child
+ (CCScene *) scene;

#pragma mark -
#pragma mark Init & Dealloc

- (id) init;

- (void) dealloc;

#pragma mark -
#pragma mark Update Logic

- (void) update:(ccTime) dt;

-(void) loadMap:(NSString*)mapName withAnimation:(BOOL)animate;

#pragma mark -
#pragma mark Camera Handling

- (void) setViewpointCenter:(CGPoint) position;

#pragma mark -
#pragma mark Touch Events
-(void)shouldBeginMovingPlayerToSide:(Side)side;
-(void)shouldChangePlayerMovementToSide:(Side)side;
-(void)shouldStopPlayerMovement;

@end
