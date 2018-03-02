//
//  XXAutoScrollView.h
//
//  Created by Xing on 2015/6/28.
//  Copyright © 2015年 Xing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCoinIncom.h"

@protocol AutoScrollViewDelegate <NSObject>

-(void)didSelectAutoScrollView;

@end

@interface XXAutoScrollView : UIView

/*! @brief  存放标题的数组 */
@property (nonatomic, strong) NSArray <CCCoinIncom *>*titles;

/*! @brief  跳转的时间 */
@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, weak) id<AutoScrollViewDelegate> delegate;

- (void)pause;

- (void)restart;

/*! @brief  <#Description#> */
//@property (nonatomic, copy) void (^sliderChick)(NSInteger index);

@end
