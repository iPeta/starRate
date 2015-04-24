//
//  CMNStarRateView.m
//  starRate
//
//  Created by Tao Peng on 15/4/23.
//  Copyright (c) 2015年 Tao Peng. All rights reserved.
//

#import "CMNStarRateView.h"

#define kStarMargin 15

@interface CMNStarRateView ()
@property (nonatomic,strong) UIView *foregroundView;
@property (nonatomic,assign) CGFloat starWidth;
@property (nonatomic,assign) CGFloat starHeight;
@end
@implementation CMNStarRateView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    CGFloat width  = (frame.size.width - 4 * kStarMargin) / 5;
    CGFloat heigth = width;
    _starWidth     = width;
    _starHeight    = heigth;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _starHeight);
    self.backgroundColor        = [UIColor lightGrayColor];
    self.clipsToBounds          = YES;
    self.userInteractionEnabled = YES;
    _foregroundView = [[UIView alloc] initWithFrame:CGRectZero];
    _foregroundView.backgroundColor        = [UIColor orangeColor];
    _foregroundView.userInteractionEnabled = NO;
    [self addSubview:self.foregroundView];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
    
    for(int i = 0; i < 5; i++) {
      UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_clear"]];
      img.frame  = CGRectMake(i * (width + kStarMargin), 0, width,heigth);
      [self addSubview:img];

      CGRect starLeftViewF = CGRectMake(i * (width + kStarMargin) + width, 0, kStarMargin, heigth);
      UIView *starLeftView = [[UIView alloc] initWithFrame:starLeftViewF];
      starLeftView.backgroundColor = [UIColor whiteColor];
      [self addSubview:starLeftView];
    }
  }
  return self;
}

#pragma mark -
#pragma mark Properties
-(void)setNumber:(CGFloat)number
{
  _number = number;
  CGFloat foregroundViewWidth;
  NSUInteger starWidthNum = number * 2;

  switch (_showMode) {
    case CMNStarRateViewShowModeHalf:
      foregroundViewWidth = starWidthNum * _starWidth * 0.5 + (int)number * kStarMargin;
      break;
    case CMNStarRateViewShowModeAccurate:
      foregroundViewWidth = number * _starWidth + (int)number * kStarMargin;
      break;
    default:
      break;
  }
  if (_starAlignment == CMNStarRateViewAlignmentLeft) {
    self.foregroundView.frame = CGRectMake(0, 0, foregroundViewWidth, _starHeight);
  }
  else if(_starAlignment == CMNStarRateViewAlignmentRight){
    self.foregroundView.frame = CGRectMake(self.frame.size.width - foregroundViewWidth, 0, foregroundViewWidth, _starWidth);
  }
}

- (void)setForegroundColor:(UIColor *)foregroundColor
{
  _foregroundColor = foregroundColor;
  _foregroundView.backgroundColor = foregroundColor;
}

#pragma mark -
#pragma mark GestureEven
-(void)tap:(UITapGestureRecognizer *)gesture
{
  if(self.allowsRating) {
    CGPoint point   = [gesture locationInView:self];
    NSInteger count = (int)(point.x / (_starWidth + kStarMargin)) + 1;
    self.foregroundView.frame = CGRectMake(0, 0, (_starWidth + kStarMargin) * count, _starHeight);
    _number = count;
  }
}
@end
