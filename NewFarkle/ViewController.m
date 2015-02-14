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

    NSLog(@"rando is %ld", (long)randoNumber);
    return randoNumber;
}

-(IBAction)onDie1Tapped:(id)sender{
    self.lblDieLabel1.text = [NSString stringWithFormat:@"%d", [self roll]];
}

-(IBAction)onDie2Tapped:(id)sender{
    self.lblDieLabel2.text = [NSString stringWithFormat:@"%d", [self roll]];
}

-(IBAction)onDie3Tapped:(id)sender{
    self.lblDieLabel3.text = [NSString stringWithFormat:@"%d", [self roll]];
}

-(IBAction)onDie4Tapped:(id)sender{
    self.lblDieLabel4.text = [NSString stringWithFormat:@"%d", [self roll]];
}

-(IBAction)onDie5Tapped:(id)sender{
    self.lblDieLabel5.text = [NSString stringWithFormat:@"%d", [self roll]];
}

-(IBAction)onDie6Tapped:(id)sender{
    self.lblDieLabel6.text = [NSString stringWithFormat:@"%d", [self roll]];
}
@end
