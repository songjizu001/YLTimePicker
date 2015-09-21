//
//  PopTimeView.h
//  PopViewDemo
//
//  Created by SongJizu on 15/5/8.
//  Copyright (c) 2015年 youlemobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopTimeView;

@protocol PopTimeViewDelegate <NSObject>

@optional
- (void)didClickOnDateButton:(NSInteger )dateButtonIndex  andDateDetailsButton:(NSInteger )DateDetailsButtonIndex andPopTimeView:(PopTimeView *)PopTimeView;

@end

@interface PopTimeView : UIView

- (id)initWithDateArray:(NSArray *)DateArray delegate:(id<PopTimeViewDelegate>)delegate DateDetailsArray:(NSArray *)DateDetailsArray andViewShowTag:(NSInteger )showTag;
- (void)showInView:(UIView *)view;
- (void)tappedCancelWithStatus:(BOOL)status;

@end
