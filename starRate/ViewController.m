//
//  ViewController.m
//  starRate
//
//  Created by Tao Peng on 15/4/23.
//  Copyright (c) 2015年 Tao Peng. All rights reserved.
//

#import "ViewController.h"
#import "CMNStarRateView.h"

@interface ViewController ()

@property (nonatomic,weak)CMNStarRateView *starView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor greenColor];
  CMNStarRateView *view = [[CMNStarRateView alloc] initWithFrame:CGRectMake(100, 100, 300, 50)];
  self.starView = view;
  view.showMode = CMNStarRateViewShowModeHalf;
  view.starAlignment = CMNStarRateViewAlignmentLeft;
  view.number = 1.7;
  view.allowsRating = YES;
  view.backgroundColor = [UIColor lightGrayColor];
  view.center = self.view.center;
  [self.view addSubview:view];

  
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 90, 40)];
  [button setTitle:@"当前评分" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
  [button addTarget:self action:@selector(getStarNum) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}


- (void)getStarNum
{
  NSLog(@"------->%f",self.starView.number);
}


@end
