//
//  TableViewCell.m
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
    self.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:163.0/255.0 blue:191.0/255.0 alpha:1.0];
        
    [self setUpConstraints];
    
    self.stepper = [UIStepper new];
    [self addSubview:self.stepper];
    
    self.label = [UILabel new];
    self.label.backgroundColor = [UIColor blueColor];
    self.label.textColor = [UIColor yellowColor];
    self.label.font = [UIFont fontWithName:@"Chalkduster" size:16];
    [self addSubview:self.label];
    
    self.textField = [UITextField new];
    self.textField.placeholder = @"enter name";
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.textField.font = [UIFont fontWithName:@"Chalkduster" size:16];
    [self addSubview:self.textField];
        
    
    }
    
    return self;
    
}

- (void)setUpConstraints {
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
