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
    
        self.backgroundColor = [UIColor colorWithRed:255/255.0f green:253/255.0f blue:166/255.0f alpha:1.0f];
    
        self.stepper = [UIStepper new];
        self.stepper.translatesAutoresizingMaskIntoConstraints = NO;
        self.stepper.backgroundColor = [UIColor greenColor];
        [self.stepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventTouchUpInside];
        self.stepper.layer.borderWidth = 3.0;
        self.stepper.layer.borderColor = [[UIColor blueColor]CGColor];
        [self addSubview:self.stepper];
    
        self.label = [UILabel new];
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        self.label.backgroundColor = [UIColor colorWithRed:125/255.0f green:182/255.0f blue:244/255.0f alpha:1.0f];
        self.label.textColor = [UIColor yellowColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont fontWithName:@"Chalkduster" size:20];
        self.label.text = @"0";
        self.label.layer.borderWidth = 3.0;
        self.label.layer.borderColor = [[UIColor blueColor]CGColor];
        [self addSubview:self.label];
    
        
        self.nameLabel = [UILabel new];
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.nameLabel.backgroundColor = [UIColor colorWithRed:125/255.0f green:182/255.0f blue:244/255.0f alpha:1.0f];
        self.nameLabel.textColor = [UIColor yellowColor];
        self.nameLabel.text = @"";
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.font = [UIFont fontWithName:@"Chalkduster" size:20];
        self.nameLabel.layer.borderWidth = 3.0;
        self.nameLabel.layer.borderColor = [[UIColor blueColor]CGColor];
        [self addSubview:self.nameLabel];
        
      
        [self setUpConstraints];
    
    }
    
    return self;
    
}

- (void)setUpConstraints {
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_nameLabel, _label, _stepper);
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_nameLabel(==50)]" options:0 metrics:nil views:viewsDictionary];
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_nameLabel(==150)]-30-[_label(==50)]-30-[_stepper(==90)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
    
    NSLayoutConstraint *equalConstraint = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    NSLayoutConstraint *equalConstraintII = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.stepper attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0];
    
    self.label.layer.cornerRadius = 25;
    self.label.layer.masksToBounds = YES;
    self.nameLabel.layer.cornerRadius = 25;
    self.nameLabel.layer.masksToBounds = YES;
    self.stepper.layer.cornerRadius = 15;
    self.stepper.layer.masksToBounds = YES; 
    
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

- (void)updateWithTitle:(NSString *)title {
    
    self.label.text = title;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
