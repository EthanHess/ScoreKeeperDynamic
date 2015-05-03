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
    
        self.stepper = [UIStepper new];
        self.stepper.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.stepper];
    
        self.label = [UILabel new];
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        self.label.backgroundColor = [UIColor blueColor];
        self.label.textColor = [UIColor yellowColor];
        self.label.font = [UIFont fontWithName:@"Chalkduster" size:16];
        self.label.text = @"0";
        [self addSubview:self.label];
    
        self.textField = [UITextField new];
        self.textField.delegate = self; 
        self.textField.translatesAutoresizingMaskIntoConstraints = NO;
        self.textField.placeholder = @"enter name";
        self.textField.backgroundColor = [UIColor lightGrayColor];
        self.textField.font = [UIFont fontWithName:@"Chalkduster" size:16];
        [self addSubview:self.textField];
      
        [self setUpConstraints];
    
    }
    
    return self;
    
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_textField, _label, _stepper);
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_textField(==50)]" options:0 metrics:nil views:viewsDictionary];
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_textField(==150)]-30-[_label(==50)]-30-[_stepper(==100)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
    
    NSLayoutConstraint *equalConstraint = [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    NSLayoutConstraint *equalConstraintII = [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.stepper attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
    [self addConstraint:equalConstraint];
    [self addConstraint:equalConstraintII];
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [textField becomeFirstResponder];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
