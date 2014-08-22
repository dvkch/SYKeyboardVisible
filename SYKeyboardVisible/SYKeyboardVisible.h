//
//  SYKeyboardVisible.h
//  SYKeyboardVisibleExample
//
//  Created by Stanislas Chevallier on 22/08/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SYKeyboardVisibility_WillShow,
    SYKeyboardVisibility_WillHide,
    SYKeyboardVisibility_DidShow,
    SYKeyboardVisibility_DidHide,
} SYKeyboardVisibility;

NSString *NSStringFromSYKeyboardVisibility(SYKeyboardVisibility visibility);

@interface SYKeyboardVisible : NSObject
+ (SYKeyboardVisibility)visibility;
@end
