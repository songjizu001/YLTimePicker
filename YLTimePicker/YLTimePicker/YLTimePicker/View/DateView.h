//
//  DateView.h
//  CategoryTest
//
//  Created by SongJizu on 15/7/10.
//  Copyright (c) 2015年 youlemobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLDateScrollView.h"

@class DateView;


typedef void(^DateScrollButtonBlock)(UIButton * button ,YLDateScrollView * YLDateScrollView,DateView *dateView,NSInteger index);

@interface DateView : UIView

@property(nonatomic,strong)YLDateScrollView * scroll;

@property(nonatomic,copy)DateScrollButtonBlock block;

@property (nonatomic,strong) NSArray    *   DateArray;//预定日期的数组

@property(nonatomic,strong)NSMutableArray * buttons;

- (id)initWithFrame:(CGRect)frame andDateArray:(NSArray *)DateArray;

-(void)leftButtonImageGrayColor;

-(void)rightButtonImageGrayColor;

@end
