//
//  SYKeyboardVisible.m
//  SYKeyboardVisibleExample
//
//  Created by Stanislas Chevallier on 22/08/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import "SYKeyboardVisible.h"

NSString *NSStringFromSYKeyboardVisibility(SYKeyboardVisibility visibility) {
    switch (visibility) {
        case SYKeyboardVisibility_WillShow: return @"will show";    break;
        case SYKeyboardVisibility_WillHide: return @"will hide";    break;
        case SYKeyboardVisibility_DidShow:  return @"did show";     break;
        case SYKeyboardVisibility_DidHide:  return @"did hide";     break;
    }
    return @"unknown";
}

@interface SYKeyboardVisible ()
@property (atomic, assign) SYKeyboardVisibility visibility;
+ (SYKeyboardVisible *)instance;
- (void)notificationsKeyboard:(NSNotification *)notification;
@end

@implementation SYKeyboardVisible

+ (void)initialize
{
    [self instance];
}

// thanks to Luke Redpath:
// http://lukeredpath.co.uk/blog/2011/07/01/a-note-on-objective-c-singletons/
+ (SYKeyboardVisible *)instance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _visibility = SYKeyboardVisibility_DidHide;
        
        NSArray *names = @[UIKeyboardWillShowNotification,
                           UIKeyboardDidShowNotification,
                           UIKeyboardWillHideNotification,
                           UIKeyboardDidHideNotification];
        
        for (NSString *name in names) {
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(notificationsKeyboard:)
                                                         name:name
                                                       object:nil];
        }
    }
    return self;
}

// When orientation changes we receive (in the order)
// -> will hide -> did hide -> will show -> did show
- (void)notificationsKeyboard:(NSNotification *)notification
{
    if([notification.name isEqualToString:UIKeyboardWillShowNotification])
        self.visibility = SYKeyboardVisibility_WillShow;
    
    else if([notification.name isEqualToString:UIKeyboardWillHideNotification])
        self.visibility = SYKeyboardVisibility_WillHide;
    
    else if([notification.name isEqualToString:UIKeyboardDidShowNotification])
        self.visibility = SYKeyboardVisibility_DidShow;
    
    else if([notification.name isEqualToString:UIKeyboardDidHideNotification])
        self.visibility = SYKeyboardVisibility_DidHide;
}

- (void)dealloc
{
    NSArray *names = @[UIKeyboardWillShowNotification,
                       UIKeyboardDidShowNotification,
                       UIKeyboardWillHideNotification,
                       UIKeyboardDidHideNotification];
    
    for (NSString *name in names)
        [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:nil];
}

#pragma mark - Public

+ (SYKeyboardVisibility)visibility
{
    return [[self instance] visibility];
}

@end
