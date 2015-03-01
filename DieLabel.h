//
//  DieLabel.h
//  NewFarkle
//
//  Created by Albert Saucedo on 2/13/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate

-(void)didChooseDie:(id)dieLabel;

@end

@interface DieLabel : UILabel

-(void)roll;

@property id <DieLabelDelegate> delegate;

@end
