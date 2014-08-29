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

@implementation PBBlueDotView

#pragma mark - UIView

- (void)layoutSubviews
{
    // Outer pulsing disc (blue)
    UIView *pulseDisc = [[UIView alloc] initWithFrame:[self boundsByRatio:1.0]];
    pulseDisc.backgroundColor = [UIColor colorWithRed:0.16 green:0.55 blue:0.98 alpha:1];
    pulseDisc.layer.cornerRadius = pulseDisc.bounds.size.width / 2;

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 3.0;
    scaleAnimation.repeatCount = HUGE_VAL;
    scaleAnimation.fromValue = @(0.3);
    scaleAnimation.toValue = @(1.0);
    [pulseDisc.layer addAnimation:scaleAnimation forKey:@"scale"];

    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.duration = 3.0;
    fadeAnimation.repeatCount = HUGE_VAL;
    fadeAnimation.fromValue = @(0.8);
    fadeAnimation.toValue = @(0.0);
    [pulseDisc.layer addAnimation:fadeAnimation forKey:@"fade"];

    [self addSubview:pulseDisc];

    // Middle static disc (white)
    CGFloat sizeRatio = 0.3;
    UIView *middleDisc = [[UIView alloc] initWithFrame:[self boundsByRatio:sizeRatio]];
    middleDisc.backgroundColor = [UIColor whiteColor];
    middleDisc.layer.cornerRadius = middleDisc.bounds.size.width / 2;
    middleDisc.layer.shadowColor = [UIColor blackColor].CGColor;
    middleDisc.layer.shadowOffset = CGSizeZero;
    middleDisc.layer.shadowRadius = 5.0;
    middleDisc.layer.shadowOpacity = 0.5;

    [self addSubview:middleDisc];

    // Center disc (blue)
    sizeRatio = 0.2;
    UIView *centerDisc = [[UIView alloc] initWithFrame:[self boundsByRatio:sizeRatio]];
    centerDisc.backgroundColor = [UIColor colorWithRed:0.16 green:0.55 blue:0.98 alpha:1];
    centerDisc.layer.cornerRadius = centerDisc.bounds.size.width / 2;

    [self addSubview:centerDisc];
}

#pragma mark - Private Methods

- (CGRect)boundsByRatio:(CGFloat)ratio
{
    CGPoint boundsCenter = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);

    return CGRectMake(boundsCenter.x - (self.bounds.size.width / 2 * ratio),
                      boundsCenter.y - (self.bounds.size.height / 2 * ratio),
                      self.bounds.size.width * ratio,
                      self.bounds.size.height * ratio);
}

@end
