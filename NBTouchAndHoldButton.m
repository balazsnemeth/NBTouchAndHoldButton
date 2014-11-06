//
//  TouchAndHoldButton.m
//
//  Created by Balázs Nemeth on 9/13/12.
//

// This code is distributed under the terms and conditions of the MIT license.

// Copyright (c) 2012 Balázs Nemeth
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "NBTouchAndHoldButton.h"

@implementation NBTouchAndHoldButton{
    NSTimer* holdTimer;
    NSTimeInterval dt;
    NSValue* repeateSelectorAsValue;
    __weak typeof(id) targetOfRepeatSel;
}
/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}*/

- (void)addTarget:(id)target action:(SEL)action forTouchAndHoldControlEventWithTimeInterval:(NSTimeInterval)periodTime{
    dt = periodTime;
    targetOfRepeatSel = target;
    [self addTarget:self action:@selector(sourceTouchUp:)
   forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(sourceTouchUp:)
   forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(sourceTouchDown:)
   forControlEvents:UIControlEventTouchDown];
    repeateSelectorAsValue = [NSValue valueWithBytes:&action objCType:@encode(SEL)];
}


- (void) sourceTouchUp:(UIButton*) sender {
    if (holdTimer != nil) {
        [holdTimer invalidate];
        holdTimer = nil;
    }
}

- (void) sourceTouchDown:(UIButton*) sender {
    SEL selector;
    if (strcmp([repeateSelectorAsValue objCType], @encode(SEL)) == 0) {
        [repeateSelectorAsValue getValue:&selector];
        holdTimer = [NSTimer scheduledTimerWithTimeInterval:dt  target:targetOfRepeatSel selector:selector userInfo:nil repeats: YES];
    }
}
    
@end
