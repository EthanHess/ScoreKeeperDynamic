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
        self.label.text = @"Test Game";
        self.label.font = [UIFont fontWithName:@"Chalkduster" size:20];
        [self addSubview:self.label];
        
        self.saveButton = [UIButton new];
        self.saveButton.translatesAutoresizingMaskIntoConstraints = NO;
        self.saveButton.backgroundColor = [UIColor whiteColor];
        [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
        [self.saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:self.saveButton];
        
        self.clearButton = [UIButton new];
        self.clearButton.translatesAutoresizingMaskIntoConstraints = NO;
        self.clearButton.backgroundColor = [UIColor whiteColor];
        [self.clearButton setTitle:@"Clear" forState:UIControlStateNormal];
        [self.clearButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:self.clearButton];
        
        [self setUpConstraints];

        
    }
    
    return self;
    
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_label, _saveButton, _clearButton);
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_label(==45)]" options:0 metrics:nil views:viewsDictionary];
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_label(==150)]-30-[_saveButton(==50)]-30-[_clearButton(==50)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
    
    NSLayoutConstraint *equalConstraint = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.saveButton attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    NSLayoutConstraint *equalConstraintII = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.clearButton attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
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

@end
