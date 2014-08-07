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

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat dotCenterH = screenRect.size.width / 2;
    CGFloat dotCenterV = screenRect.size.height / 2;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(dotCenterH - DotMaxWidth / 2, dotCenterV - DotMaxWidth / 2, DotMaxWidth, DotMaxWidth)];
    view.backgroundColor = [UIColor blueColor];
    view.layer.cornerRadius = 50;

    [self.view addSubview:view];

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 0.2;
    scaleAnimation.repeatCount = HUGE_VAL;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.2];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.8];

    [view.layer addAnimation:scaleAnimation forKey:@"scale"];
}

@end
