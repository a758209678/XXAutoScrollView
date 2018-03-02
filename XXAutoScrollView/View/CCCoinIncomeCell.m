//
//  CCCoinIncomeCell.m
//  CuiCanMobileProject
//
//  Created by Xing on 2017/8/13.
//  Copyright © 2017年 Ken. All rights reserved.
//

#import "CCCoinIncomeCell.h"
#import "CCCoinIncom.h"
#import "Masonry.h"

#import "UIImageView+WebCache.h"

#define                         MARGIN 15.0

#define HEXCOLOR(hex)           [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define COLOR_WORD_GRAY_1       HEXCOLOR(0x666666)

#define COLOR_WORD_GRAY_2       HEXCOLOR(0x999999)

#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]

@implementation CCCoinIncomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUpSubViews];
    }
    return self;
}

-(void)setUpSubViews {

    UIView *sycleView = [UIView new];
    sycleView.backgroundColor = COLOR_WORD_GRAY_2;
    sycleView.layer.cornerRadius = 2.5;
    [self.contentView addSubview:sycleView];
    [sycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MARGIN);
        make.left.equalTo(2*MARGIN);
        make.width.height.equalTo(5);
    }];
    
    [self.contentView addSubview:self.numLabel];
    [self.contentView addSubview:self.headImgView];
    [self.contentView addSubview:self.nickLabel];
    [self.contentView addSubview:self.infoLabel];
    [self.contentView addSubview:self.timeLabel];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sycleView.right).with.offset(MARGIN);
        make.centerY.equalTo(sycleView);
        make.height.equalTo(20);
    }];
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numLabel);
        make.top.equalTo(self.numLabel.bottom).with.offset(MARGIN);
        make.width.height.equalTo(34);
    }];
    
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.right).with.offset(10);
        make.centerY.equalTo(self.headImgView);
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numLabel);
        make.top.equalTo(self.headImgView.bottom).with.offset(10);
        make.height.equalTo(14);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numLabel);
        make.top.equalTo(self.infoLabel.bottom).with.offset(10);
        make.bottom.equalTo(-7);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_WORD_GRAY_2;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sycleView.bottom).with.offset(7);
        make.width.equalTo(1);
        make.centerX.equalTo(sycleView);
        make.bottom.equalTo(-7);
    }];
}

-(UILabel *)numLabel {

    if (!_numLabel) {
        UILabel *label = [UILabel new];
        label.font = SYSTEMFONT(20);
        label.textColor = [UIColor blackColor];
        _numLabel = label;
    }
    return _numLabel;
}

-(UIImageView *)headImgView {

    if (!_headImgView) {
        UIImageView *imgView = [UIImageView new];
        imgView.layer.cornerRadius = 17;
        imgView.layer.masksToBounds = YES;
        _headImgView = imgView;
    }
    return _headImgView;
}

-(UILabel *)nickLabel {

    if (!_nickLabel) {
        UILabel *label = [UILabel new];
        label.font = SYSTEMFONT(14);
        label.textColor = COLOR_WORD_GRAY_1;
        _nickLabel = label;
    }
    return _nickLabel;
}

-(UILabel *)infoLabel {

    if (!_infoLabel) {
        UILabel *label = [UILabel new];
        label.font = SYSTEMFONT(14);
        label.textColor = COLOR_WORD_GRAY_1;
        _infoLabel = label;
    }
    return _infoLabel;
}

-(UILabel *)timeLabel {
    
    if (!_timeLabel) {
        UILabel *label = [UILabel new];
        label.font = SYSTEMFONT(14);
        label.textColor = COLOR_WORD_GRAY_2;
        _timeLabel = label;
    }
    return _timeLabel;
}

-(void)setCoinIncom:(CCCoinIncom *)coinIncom {
    
    if (coinIncom) {
        _coinIncom = coinIncom;
    }
}

-(void)layoutSubviews {

    self.numLabel.text = [NSString stringWithFormat:@"+%@",_coinIncom.yinbi];

    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:_coinIncom.headPortraitUrl]];
    
    self.nickLabel.text = _coinIncom.nickname;
    
    self.infoLabel.text = [NSString stringWithFormat:@"XX平台消费：￥%@",_coinIncom.totalPrice];
    
    self.timeLabel.text = _coinIncom.orderCreateDate;
}


@end
