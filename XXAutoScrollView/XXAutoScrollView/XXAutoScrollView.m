//
//  XXAutoScrollView.m
//
//  Created by Xing on 2015/6/28.
//  Copyright © 2015年 Xing. All rights reserved.
//

#import "XXAutoScrollView.h"
#import "CCCoinIncomeCell.h"

@interface XXAutoScrollView()<UITableViewDataSource, UITableViewDelegate>

/*! @brief <#name#> */
@property (nonatomic, strong) UITableView *tableView;

/*! @brief  定时器 */
@property (nonatomic, strong) NSTimer *timer;
/*! @brief  当前的索引 */
@property (nonatomic, assign) NSUInteger index;
/*! @brief  <#Description#> */
@property (nonatomic, assign) NSUInteger count;

@end

@implementation XXAutoScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.tableView];
        self.index = 0;
        self.duration = 3;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}

- (void)pause {
    [self pauseTimer];
}

- (void)restart {
    [self resumeTimerAfterTimeInterval:self.duration];
}

- (void)startTimer {
    [self.timer invalidate];
    self.timer = nil;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(scrollToNextView) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)pauseTimer
{
    if (![self.timer isValid]) {
        return ;
    }
    NSLog(@"%@", [NSDate distantFuture]);
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self.timer isValid]) {
        return ;
    }
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

- (void)scrollToNextView {
    self.index ++;
    self.index %= self.count;
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    if (self.index == self.count - 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((self.duration - 1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
        });
        self.index = 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([self.delegate respondsToSelector:@selector(didSelectAutoScrollView)]) {
        [self.delegate didSelectAutoScrollView];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CCCoinIncomeCell *cell = [[CCCoinIncomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    CCCoinIncom *item = self.titles[indexPath.row];
    cell.coinIncom = item;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - Getter
- (UITableView *)tableView {
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        _tableView.showsHorizontalScrollIndicator =NO;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

- (void)setTitles:(NSArray *)titles {
    NSMutableArray *array = [NSMutableArray arrayWithArray:titles];
    if (array.count > 1) {
        [array addObject:[array firstObject]];
        
    }
    _titles = array;
    [self.tableView reloadData];
    self.index = 0;
    self.count = _titles.count;
    if (self.count > 0) {
        [self startTimer];
    }
}

@end
