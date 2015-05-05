//
//  GameController.h
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/4/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Game.h"

@interface GameController : NSObject

@property (nonatomic, strong, readonly) NSArray *games;
@property (nonatomic, strong, readonly) NSArray *players;
@property (nonatomic, strong) Player *player;
@property (nonatomic, strong) Game *game;

+ (GameController *)sharedInstance;

@end
