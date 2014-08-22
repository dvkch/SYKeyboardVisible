//
//  SYViewController.m
//  SYKeyboardVisibleExample
//
//  Created by Stanislas Chevallier on 22/08/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import "SYViewController.h"
#import "SYKeyboardVisible.h"

@interface SYViewController () {
    UITextField *_invisibleTextfield;
    NSTimer *_timer;
}
@end

@implementation SYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _invisibleTextfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _invisibleTextfield.hidden = YES;
    [self.view addSubview:_invisibleTextfield];
    
    _timer = [NSTimer timerWithTimeInterval:0.01
                                     target:self
                                   selector:@selector(timerTick:)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

#pragma mark - IBActions

- (IBAction)buttonShowTap:(id)sender {
    [_invisibleTextfield becomeFirstResponder];
}

- (IBAction)buttonHideTap:(id)sender {
    [_invisibleTextfield resignFirstResponder];
}

#pragma mark - Timer

- (void)timerTick:(id)sender {
    [self.label setText:NSStringFromSYKeyboardVisibility([SYKeyboardVisible visibility])];
}

@end
