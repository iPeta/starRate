//
//  CMNStarRateView.m
//  starRate
//
//  Created by Tao Peng on 15/4/23.
//  Copyright (c) 2015年 Tao Peng. All rights reserved.
//

#import "CMNStarRateView.h"

@interface CMNStarRateView ()
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,assign) CGFloat starWidth;
@end
@implementation CMNStarRateView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    self.bottomView = [[UIView alloc] initWithFrame:self.bounds];
    self.bottomView.backgroundColor = self.unselectedColor;
    self.topView = [[UIView alloc] initWithFrame:CGRectZero];
    self.topView.backgroundColor = self.selectedColor;
    [self addSubview:self.bottomView];
    [self addSubview:self.topView];
  
    self.topView.clipsToBounds = YES;
    self.topView.userInteractionEnabled = NO;
    self.bottomView.userInteractionEnabled = NO;
    self.userInteractionEnabled = YES;
    
    CGFloat width = frame.size.width/7.0;
    self.starWidth = width;
    for(int i = 0;i<5;i++){
      UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width*ZOOM, width*ZOOM)];
      img.center = CGPointMake((i+1.5)*width, frame.size.height/2);
      img.image = [UIImage imageNamed:@"bt_star_a"];
      [self.bottomView addSubview:img];
      UIImageView *img2 = [[UIImageView alloc] initWithFrame:img.frame];
      img2.center = img.center;
      img2.image = [UIImage imageNamed:@"bt_star_b"];
      [self.topView addSubview:img2];
    }

    
    
  }
  return self;
}





@end
