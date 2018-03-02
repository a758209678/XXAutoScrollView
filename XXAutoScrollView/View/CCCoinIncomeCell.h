//
//  CCCoinIncomeCell.h
//  CuiCanMobileProject
//
//  Created by Xing on 2017/8/13.
//  Copyright © 2017年 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCCoinIncom;

@interface CCCoinIncomeCell : UITableViewCell

//收入数额
@property (nonatomic,strong) UILabel *numLabel;

//头像
@property (nonatomic,strong) UIImageView *headImgView;

//昵称
@property (nonatomic,strong) UILabel *nickLabel;

//下家消费详情
@property (nonatomic,strong) UILabel *infoLabel;

//时间
@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) CCCoinIncom *coinIncom;




@end
