//
//  ViewController.m
//  RoundProgressView
//
//  Created by 聂政 on 2019/6/18.
//  Copyright © 2019 聂政. All rights reserved.
//

#import "ViewController.h"

#import "RingView.h"

@interface ViewController ()
@property (nonatomic, strong) RingView *roundProgressView;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, assign) CGFloat currentProgress;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentProgress = 4;
}

- (void)viewWillAppear:(BOOL)animated{
    
}

- (void)viewDidAppear:(BOOL)animated{
    [self createUI];
}

- (void)createUI{
    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.addBtn];
    [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
    [self.addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.addBtn.layer.borderWidth = 0.5;
    self.addBtn.frame = CGRectMake(10, 50, 40, 30);
    [self.addBtn addTarget:self action:@selector(addBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.roundProgressView = [[RingView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.roundProgressView];
    [self.roundProgressView ringSetting];
    [self.roundProgressView updateProgressWithNumber:self.currentProgress];
}

-(void)addBtnAction:(UIButton *)btn{
    if (self.currentProgress >= 100.0) {
        self.currentProgress = 0.0;
    }else if(self.currentProgress > 90.0){
        self.currentProgress = 100.0;
    }else{
        self.currentProgress += 10;
    }
    
    
    if (self.currentProgress <= 0) {
        self.currentProgress = 0.5;
    }
    [self.roundProgressView updateProgressWithNumber:self.currentProgress];
}


@end
