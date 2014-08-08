//
//  ViewController.m
//  BlueDotPulse
//
//  Created by Ben Chatelain on 8/7/14.
//  Copyright (c) 2014 Kaiser Permanente. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

CGFloat const DotMaxWidth = 100;
CGFloat const DotHalfWidth = DotMaxWidth / 2;
CGFloat const WhiteDiscWidth = 30;
CGFloat const WhiteDiscHalfWidth = WhiteDiscWidth / 2;

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat dotCenterH = screenRect.size.width / 2;
    CGFloat dotCenterV = screenRect.size.height / 2;

    // Blue pulsing disc
    UIView *pulseDisc = [[UIView alloc] initWithFrame:CGRectMake(dotCenterH - DotHalfWidth, dotCenterV - DotHalfWidth, DotMaxWidth, DotMaxWidth)];
    pulseDisc.backgroundColor = [UIColor colorWithRed:0.13 green:0.75 blue:0.97 alpha:1];
    pulseDisc.layer.cornerRadius = DotHalfWidth;

    [self.view addSubview:pulseDisc];

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 3.0;
    scaleAnimation.repeatCount = HUGE_VAL;
    //    scaleAnimation.autoreverses = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.2];
    [pulseDisc.layer addAnimation:scaleAnimation forKey:@"scale"];

    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.duration = 3.0;
    fadeAnimation.repeatCount = HUGE_VAL;
    //    fadeAnimation.autoreverses = YES;
    fadeAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    fadeAnimation.toValue = [NSNumber numberWithFloat:0.0];
    [pulseDisc.layer addAnimation:fadeAnimation forKey:@"fade"];

    // White middle disc
    UIView *whiteDisc = [[UIView alloc] initWithFrame:CGRectMake(dotCenterH - WhiteDiscHalfWidth, dotCenterV - WhiteDiscHalfWidth, WhiteDiscWidth, WhiteDiscWidth)];
    whiteDisc.backgroundColor = [UIColor whiteColor];
    whiteDisc.layer.cornerRadius = WhiteDiscHalfWidth;
    whiteDisc.layer.shadowColor = [UIColor blackColor].CGColor;
    whiteDisc.layer.shadowOffset = CGSizeZero;
    whiteDisc.layer.shadowRadius = 5.0;
    whiteDisc.layer.shadowOpacity = 0.5;

    [self.view addSubview:whiteDisc];
}

@end
