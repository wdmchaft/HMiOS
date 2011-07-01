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
#import "KBSEventFactory.h"
#import "KBInteractionHandler.h"
#import "KBGameMenuLayer.h"

// HelloWorldLayer
@interface KBGameLayer : CCLayer <KBInteractionHandlerDelegate>
{
    KBPlayer* _player;
    
    KBMap* _map;
    
    id<KBEvent> _currentEvent;
    
    NSDictionary* _currentMapObject;
    
    KBGameMenuLayer* _gameMenuLayer;
    
    KBInteractionHandler* _interactionHandler;
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, retain) KBMap* map;

@property (nonatomic, retain) KBPlayer* player;

@property (nonatomic, retain) id<KBEvent> currentEvent;

@property (nonatomic, retain) KBGameMenuLayer* gameMenuLayer;

@property (nonatomic, retain) KBInteractionHandler* interactionHandler;

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

-(void) loadMap:(NSString*)mapName playerPosition:(CGPoint)playerPosition withAnimation:(BOOL)animate;

#pragma mark -
#pragma mark Camera Handling

- (void) setViewpointCenter:(CGPoint) position;

#pragma mark -
#pragma mark Touch Events
-(void)shouldBeginMovingPlayerToSide:(Side)side;
-(void)shouldChangePlayerMovementToSide:(Side)side;
-(void)shouldStopPlayerMovement;
-(void)touchedAtScreenCoordinate:(CGPoint)screenCoordinate;
- (void) findAndRunEventAtPosition: (CGPoint) tilePosition interactionType:(RunOnEvent)runOnEvent;
@end
