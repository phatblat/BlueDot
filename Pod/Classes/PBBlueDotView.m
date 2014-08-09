//
//  PBBlueDotView.m
//  BlueDot
//
//  Created by Ben Chatelain on 8/8/14.
//  Copyright (c) 2014 Ben Chatelain.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "PBBlueDotView.h"
#import <QuartzCore/QuartzCore.h>

CGFloat const DotMaxWidth = 100;
CGFloat const DotHalfWidth = DotMaxWidth / 2;
CGFloat const WhiteDiscWidth = 30;
CGFloat const WhiteDiscHalfWidth = WhiteDiscWidth / 2;
CGFloat const BlueDotMaxWidth = 20;
CGFloat const BlueDotHalfWidth = BlueDotMaxWidth / 2;

@implementation PBBlueDotView

#pragma mark - NSObject <NSCoder>

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        [self initPrivate];
    }
    return self;
}

#pragma mark - UIView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initPrivate];
    }
    return self;
}

#pragma mark - Common Initialization

- (void)initPrivate
{
    CGRect screenRect = self.bounds;
    CGFloat dotCenterH = screenRect.size.width / 2;
    CGFloat dotCenterV = screenRect.size.height / 2;

    // Blue pulsing disc
    UIView *pulseDisc = [[UIView alloc] initWithFrame:CGRectMake(dotCenterH - DotHalfWidth, dotCenterV - DotHalfWidth, DotMaxWidth, DotMaxWidth)];
    pulseDisc.backgroundColor = [UIColor colorWithRed:0.16 green:0.55 blue:0.98 alpha:1];
    pulseDisc.layer.cornerRadius = DotHalfWidth;

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 3.0;
    scaleAnimation.repeatCount = HUGE_VAL;
    //    scaleAnimation.autoreverses = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.3];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    [pulseDisc.layer addAnimation:scaleAnimation forKey:@"scale"];

    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.duration = 3.0;
    fadeAnimation.repeatCount = HUGE_VAL;
    //    fadeAnimation.autoreverses = YES;
    fadeAnimation.fromValue = [NSNumber numberWithFloat:0.8];
    fadeAnimation.toValue = [NSNumber numberWithFloat:0.0];
    [pulseDisc.layer addAnimation:fadeAnimation forKey:@"fade"];

    [self addSubview:pulseDisc];

    // White middle disc
    UIView *whiteDisc = [[UIView alloc] initWithFrame:CGRectMake(dotCenterH - WhiteDiscHalfWidth, dotCenterV - WhiteDiscHalfWidth, WhiteDiscWidth, WhiteDiscWidth)];
    whiteDisc.backgroundColor = [UIColor whiteColor];
    whiteDisc.layer.cornerRadius = WhiteDiscHalfWidth;
    whiteDisc.layer.shadowColor = [UIColor blackColor].CGColor;
    whiteDisc.layer.shadowOffset = CGSizeZero;
    whiteDisc.layer.shadowRadius = 5.0;
    whiteDisc.layer.shadowOpacity = 0.5;

    [self addSubview:whiteDisc];

    // Blue dot
    UIView *blueDot = [[UIView alloc] initWithFrame:CGRectMake(dotCenterH - BlueDotHalfWidth, dotCenterV - BlueDotHalfWidth, BlueDotMaxWidth, BlueDotMaxWidth)];
    blueDot.backgroundColor = [UIColor colorWithRed:0.16 green:0.55 blue:0.98 alpha:1];
    blueDot.layer.cornerRadius = BlueDotHalfWidth;

    [self addSubview:blueDot];
}

@end
