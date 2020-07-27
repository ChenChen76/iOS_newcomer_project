//
//  UIViewController+showClassName.m
//  task1
//
//  Created by bytedance on 2020/7/26.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "UIViewController+showClassName.h"
#import <objc/runtime.h>
#import "MyViewController.h"

@implementation UIViewController (showClassName)

- (NSString *)showClassName {
    return [NSString stringWithFormat:@"当前vc类名：%@", NSStringFromClass([self class])];
}

+ (void)load
{
    Method originalMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method swizzingMethod = class_getInstanceMethod([self class], @selector(SCN_viewDidLoad));
    method_exchangeImplementations(originalMethod, swizzingMethod);
}
    
- (void)SCN_viewDidLoad
{
    if([self isKindOfClass:[MyViewController class]]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title"
               message:[NSString stringWithFormat:@"当前vc类名：%@", NSStringFromClass([self class])]
        preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action) {
                                                                     //响应事件
                                                                     //NSLog(@"action = %@", action);
                                                                 }];
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 //NSLog(@"action = %@", action);
                                                             }];

        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        [self.navigationController presentViewController:alert animated:YES completion:nil];
    }
}

@end
