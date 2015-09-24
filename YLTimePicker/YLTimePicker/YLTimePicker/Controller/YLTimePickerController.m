//
//  YLTimePickerController.m
//  YLTimePicker
//
//  Created by SongJizu on 15/9/24.
//  Copyright © 2015年 youlemobi. All rights reserved.
//

#import "YLTimePickerController.h"
#import "Masonry.h"
#import "PopTimeView.h"
#import "YLDateScrollView.h"
#import "DateView.h"


@interface YLTimePickerController ()<PopTimeViewDelegate>

@property(nonatomic,strong)NSMutableArray * dateArrM;

@property(nonatomic,strong)NSMutableArray * timeArrM;

@property(nonatomic,strong)YLDateScrollView * scroll;

@property(nonatomic,assign)int  count;//测试代码
@end

@implementation YLTimePickerController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self setUpButton];
    
    [self makedic];
    
    self.count = 2;
}

-(void)buttonclick:(UIButton * )sender{
    
    
    PopTimeView * pop =[[PopTimeView alloc]initWithDateArray:_dateArrM delegate:self DateDetailsArray:_timeArrM andViewShowTag:self.count];
    
    [pop showInView:self.view];
    
}

- (void)didClickOnDateButton:(NSInteger )dateButtonIndex  andDateDetailsButton:(NSInteger )DateDetailsButtonIndex andPopTimeView:(PopTimeView *)PopTimeView{
    NSArray * arry = self.timeArrM[dateButtonIndex];
    NSLog(@"\n%@\n%@",arry[DateDetailsButtonIndex][@"yy_name"],arry[DateDetailsButtonIndex][@"label"]);
    
    [PopTimeView tappedCancelWithStatus:YES];
}


-(void)setUpButton{
    self.view.backgroundColor =[UIColor whiteColor];
    UIView * base =  self.view ;
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"选择时间" forState:UIControlStateNormal];
    [button setTintColor:[UIColor redColor]];
    button.backgroundColor =[UIColor grayColor];
    [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@40);
        make.centerX.equalTo(base.mas_centerX);
        make.top.equalTo(@(100));
    }];
}

-(void)makedic{
    
    NSArray * dateArrM =@[@"今天",@"2015年07月11日",@"2015年07月12日",@"2015年07月13日",@"2015年07月14日",@"2015年07月15日"];
    
    NSDictionary * dic =@{@"disabled":@"0",@"label":@"当前",@"yy_name":@"可预约"};
    NSDictionary * dic1 =@{@"disabled":@"1",@"label":@"8:00-9:00",@"yy_name":@"不可预约"};
    NSDictionary * dic2 =@{@"disabled":@"1",@"label":@"9:00-10:00",@"yy_name":@"不可预约"};
    NSDictionary * dic3 =@{@"disabled":@"1",@"label":@"10:00-11:00",@"yy_name":@"不可预约"};
    NSDictionary * dic4 =@{@"disabled":@"1",@"label":@"11:00-12:00",@"yy_name":@"不可预约"};
    NSDictionary * dic5 =@{@"disabled":@"1",@"label":@"13:00-14:00",@"yy_name":@"不可预约"};
    NSDictionary * dic6 =@{@"disabled":@"1",@"label":@"14:00-15:00",@"yy_name":@"不可预约"};
    NSDictionary * dic7 =@{@"disabled":@"1",@"label":@"15:00-16:00",@"yy_name":@"不可预约"};
    NSDictionary * dic8 =@{@"disabled":@"0",@"label":@"16:00-17:00",@"yy_name":@"可预约"};
    NSDictionary * dic9 =@{@"disabled":@"0",@"label":@"17:00-18:00",@"yy_name":@"可预约"};
    
    NSDictionary * dic00 =@{@"disabled":@"0",@"label":@"当前",@"yy_name":@"可预约"};
    NSDictionary * dic10 =@{@"disabled":@"0",@"label":@"8:00-9:00",@"yy_name":@"可预约"};
    NSDictionary * dic20 =@{@"disabled":@"0",@"label":@"9:00-10:00",@"yy_name":@"可预约"};
    NSDictionary * dic30 =@{@"disabled":@"0",@"label":@"10:00-11:00",@"yy_name":@"可预约"};
    NSDictionary * dic40 =@{@"disabled":@"0",@"label":@"11:00-12:00",@"yy_name":@"可预约"};
    NSDictionary * dic50 =@{@"disabled":@"0",@"label":@"13:00-14:00",@"yy_name":@"可预约"};
    NSDictionary * dic60 =@{@"disabled":@"0",@"label":@"14:00-15:00",@"yy_name":@"可预约"};
    NSDictionary * dic70 =@{@"disabled":@"0",@"label":@"15:00-16:00",@"yy_name":@"可预约"};
    NSDictionary * dic80 =@{@"disabled":@"0",@"label":@"16:00-17:00",@"yy_name":@"可预约"};
    NSDictionary * dic90 =@{@"disabled":@"0",@"label":@"17:00-18:00",@"yy_name":@"可预约"};
    
    NSDictionary * dic01 =@{@"disabled":@"0",@"label":@"当前",@"yy_name":@"可预约"};
    NSDictionary * dic11 =@{@"disabled":@"0",@"label":@"8:00-9:00",@"yy_name":@"可预约"};
    NSDictionary * dic21 =@{@"disabled":@"0",@"label":@"9:00-10:00",@"yy_name":@"可预约"};
    NSDictionary * dic31 =@{@"disabled":@"0",@"label":@"10:00-11:00",@"yy_name":@"可预约"};
    NSDictionary * dic41 =@{@"disabled":@"0",@"label":@"11:00-12:00",@"yy_name":@"可预约"};
    NSDictionary * dic51 =@{@"disabled":@"0",@"label":@"13:00-14:00",@"yy_name":@"可预约"};
    NSDictionary * dic61 =@{@"disabled":@"0",@"label":@"14:00-15:00",@"yy_name":@"可预约"};
    NSDictionary * dic71 =@{@"disabled":@"0",@"label":@"15:00-16:00",@"yy_name":@"可预约"};
    NSDictionary * dic81 =@{@"disabled":@"0",@"label":@"16:00-17:00",@"yy_name":@"可预约"};
    NSDictionary * dic91 =@{@"disabled":@"0",@"label":@"17:00-18:00",@"yy_name":@"可预约"};
    
    NSDictionary * dic02 =@{@"disabled":@"0",@"label":@"当前",@"yy_name":@"可预约"};
    NSDictionary * dic12 =@{@"disabled":@"1",@"label":@"8:00-9:00",@"yy_name":@"可预约"};
    NSDictionary * dic22 =@{@"disabled":@"0",@"label":@"9:00-10:00",@"yy_name":@"可预约"};
    NSDictionary * dic32 =@{@"disabled":@"1",@"label":@"10:00-11:00",@"yy_name":@"可预约"};
    NSDictionary * dic42 =@{@"disabled":@"0",@"label":@"11:00-12:00",@"yy_name":@"可预约"};
    NSDictionary * dic52 =@{@"disabled":@"1",@"label":@"13:00-14:00",@"yy_name":@"可预约"};
    NSDictionary * dic62 =@{@"disabled":@"0",@"label":@"14:00-15:00",@"yy_name":@"可预约"};
    NSDictionary * dic72 =@{@"disabled":@"1",@"label":@"15:00-16:00",@"yy_name":@"可预约"};
    NSDictionary * dic82 =@{@"disabled":@"0",@"label":@"16:00-17:00",@"yy_name":@"可预约"};
    NSDictionary * dic92 =@{@"disabled":@"1",@"label":@"17:00-18:00",@"yy_name":@"可预约"};
    
    NSDictionary * dic03 =@{@"disabled":@"0",@"label":@"当前",@"yy_name":@"可预约"};
    NSDictionary * dic13 =@{@"disabled":@"1",@"label":@"8:00-9:00",@"yy_name":@"可预约"};
    NSDictionary * dic23 =@{@"disabled":@"0",@"label":@"9:00-10:00",@"yy_name":@"可预约"};
    NSDictionary * dic33 =@{@"disabled":@"1",@"label":@"10:00-11:00",@"yy_name":@"可预约"};
    NSDictionary * dic43 =@{@"disabled":@"0",@"label":@"11:00-12:00",@"yy_name":@"可预约"};
    NSDictionary * dic53 =@{@"disabled":@"1",@"label":@"13:00-14:00",@"yy_name":@"可预约"};
    NSDictionary * dic63 =@{@"disabled":@"0",@"label":@"14:00-15:00",@"yy_name":@"可预约"};
    NSDictionary * dic73 =@{@"disabled":@"1",@"label":@"15:00-16:00",@"yy_name":@"可预约"};
    NSDictionary * dic83 =@{@"disabled":@"0",@"label":@"16:00-17:00",@"yy_name":@"可预约"};
    NSDictionary * dic93 =@{@"disabled":@"1",@"label":@"17:00-18:00",@"yy_name":@"可预约"};
    
    NSArray * arra1 = @[dic,dic1,dic2,dic3,dic4,dic5,dic6,dic7,dic8,dic9,dic90,dic63,dic90,dic81,dic81];
    NSArray * arra2 = @[dic00,dic10,dic20,dic30,dic40,dic50,dic60,dic70,dic80,dic90,dic90,dic63,dic63,dic81,dic81];
    NSArray * arra3 = @[dic01,dic11,dic21,dic31,dic41,dic51,dic61,dic71,dic81,dic91,dic90,dic63,dic63,dic81,dic81];
    NSArray * arra4 = @[dic02,dic12,dic22,dic32,dic42,dic52,dic62,dic72,dic82,dic92,dic90,dic63,dic63,dic81];
    NSArray * arra5 = @[dic03,dic13,dic23,dic33,dic43,dic53,dic63,dic73,dic83,dic93,dic90,dic63,dic63,dic81,dic81];
    NSArray * arra6 = @[dic03,dic13,dic23,dic33,dic43,dic53,dic63,dic73,dic83,dic93,dic90,dic63,dic63,dic81,dic81];
    
    NSArray * timeArrM =@[arra1,arra2,arra3,arra4,arra5,arra6];
    
    self.dateArrM = [NSMutableArray arrayWithArray:dateArrM];
    self.timeArrM = [NSMutableArray arrayWithArray:timeArrM];
    
    //    NSDictionary * dicss =@{@"date":dateArrM,@"time":timeArrM};
}

@end
