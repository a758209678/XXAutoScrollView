//
//  ViewController.m
//  XXAutoScrollView
//
//  Created by 邢广超 on 2018/3/2.
//  Copyright © 2018年 Xing. All rights reserved.
//

#import "ViewController.h"
#import "XXAutoScrollView.h"


@interface ViewController () {
    
    NSArray *_dataArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    _dataArr = @[@{
                     @"nickname": @"过火",
                     @"headPortraitUrl": @"http://oeasskxo5.bkt.clouddn.com/20170124152434_21cKBFwh.png",
                     @"totalPrice": @"0.01",
                     @"yinbi": @"0",
                     @"orderCreateDate": @"2017-01-03"
                     },
                 @{
                     @"nickname": @"Hello_time",
                     @"headPortraitUrl": @"http://oeasskxo5.bkt.clouddn.com/20170124152434_21cKBFwh.png",
                     @"totalPrice": @"874.65",
                     @"yinbi": @"131",
                     @"orderCreateDate": @"2017-04-28"
                     },
                 @{
                     @"nickname": @"Hello_time",
                     @"headPortraitUrl": @"http://oeasskxo5.bkt.clouddn.com/20170124152434_21cKBFwh.png",
                     @"totalPrice": @"25",
                     @"yinbi":@"3",
                     @"orderCreateDate": @"2017-04-28"
                     },
                 @{
                     @"nickname": @"User",
                     @"headPortraitUrl": @"http://oeasskxo5.bkt.clouddn.com/20170311221509_nYtUhxtv.png",
                     @"totalPrice": @"360",
                     @"yinbi": @"53",
                     @"orderCreateDate": @"2017-05-02"
                     },
                 @{
                     @"nickname": @"O92v9XutED",
                     @"headPortraitUrl": @"http://oeasskxo5.bkt.clouddn.com/20170311221509_nYtUhxtv.png",
                     @"totalPrice": @"595",
                     @"yinbi": @"89",
                     @"orderCreateDate": @"2017-07-06"
                     }
                 ];
    
    [self creatAutoScrollView];
    
}

-(void)creatAutoScrollView {
    
    NSMutableArray *resultArr = [NSMutableArray new];
    
    for (NSDictionary *dic in _dataArr) {
        
        CCCoinIncom *coinIncom = [[CCCoinIncom alloc] initWithContentDic:dic];
        
        [resultArr addObject:coinIncom];
    }
    
    
    XXAutoScrollView *autoScrollView = [[XXAutoScrollView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 130)];
    autoScrollView.titles = resultArr;
    [self.view addSubview:autoScrollView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
