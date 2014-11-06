//
//  TouchAndHoldButton.h
//
//  Created by Balázs Nemeth on 09/13/12.
//

#import <UIKit/UIKit.h>

@interface NBTouchAndHoldButton : UIButton

- (void)addTarget:(id)target action:(SEL)action forTouchAndHoldControlEventWithTimeInterval:(NSTimeInterval)periodTime;

@end
