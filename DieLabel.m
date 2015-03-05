//
//  DieLabel.m
//  NewFarkle
//
//  Created by Albert Saucedo on 2/13/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];

    if (self) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(onDieTapped:)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}

-(IBAction)onDieTapped:(UITapGestureRecognizer *)sender{

    NSLog(@"onDieTapped:");

    if (![self.text isEqualToString:@"-"]) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0.16 alpha:1];
        [self.delegate didChooseDie:self];
    }
}

-(void)roll{
    int randoNumber = 2; //arc4random()%6+1;
    NSString *dieNumberLabel = [NSString stringWithFormat:@"%d", randoNumber];
    self.text = dieNumberLabel;
}

@end
