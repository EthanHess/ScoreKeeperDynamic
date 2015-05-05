//
//  GameController.m
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/4/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "GameController.h"
#import "Stack.h"

@implementation GameController

+ (GameController *)sharedInstance {
    static GameController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [GameController new];
    });
    
    return sharedInstance;
    
}

- (NSArray *)games {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Game"];
    
    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return objects;
    
}

- (void)addGameWithName:(NSString *)name {
    
    Game *game = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    game.name = name;
    [self synchronize];
    
}

- (void)addPlayerWithName:(NSString *)name toGame:(Game *)game {
    
    Player *player = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    player.game = game;
    
    [self synchronize];
    
}

- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
    
}



@end
