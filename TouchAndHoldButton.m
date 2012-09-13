//
//  TouchAndHoldButton.m
//
//  Created by Balázs Nemeth on 9/13/12.
//

#import "TouchAndHoldButton.h"

@implementation TouchAndHoldButton{
    NSTimer* holdTimer;
    NSTimeInterval dt;
    NSValue* repeateSelectorAsValue;
    id targetOfRepeatSel;
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
