//
//  SectionHeaderView.m
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SectionHeaderView.h"
#import "GameController.h"


@implementation SectionHeaderView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UIColor *backgroundColor = [UIColor colorWithRed:255/255.0f green:113/255.0f blue:68/255.0f alpha:1.0f];
        
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
        self.addField.textAlignment = NSTextAlignmentCenter;
        self.addField.borderStyle = UITextBorderStyleRoundedRect;
        self.addField.font = [UIFont fontWithName:@"Chalkduster" size:16];
        self.addField.delegate = self;
        self.addField.layer.borderWidth = 3.0;
        self.addField.layer.borderColor = [[UIColor whiteColor]CGColor];
        [self addSubview:self.addField];
        
        self.addButton = [UIButton new];
        self.addButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.addButton setTitle:@"+" forState:UIControlStateNormal];
        [self.addButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.addButton.titleLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
        self.addButton.backgroundColor = [UIColor greenColor];
        [self.addButton addTarget:self action:@selector(addButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        self.addButton.layer.borderWidth = 3.0;
        self.addButton.layer.borderColor = [[UIColor whiteColor]CGColor];
        [self addSubview:self.addButton];
        
        self.removeButton = [UIButton new];
        self.removeButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.removeButton setTitle:@"x" forState:UIControlStateNormal];
        [self.removeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.removeButton.titleLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
        self.removeButton.backgroundColor = [UIColor redColor];
        [self.removeButton addTarget:self action:@selector(removeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        self.removeButton.layer.borderWidth = 3.0;
        self.removeButton.layer.borderColor = [[UIColor whiteColor]CGColor];
        [self addSubview:self.removeButton];
        
        
        [self setUpConstraints];

        
    }
    
    return self;
    
}

- (void)updateWithGame:(Game *)game {
    
    self.game = game;
    
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_label, _addField, _addButton, _removeButton);
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_label(==45)]" options:0 metrics:nil views:viewsDictionary];
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[_label(==120)]-10-[_addField(==110)]-10-[_addButton(==45)]-10-[_removeButton(==45)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
    
    NSLayoutConstraint *equalConstraint = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.addField attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    NSLayoutConstraint *equalConstraintII = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.addButton attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    NSLayoutConstraint *equalConstraintIII = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.removeButton attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    self.addButton.layer.cornerRadius = 22.5;
    self.removeButton.layer.cornerRadius = 22.5;
    
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
    [self addConstraint:equalConstraint];
    [self addConstraint:equalConstraintII];
    [self addConstraint:equalConstraintIII];
    
    
    
}

+ (CGFloat)headerHeight {
    
    return 75;
    
}

- (void)updateWithTitle:(NSInteger)index {
    
    self.label.text = ((Game *)[GameController sharedInstance].games[index]).name;
    
}

- (void)addButtonPressed {
    
    [self.cell updateWithTitle:self.addField.text];
    
    [self.delegate addPlayerToGame:self.game];
}

- (void)removeButtonPressed {
    
    [self.delegate deleteButtonPressed:self.game];
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [textField becomeFirstResponder];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

@end
