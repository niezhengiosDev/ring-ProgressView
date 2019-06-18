//
//  RingView.m
//  doudouTest
//
//  Created by 聂政 on 2018/10/9.
//  Copyright © 2018年 niez. All rights reserved.
//

#import "RingView.h"

@interface  RingView()
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UIView *progressView;

///内部圆形背景
@property (nonatomic, strong) CAShapeLayer *outLayer;
///外部圆环
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@end

@implementation RingView


-(UIView *)progressView{
    
    
    if (_progressView == nil) {
        _progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _progressView.backgroundColor = [UIColor clearColor];
        
        _progressView.layer.cornerRadius = 50.0;
        _progressView.layer.masksToBounds = YES;
        
        [self addSubview:_progressView];
        [_progressView addSubview:self.progressLabel];
    }
    
    return _progressView;
}

-(UILabel *)progressLabel{
    
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:self.progressView.bounds];
        [_progressLabel setText:@"0%"];
        [_progressLabel setBackgroundColor:[UIColor clearColor]];
        [_progressLabel setTextAlignment:NSTextAlignmentCenter];
        [_progressLabel.layer setCornerRadius:50.0];
        [_progressLabel.layer setMasksToBounds:YES];
        [_progressLabel setTextColor:[UIColor blackColor]];
    }
    
    return _progressLabel;
}


-(void)UIConfig{
    [self addSubview:self.progressView];
    
    ///起始点从顶部开始，旋转一下
    [_progressView setTransform:CGAffineTransformMakeRotation(-M_PI_2)];
    [_progressLabel setTransform:CGAffineTransformMakeRotation(M_PI_2)];
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self UIConfig];
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self UIConfig];
    }
    return self;
}


-(void)ringSetting{
    ///内部圆形背景
    self.outLayer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(8, 8, 84, 84)];
    self.outLayer.strokeColor = [UIColor clearColor].CGColor;
    self.outLayer.fillColor = [UIColor grayColor].CGColor;
    self.outLayer.path = path.CGPath;
    [self.progressView.layer addSublayer:self.outLayer];
    
    [self progressLayerSetting];
}

-(void)progressLayerSetting{
    ///外部进度圆环
    self.progressLayer = [CAShapeLayer layer];
    CGRect rect = CGRectMake(8, 8, self.progressView.frame.size.width-16, self.progressView.frame.size.height-16);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    self.progressLayer.strokeColor = [UIColor redColor].CGColor;
    self.progressLayer.lineWidth = 16;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.path = path.CGPath;
    [self.progressView.layer addSublayer:self.progressLayer];
    
    [self.progressView bringSubviewToFront:self.progressLabel];
}


///进度动画
- (void)updateProgressWithNumber:(CGFloat)number {
    [self.progressLabel setText:[NSString stringWithFormat:@"%.1f%@",number,@"%"]];
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:0.5];
    self.progressLayer.strokeEnd = number/100.0;
    [CATransaction commit];
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
