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
@property (strong, nonatomic) IBOutlet UILabel *lblPlayerTwoScore;
@property (strong, nonatomic) IBOutlet UILabel *lblPlayerOneScore;

@property (weak, nonatomic) IBOutlet UILabel *lblCurrentScore;
@property int playersTurn;
@property int sumOfSelectedDice;
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
    self.currentPoints = [NSMutableArray new];
    self.playersTurn = 1;
}

- (void)resetLabels {
    for (DieLabel *label in self.view.subviews) {
        if ([label isKindOfClass:([DieLabel class])]) {
            [self.currentPoints removeAllObjects];
            [self.dice removeAllObjects];
            label.text = @"-";
            label.backgroundColor = [UIColor colorWithRed:0.93 green:0.94 blue:1 alpha:1];
            label.userInteractionEnabled = YES;
        }
    }
}

-(void)didChooseDie:(id)dieLabel{
    self.labelOfDie = dieLabel;

    if ([self.labelOfDie.text isEqualToString:@"1"]) {
        [self.dice addObject:@1];
    } else if ([self.labelOfDie.text isEqualToString:@"2"]) {
        [self.dice addObject:@2];
    } else if ([self.labelOfDie.text isEqualToString:@"3"]) {
        [self.dice addObject:@3];
    } else if ([self.labelOfDie.text isEqualToString:@"4"]) {
        [self.dice addObject:@4];
    } else if ([self.labelOfDie.text isEqualToString:@"5"]) {
        [self.dice addObject:@5];
    } else if ([self.labelOfDie.text isEqualToString:@"6"]) {
        [self.dice addObject:@6];
    }

    NSArray * ones = @[@1, @1, @1];
    NSArray * twos = @[@2, @2, @2];
    NSArray * threes = @[@3, @3, @3];
    NSArray * fours = @[@4, @4, @4];
    NSArray * fives = @[@5, @5, @5];
    NSArray * sixes = @[@6, @6, @6];

    NSNumber *one = [NSNumber numberWithInteger:1];
    NSNumber *five = [NSNumber numberWithInteger:5];

    if ([self.dice containsObject:one]) {
        [self.currentPoints addObject:@100];
    }

    if ([self.dice containsObject:five]) {
        [self.currentPoints addObject:@50];
    }

    if ([self.dice isEqualToArray:ones]) {
        [self.currentPoints addObject:@700];
        [self.dice removeAllObjects];
    }

    if ([self.dice isEqualToArray:twos]) {
        [self.currentPoints addObject:@200];
    }
    if ([self.dice isEqualToArray:threes]) {
        [self.currentPoints addObject:@300];
    }
    if ([self.dice isEqualToArray:fours]) {
        [self.currentPoints addObject:@400];
    }

    if ([self.dice isEqualToArray:fives]) {
        [self.currentPoints addObject:@350];
        [self.dice removeAllObjects];
    }

    if ([self.dice isEqualToArray:sixes]) {
        [self.currentPoints addObject:@600];
    }

    self.sumOfSelectedDice = 0;
    for (NSNumber *n in self.currentPoints) {
        self.sumOfSelectedDice += [n intValue];
        NSLog(@"Current score is %d", self.sumOfSelectedDice);
    }

    NSLog(@"Showing selected Dice %@" , self.dice);
    NSLog(@"Showing Current Points %d" , self.sumOfSelectedDice);

    self.lblCurrentScore.text = [NSString stringWithFormat:@"%d", self.sumOfSelectedDice];


    if ([self.dice count] == 6) {
        NSLog(@"Hot DICE!!!");
        [self resetLabels];
    }
}

- (IBAction)onRollButtonPressed:(id)sender {
    [self.dice removeAllObjects];

    for (DieLabel *label in self.view.subviews) {
        if ([label isKindOfClass:([DieLabel class])]) {
            if (label.isUserInteractionEnabled) {
                [label roll];
            }
        }
    }
}

- (void)movebankButton:(UIButton *)sender {
    CGRect buttonFrame = sender.frame;

    if (buttonFrame.origin.x == 16) {
        buttonFrame.origin.x = 238;
        sender.titleLabel.textColor = [UIColor colorWithRed:0.76 green:0.03 blue:0.07 alpha:1];
        sender.backgroundColor = [UIColor colorWithRed:0.99 green:0.11 blue:0.23 alpha:1];
        sender.frame = buttonFrame;
    } else if (buttonFrame.origin.x == 238) {
        buttonFrame.origin.x = 16;
        sender.titleLabel.textColor = [UIColor colorWithRed:0.05 green:0.29 blue:0.95 alpha:1];
        sender.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
        sender.frame = buttonFrame;
    }
}

- (IBAction)onBankPoints:(UIButton *)sender {

    self.lblCurrentScore.text = @"0";
    [self resetLabels];

    if (self.playersTurn == 1) {
        NSLog(@"It's P1 turn");
        [self movebankButton:sender];
        self.playerOneScore = self.playerOneScore + self.sumOfSelectedDice;
        self.lblPlayerOneScore.text = [NSString stringWithFormat:@"%d", self.playerOneScore];
        self.playersTurn  = 2;
    } else if (self.playersTurn == 2){
        NSLog(@"It's P2 turn");
        [self movebankButton:sender];
        self.playerTwoScore = self.playerTwoScore + self.sumOfSelectedDice;
        self.lblPlayerOneScore.text = [NSString stringWithFormat:@"%d", self.playerTwoScore];
        self.playersTurn  = 1;
    }
    
}
@end
