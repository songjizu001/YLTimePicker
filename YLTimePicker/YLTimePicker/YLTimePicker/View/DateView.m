//
//  DateView.m
//  CategoryTest
//
//  Created by SongJizu on 15/7/10.
//  Copyright (c) 2015年 youlemobi. All rights reserved.
//

#import "DateView.h"

#define POPVIEWDATEDAYBUUTONTAG                 100     //日期选择的Tag
#define DateScrollLeftTag                       9999    //左边button的Tag
#define DateScrollRightTag                      9998    //左边button的Tag
#define ScreenWidth                             [UIScreen mainScreen].bounds.size.width
#define ScreenHeight                            [UIScreen mainScreen].bounds.size.height
#define kDevice_Is_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define UIColorFromRGB(r,g,b)   [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:1.0]


@interface DateView ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIButton * leftButton;

@property(nonatomic,strong)UIButton * rightButton;

@end

@implementation DateView

-(UIColor *)randomColor{
    CGFloat hue        = ( arc4random() % 256 / 256.0 );//0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;// 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;//0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (UIImage *)buttonImageFromColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (id)initWithFrame:(CGRect)frame andDateArray:(NSArray *)DateArray{
    
    if (self = [super initWithFrame:frame]) {

        self.DateArray = DateArray;
        self.buttons = [NSMutableArray array];
        if (self.DateArray.count >0) {
            
            [self buildDateView];
            
            [self buildLeftAndRightButton];
        }
    }
    return self;
}

-(void)buildLeftAndRightButton{
    UIButton * leftButton =[UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 18, 40);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"icon_redjt_left"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftButton];
    UIButton * rightButton =[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(self.scroll.frame.origin.x + self.scroll.frame.size.width+2, 0, 18, 40);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"icon_redjt_right"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightButton];
    self.leftButton = leftButton;
    self.rightButton = rightButton;
}

-(void)buildDateView{
    
    self.scroll = [[YLDateScrollView alloc] init];
    _scroll.delegate = self;
    _scroll.frame = CGRectMake(20, 0, ScreenWidth - 40, 40);
    _scroll.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:_scroll];
    for (int i = 0; i <self.DateArray.count; i++) {
        UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        NSString * title =_DateArray[i];
        if([title rangeOfString:@"年"].location !=NSNotFound){
            if (title.length > 5) {
                title = [title substringFromIndex:5];
            }
        }
        [button setTitle:title forState:UIControlStateNormal];
//        button.backgroundColor  =[self randomColor];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.layer.borderColor = UIColorFromRGB(225, 225, 213).CGColor;
        button.layer.borderWidth = 0.5f;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageNamed:@"date_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"date_selected"] forState:UIControlStateSelected];
        button.tag = POPVIEWDATEDAYBUUTONTAG + i;
        [button addTarget:self action:@selector(dataButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scroll addButton:button AndWithScrollWidth:(ScreenWidth - 40)];
        [self.buttons addObject:button];
    }
    
//    NSLog(@"%ld",self.buttons.count);
}


-(void)dataButtonClick:(UIButton *)sender{
    if (self.block) {
        self.block(sender,self.scroll,self,sender.tag);
    }
}

-(void)leftButtonClick:(UIButton * )sender{
    [self.scroll makeScrollViewLeft];
    [self leftButtonImageGrayColor];
}

-(void)rightButtonClick:(UIButton * )sender{
    [self.scroll makeScrollViewRight];
    [self rightButtonImageGrayColor];
}


-(void)leftButtonImageGrayColor{
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"icon_greyjt_left"] forState:UIControlStateNormal];
}

-(void)rightButtonImageGrayColor{
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"icon_greyjt_right"] forState:UIControlStateNormal];
}

#pragma mark - scrillViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
//    NSLog(@"scrollView.contentOffset.x = %f,%f",scrollView.contentOffset.x ,scrollView.frame.size.width);
    CGFloat rigth = 0;
    if (kDevice_Is_iPhone5||kDevice_Is_iPhone4) {
        rigth = 320;
    }else if (kDevice_Is_iPhone6){
        rigth = 265;
    }else if (kDevice_Is_iPhone6Plus){
        rigth = 326;
    }
    if (scrollView.contentOffset.x <= 0 ) {
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"icon_greyjt_left"] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"icon_redjt_right"] forState:UIControlStateNormal];
    }else if (scrollView.contentOffset.x >= rigth){
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"icon_greyjt_right"] forState:UIControlStateNormal];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"icon_redjt_left"] forState:UIControlStateNormal];
    }else{
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"icon_redjt_left"] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"icon_redjt_right"] forState:UIControlStateNormal];
    }
}

@end
