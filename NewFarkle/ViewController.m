//
//  ViewController.m
//  NewFarkle
//
//  Created by Albert Saucedo on 2/13/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController ()<DieLabelDelegate>
@property IBOutlet DieLabel *lblDieLabel1;
@property IBOutlet DieLabel *lblDieLabel2;
@property IBOutlet DieLabel *lblDieLabel3;
@property IBOutlet DieLabel *lblDieLabel4;
@property IBOutlet DieLabel *lblDieLabel5;
@property IBOutlet DieLabel *lblDieLabel6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // When the DieLabel becomes the labels delegate the label object runs all the methods in DieLabel.m as its own methods

    self.lblDieLabel1.delegate = self;
    self.lblDieLabel2.delegate = self;
    self.lblDieLabel3.delegate = self;
    self.lblDieLabel4.delegate = self;
    self.lblDieLabel5.delegate = self;
    self.lblDieLabel6.delegate = self;

    self.dice = [NSMutableArray new];
}

-(void)didChooseDie:(id)dieLabel{

    self.labelOfDie = dieLabel;
    [self.dice addObject:self.labelOfDie.text];
    NSLog(@"SHowing all Dice %@" , self.dice);
}

- (IBAction)onRollButtonPressed:(id)sender {

    for (DieLabel *label in self.view.subviews) {
        if ([label isKindOfClass:([DieLabel class])]) {
            if (label.isUserInteractionEnabled) {
                [label roll];
            }
        }
    }
}

@end
