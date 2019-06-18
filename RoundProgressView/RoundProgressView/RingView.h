//
//  RingView.h
//  doudouTest
//
//  Created by 聂政 on 2018/10/9.
//  Copyright © 2018年 niez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RingView : UIView
///初始化使用
- (instancetype)initWithFrame:(CGRect)frame;
-(void)ringSetting;
- (void)updateProgressWithNumber:(CGFloat)number;
@end
