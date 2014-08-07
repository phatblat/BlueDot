//
//  ViewController.m
//  BlueDotPulse
//
//  Created by Ben Chatelain on 8/7/14.
//  Copyright (c) 2014 Kaiser Permanente. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];

    // http://stackoverflow.com/questions/14104727/ios-animated-pulsing-circle-like-blue-ball-on-maps#answer-14104958
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
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
