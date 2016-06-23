//
//  ViewController.m
//  FlowLightButton_Demo
//
//  Created by admin on 16/6/23.
//  Copyright © 2016年 AlezJi. All rights reserved.
//
//http://www.jianshu.com/p/d2c6fb0c5c86
//用CALayer实现流光动画

#import "ViewController.h"
#import "FlowLightButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FlowLightButton *flowLightBtn = [[FlowLightButton alloc] initWithFrame:CGRectMake(128, 200, 120, 55)];
    flowLightBtn.block = ^{
        NSLog(@"do something");
    };
    [self.view addSubview:flowLightBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
