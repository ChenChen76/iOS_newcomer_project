//
//  ViewController.m
//  task1
//
//  Created by bytedance on 2020/7/22.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, [UIScreen mainScreen].bounds.size.height / 2 - 25, 100, 50);
    button.tintColor = [UIColor blackColor];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"点击我"
            forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:5.0];
    [button.layer setBorderWidth:2.0];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorRef = CGColorCreate(colorSpace, (CGFloat[]){ 0, 0, 0, 1 });
    [button.layer setBorderColor:colorRef];
    [button addTarget:self
            action:@selector(clickAction)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void) clickAction {
    DetailViewController *dcon = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:dcon animated:NO];
}

@end
