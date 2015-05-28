//
//  SectionHeaderView.h
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "TableViewCell.h"

@protocol GameDelegate <NSObject>

@required

- (void)deleteButtonPressed:(Game *)game;
- (void)addPlayer;

@end

@interface SectionHeaderView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *addField;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *removeButton; 
@property (nonatomic, strong) Game *game;
@property (nonatomic, strong) id <GameDelegate> delegate;
@property (nonatomic, strong) TableViewCell *cell; 

+ (CGFloat)headerHeight;
- (void)updateWithGame:(Game *)game;
- (void)updateWithTitle:(NSInteger)index;

@end
