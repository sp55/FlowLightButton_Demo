//
//  FlowLightButton.m
//  FlowLightButton_Demo
//
//  Created by admin on 16/6/23.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "FlowLightButton.h"


@interface FlowLightButton ()
@property (nonatomic, strong) UIButton      *flowLightBtn;
@property (nonatomic, strong) UIImageView   *flowLightImageView;
@property (nonatomic, strong) UIImageView   *btnBgLightImageView;
@end

@implementation FlowLightButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect btnFrame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        
        //背景呼吸光
        self.btnBgLightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-2, -2, CGRectGetWidth(frame) + 4, CGRectGetHeight(frame) + 4)];
        self.btnBgLightImageView.image = [UIImage imageNamed:@"btnBgLight"];
        [self addSubview:self.btnBgLightImageView];
        
        //按钮本体
        self.flowLightBtn = [[UIButton alloc] initWithFrame:btnFrame];
        [self.flowLightBtn setBackgroundImage:[UIImage imageNamed:@"btnBg"] forState:UIControlStateNormal];
        [self.flowLightBtn setTitle:@"确认" forState:UIControlStateNormal];
        [self.flowLightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.flowLightBtn addTarget:self action:@selector(FlowLightButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.flowLightBtn];
        
        //流光
        self.flowLightImageView = [[UIImageView alloc] initWithFrame:btnFrame];
        self.flowLightImageView.image = [UIImage imageNamed:@"btnLight"];
        [self addSubview:self.flowLightImageView];
        
        [self showAnimations];
    }
    return self;
}
//do something
-(void)FlowLightButtonAction{
    _block();
}
//动画
- (void)showAnimations
{
    //流光动画
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.flowLightBtn.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"btnLightMask"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    self.flowLightImageView.layer.mask = maskLayer;
    self.flowLightImageView.hidden = NO;
    
    CABasicAnimation *flowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    flowAnimation.fromValue = [NSNumber numberWithFloat:-79.0];
    flowAnimation.toValue = [NSNumber numberWithFloat:168.0];
    flowAnimation.duration = 2.0;
    flowAnimation.repeatCount = FLT_MAX;
    flowAnimation.removedOnCompletion = NO;
    flowAnimation.fillMode = kCAFillModeForwards;
    [maskLayer addAnimation:flowAnimation forKey:@"transform.translation.x"];
    
    //呼吸光动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.2];
    opacityAnimation.duration = 1.0;
    opacityAnimation.autoreverses = YES;
    opacityAnimation.repeatCount = FLT_MAX;
    opacityAnimation.removedOnCompletion = NO;
    opacityAnimation.fillMode = kCAFillModeForwards;
    [self.btnBgLightImageView.layer addAnimation:opacityAnimation forKey:@"opacity"];
}


@end
