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

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat dotCenterH = screenRect.size.width / 2;
    CGFloat dotCenterV = screenRect.size.height / 2;

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(dotCenterH - DotHalfWidth, dotCenterV - DotHalfWidth, DotMaxWidth, DotMaxWidth)];
    view.backgroundColor = [UIColor colorWithRed:0.13 green:0.75 blue:0.97 alpha:1];
    view.layer.cornerRadius = DotHalfWidth;

    [self.view addSubview:view];

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 1.0;
    scaleAnimation.repeatCount = HUGE_VAL;
//    scaleAnimation.autoreverses = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.2];

    [view.layer addAnimation:scaleAnimation forKey:@"scale"];
}

@end
