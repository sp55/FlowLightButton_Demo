//
//  FlowLightButton.h
//  FlowLightButton_Demo
//
//  Created by admin on 16/6/23.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FlowLightBlock)();
@interface FlowLightButton : UIView

@property(copy,nonatomic)FlowLightBlock block;

@end
