//
//  YLDateScrollView.m
//  CategoryTest
//
//  Created by SongJizu on 15/7/10.
//  Copyright (c) 2015年 youlemobi. All rights reserved.
//

#import "YLDateScrollView.h"

#define PADDING 5
#define ScreenWidth                             [UIScreen mainScreen].bounds.size.width
#define ScreenHeight                            [UIScreen mainScreen].bounds.size.height

@interface YLDateScrollView ()

@end

@implementation YLDateScrollView

-(id)init{
    if (self = [super init]) {
        self.buttons = [NSMutableArray array];
        self.scrollEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)addButton:(UIButton *)button AndWithScrollWidth:(CGFloat )scrollWidth
{
    NSInteger width = 0;
    UIButton *lastButton = [self.buttons lastObject];
    if (lastButton ){
        width += lastButton.frame.origin.x + lastButton.frame.size.width;
    }
    CGRect frame = button.frame;
    frame.origin.x = width;
    frame.origin.y = 0;
    button.frame = frame;
    [self addSubview:button];
    [self.buttons addObject:button];
    //设置可滑动大小
    if ( width+100 > scrollWidth )
    {
        self.contentSize = CGSizeMake(width + button.frame.size.width, 0);
    }
}

-(void)makeScrollViewLeft{
    if (self.contentOffset.x == 0) {
        return;
    }
    __weak typeof(self)weakSelf =self;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.contentOffset = CGPointMake(0, 0);
    }];
}

-(void)makeScrollViewRight{
    UIButton *lastButton = [self.buttons lastObject];
    CGFloat maxX =  lastButton.frame.origin.x + lastButton.frame.size.width;
    CGFloat selfWidth = ScreenWidth - 40;
    if (self.contentOffset.x == (maxX - selfWidth)) {
        return;
    }
    __weak typeof(self)weakSelf =self;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.contentOffset = CGPointMake(maxX - selfWidth, 0);
    }];
}

-(void)makeScrollViewScrollInButtonIndex:(NSInteger )index{
    
//    NSLog(@"self.buttons.count = %d",self.buttons.count);
    if (index > self.buttons.count) {
        return;
    }
    UIButton *button = self.buttons[index];
    CGFloat buttonWidth = button.frame.size.width;
    __weak typeof(self)weakSelf =self;
    if (index >= 4) {
        [self makeScrollViewRight];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.contentOffset = CGPointMake(index * buttonWidth, 0);
        }];
    }
}


@end
