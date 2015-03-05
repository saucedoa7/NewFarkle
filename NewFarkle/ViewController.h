//
//  ViewController.h
//  NewFarkle
//
//  Created by Albert Saucedo on 2/13/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property NSMutableArray *dice;
@property NSMutableArray *diceInt;
@property NSMutableArray *currentPoints;
@property UILabel *labelOfDie;

@property int currentScore;
@property int playerOneScore;
@property int playerTwoSCore;

@end

