//
//  SectionHeaderView.h
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *addField; 

+ (CGFloat)headerHeight;

- (void)updateWithTitle:(NSInteger)index;

@end
