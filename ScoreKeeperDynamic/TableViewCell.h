//
//  TableViewCell.h
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIStepper *stepper;
@property (nonatomic, strong) UILabel *nameLabel;

- (void)updateWithTitle:(NSString *)title;

@end
