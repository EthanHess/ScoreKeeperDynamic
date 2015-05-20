//
//  Player.h
//  
//
//  Created by Ethan Hess on 5/20/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Game;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * score;
@property (nonatomic, retain) Game *game;

@end
