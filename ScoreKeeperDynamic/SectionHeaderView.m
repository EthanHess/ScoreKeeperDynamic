//
//  SectionHeaderView.m
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SectionHeaderView.h"

@implementation SectionHeaderView 

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UIColor *backgroundColor = [UIColor colorWithRed:89.0/255.0 green:169.0/255.0 blue:223.0/255.0 alpha:1.0];
        
        self.backgroundColor = backgroundColor;
        
        self.label = [UILabel new];
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        self.label.backgroundColor = backgroundColor;
        self.label.textColor = [UIColor whiteColor];
        self.label.font = [UIFont fontWithName:@"Chalkduster" size:20];
        [self addSubview:self.label];
        
        self.addField = [UITextField new];
        self.addField.translatesAutoresizingMaskIntoConstraints = NO;
        self.addField.backgroundColor = [UIColor lightGrayColor];
        self.addField.textColor = [UIColor blueColor];
        self.addField.placeholder = @"Add Player"; 
        self.addField.font = [UIFont fontWithName:@"Chalkduster" size:16];
        self.addField.delegate = self;
        [self addSubview:self.addField];
        
        self.addButton = [UIButton new];
        self.addButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.addButton setTitle:@"Add" forState:UIControlStateNormal];
        [self.addButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.addButton.titleLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
        self.addButton.backgroundColor = [UIColor greenColor];
        [self addSubview:self.addButton];
        
        
        [self setUpConstraints];

        
    }
    
    return self;
    
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_label, _addField, _addButton);
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_label(==45)]" options:0 metrics:nil views:viewsDictionary];
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[_label(==130)]-15-[_addField(==130)]-15-[_addButton(==50)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
    
    NSLayoutConstraint *equalConstraint = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.addField attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    NSLayoutConstraint *equalConstraintII = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.addButton attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
    [self addConstraint:equalConstraint];
    [self addConstraint:equalConstraintII];
    
    
    
}

+ (CGFloat)headerHeight {
    
    return 75;
    
}

- (void)updateWithTitle:(NSInteger)index {
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [textField becomeFirstResponder];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

@end
