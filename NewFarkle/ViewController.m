//
//  ViewController.m
//  NewFarkle
//
//  Created by Albert Saucedo on 2/13/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(int)roll{
    int randoNumber = arc4random()%6+1;
    return randoNumber;
}

-(IBAction)onDie1Tapped:(id)sender{
    self.lblDieLabel1.userInteractionEnabled = NO;
    self.lblDieLabel1.backgroundColor = [UIColor colorWithRed:0.22 green:0.3 blue:0.44 alpha:1];
}

-(IBAction)onDie2Tapped:(id)sender{
    self.lblDieLabel2.userInteractionEnabled = NO;
    self.lblDieLabel2.backgroundColor = [UIColor colorWithRed:0.22 green:0.3 blue:0.44 alpha:1];
}

-(IBAction)onDie3Tapped:(id)sender{
    self.lblDieLabel3.userInteractionEnabled = NO;
    self.lblDieLabel3.backgroundColor = [UIColor colorWithRed:0.22 green:0.3 blue:0.44 alpha:1];
}

-(IBAction)onDie4Tapped:(id)sender{
    self.lblDieLabel4.userInteractionEnabled = NO;
    self.lblDieLabel4.backgroundColor = [UIColor colorWithRed:0.22 green:0.3 blue:0.44 alpha:1];
}

-(IBAction)onDie5Tapped:(id)sender{
    self.lblDieLabel5.userInteractionEnabled = NO;
    self.lblDieLabel5.backgroundColor = [UIColor colorWithRed:0.22 green:0.3 blue:0.44 alpha:1];
}

-(IBAction)onDie6Tapped:(id)sender{
    self.lblDieLabel6.userInteractionEnabled = NO;
    self.lblDieLabel6.backgroundColor = [UIColor colorWithRed:0.22 green:0.3 blue:0.44 alpha:1];
}

- (IBAction)onRollButtonPressed:(id)sender {

    if (self.lblDieLabel1.userInteractionEnabled == NO) {

    } else {
        self.lblDieLabel1.text = [NSString stringWithFormat:@"%d", [self roll]];
    }

    if (self.lblDieLabel2.userInteractionEnabled == NO) {

    } else {
        self.lblDieLabel2.text = [NSString stringWithFormat:@"%d", [self roll]];
    }
    if (self.lblDieLabel3.userInteractionEnabled == NO) {

    } else {
        self.lblDieLabel3.text = [NSString stringWithFormat:@"%d", [self roll]];
    }
    if (self.lblDieLabel4.userInteractionEnabled == NO) {

    } else {
        self.lblDieLabel4.text = [NSString stringWithFormat:@"%d", [self roll]];
    }
    if (self.lblDieLabel5.userInteractionEnabled == NO) {

    } else {
        self.lblDieLabel5.text = [NSString stringWithFormat:@"%d", [self roll]];
    }
    if (self.lblDieLabel6.userInteractionEnabled == NO) {

    } else {
        self.lblDieLabel6.text = [NSString stringWithFormat:@"%d", [self roll]];
    }


}

@end
