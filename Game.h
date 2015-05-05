//
//  Game.h
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/5/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Player;

@interface Game : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Player *players;

@end
