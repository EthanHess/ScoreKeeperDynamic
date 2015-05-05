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
        [self.stepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.stepper];
    
        self.label = [UILabel new];
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        self.label.backgroundColor = [UIColor blueColor];
        self.label.textColor = [UIColor yellowColor];
        self.label.font = [UIFont fontWithName:@"Chalkduster" size:16];
        self.label.text = @"0";
        [self addSubview:self.label];
    
        self.nameLabel = [UILabel new];
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor blueColor];
        self.nameLabel.textColor = [UIColor yellowColor];
        self.nameLabel.text = @"";
        [self addSubview:self.nameLabel];
        
      
        [self setUpConstraints];
    
    }
    
    return self;
    
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_nameLabel, _label, _stepper);
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_nameLabel(==50)]" options:0 metrics:nil views:viewsDictionary];
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_nameLabel(==150)]-30-[_label(==50)]-30-[_stepper(==100)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
    
    NSLayoutConstraint *equalConstraint = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    NSLayoutConstraint *equalConstraintII = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.stepper attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
    [self addConstraint:equalConstraint];
    [self addConstraint:equalConstraintII];
    
    
}

- (void)stepperValueChanged:(id)sender {
    
    UIStepper *stepper = sender;
//    NSInteger index = stepper.tag;
    double value = stepper.value;
    self.label.text = [NSString stringWithFormat:@"%d", (int)value];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
