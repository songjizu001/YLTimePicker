//
//  YLDateScrollView.h
//  CategoryTest
//
//  Created by SongJizu on 15/7/10.
//  Copyright (c) 2015年 youlemobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLDateScrollView : UIScrollView

@property(nonatomic,strong)NSMutableArray * buttons;

-(id)init;
-(void)addButton:(UIButton *)button AndWithScrollWidth:(CGFloat )scrollWidth;
-(void)makeScrollViewLeft;
-(void)makeScrollViewRight;
-(void)makeScrollViewScrollInButtonIndex:(NSInteger )index;

@end
