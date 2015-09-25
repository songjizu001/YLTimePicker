//
//  DatePickButton.h
//  PopViewDemo
//
//  Created by SongJizu on 15/5/8.
//  Copyright (c) 2015年 youlemobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickButton : UIButton

@property(nonatomic,assign)int  dateIndex;

@property(nonatomic,strong)UILabel * timeLB;

@property(nonatomic,strong)UILabel * statusLB;

+(instancetype)customButtonWithTitle:(NSString *)title andWithStatus:(NSString *)Status andAppointment:(NSInteger)Appointment;

-(void)setAllowAppointment;
-(void)setDoNotMakeAppointment;

@end
