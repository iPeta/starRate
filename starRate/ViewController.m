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

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor lightGrayColor];
  CMNStarRateView *view = [[CMNStarRateView alloc] initWithFrame:CGRectMake(100, 100, 320, 64)];

  view.backgroundColor = [UIColor whiteColor];
  view.center = self.view.center;
  [self.view addSubview:view];
  
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
