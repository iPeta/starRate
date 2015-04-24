//
//  CMNStarRateView.h
//  starRate
//
//  Created by Tao Peng on 15/4/23.
//  Copyright (c) 2015年 Tao Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CMNStarRateViewAlignment) {
  CMNStarRateViewAlignmentLeft,
  CMNStarRateViewAlignmentRight
};

typedef NS_ENUM(NSInteger, CMNStarRateViewShowMode) {
  CMNStarRateViewShowModeHalf,
  CMNStarRateViewShowModeAccurate
};


@interface CMNStarRateView : UIView

@property (nonatomic,assign) CGFloat number;
@property (nonatomic,strong) UIColor *foregroundColor;
@property (nonatomic,assign) BOOL allowsRating;

/**
 *  default is CMNStarRateViewStyleLeft
 */
@property (nonatomic,assign) CMNStarRateViewAlignment starAlignment;
/**
 *  default is CMNStarRateViewShowModeHalf
 */
@property (nonatomic,assign) CMNStarRateViewShowMode  showMode;

@end
