//
//  PopTimeView.m
//  PopViewDemo
//
//  Created by SongJizu on 15/5/8.
//  Copyright (c) 2015年 youlemobi. All rights reserved.
//

#import "PopTimeView.h"
#import "DatePickButton.h"
#import "DateView.h"


#define WINDOW_COLOR                        [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]
#define BACKGROUNDVIEWCOLOE                 [UIColor colorWithRed:214 green:214 blue:214 alpha:1]
#define ANIMATE_DURATION                    0.25f
#define ScreenWidth                         [UIScreen mainScreen].bounds.size.width
#define ScreenHeight                        [UIScreen mainScreen].bounds.size.height
#define POPVIEWDATEBUUTONTAG                1000    //下面的button的Tag
#define POPVIEWDATEDAYBUUTONTAG             100     //日期选择的Tag
#define UIColorFromRGB(r,g,b)               [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:1.0]
#define UIColorFromRGBA(r,g,b,a)            [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:a]


@interface PopTimeView ()
@property (nonatomic,strong) UIView     *   backGroundView;//背板菜单View
@property (nonatomic,assign) BOOL           isHadDataTitleButton;
@property (nonatomic,assign) BOOL           isHadTimeButton;
@property (nonatomic,assign) NSInteger      showTag;
@property (nonatomic,assign) CGFloat        popTimeHeight;//popView的高度
@property (nonatomic,strong) NSArray    *   DateArray;//预定日期的数组
@property (nonatomic,strong) NSArray    *   DateDetailsArray;//预定时间段的数组
@property (nonatomic,strong)DateView    *   date;//日期选择View
@property (nonatomic,assign) id<PopTimeViewDelegate>delegate;

@end

@implementation PopTimeView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithDateArray:(NSArray *)DateArray delegate:(id<PopTimeViewDelegate>)delegate DateDetailsArray:(NSArray *)DateDetailsArray andViewShowTag:(NSInteger )showTag{
    self = [super init];
    if (self) {
        //初始化背景视图，添加手势
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = WINDOW_COLOR;
        self.userInteractionEnabled = YES;
        self.showTag = showTag;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
        [self addGestureRecognizer:tapGesture];
        self.DateArray = DateArray;
        self.DateDetailsArray = DateDetailsArray;
        if (delegate) {
            self.delegate = delegate;
        }
        [self creatDetailsButtonTitles:DateArray andDateDetailsArray:DateDetailsArray ];
        
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectZero];
        button.tag = POPVIEWDATEDAYBUUTONTAG + showTag;
        [self dateButtonClick:button WithScroll:YES];
    }
    return self;
}
#pragma mark - 初始化上面的工具条
-(void)creatDetailsButtonTitles:(NSArray *)DateArray andDateDetailsArray:(NSArray * )DateDetailsArray {
   
    self.isHadDataTitleButton = NO;
    self.isHadTimeButton = NO;
    CGFloat  heigh  = 40;
    //生成popTimeSheetView
    self.backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 40)];
    self.backGroundView.backgroundColor = UIColorFromRGB(230, 240, 249);
    
    self.date =[[DateView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, heigh) andDateArray:DateArray];
    __weak typeof(self)weakSelf =self;
    _date.block = ^(UIButton * button ,YLDateScrollView * YLDateScrollView,DateView *dateView,NSInteger index){
        [weakSelf dateButtonClick:button WithScroll:NO];
    };
    [self.backGroundView addSubview:_date];

    NSArray * iermArrm = self.DateDetailsArray[0];
    NSInteger maxCount =iermArrm.count;
    
    for (int i = 0; i < self.DateDetailsArray.count; i ++) {
        NSArray * arr =self.DateDetailsArray[i];
        if (maxCount < arr.count) {
            maxCount = arr.count;
        }
    }
    //计算填出框的高度
    int lineCount = 4;
    int footmargin = 5 ;
    int dateBtnHeight = 50;
    self.popTimeHeight =
                        (maxCount % lineCount == 0) ?
                        (maxCount / lineCount * dateBtnHeight + heigh + footmargin ):
                        ((maxCount / lineCount +1) *dateBtnHeight + heigh + footmargin);

    [self addSubview:self.backGroundView];
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        [self.backGroundView setFrame:CGRectMake(0, ScreenHeight-self.popTimeHeight, ScreenWidth, self.popTimeHeight)];
    } completion:^(BOOL finished) {
    }];
    

}
#pragma mark - 初始换对应日期的选择时间段的界面
-(void)dateButtonClick:(UIButton *)sender WithScroll:(BOOL )Scroll{
    
    [self.backGroundView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton * button =  obj;
        (button.tag >= POPVIEWDATEBUUTONTAG)?[button removeFromSuperview]:YES;
    }];
    
    //设置按钮互斥点选
    NSMutableArray * top = self.date.buttons;
    [_DateArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton * btn = top[idx];
        btn.selected = (sender.tag - POPVIEWDATEDAYBUUTONTAG == idx)? YES :NO;
    }];
    
    //第一次允许默认选择
    if (Scroll == YES) {
        [self.date.scroll makeScrollViewScrollInButtonIndex:(sender.tag - POPVIEWDATEDAYBUUTONTAG)];
    }
    if ((sender.tag - POPVIEWDATEDAYBUUTONTAG) < 1) {
        [self.date leftButtonImageGrayColor];
    }else if((sender.tag - POPVIEWDATEDAYBUUTONTAG) >=4){
        [self.date rightButtonImageGrayColor];
    }
    if (sender.tag - POPVIEWDATEDAYBUUTONTAG > self.DateArray.count) {
        [self tappedCancelWithStatus:NO];
        return;
    }
    
    NSArray *dateButtonArray = self.DateDetailsArray[sender.tag - POPVIEWDATEDAYBUUTONTAG];
   
//    NSLog(@"%ld",dateButtonArray.count);

    int numOfLine = 4;
    CGFloat width = (ScreenWidth - 5)/4;
    CGFloat height = 50;

    [dateButtonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger x = idx % numOfLine;
        NSInteger y = idx / numOfLine;
        NSString * time = dateButtonArray[idx][@"label"];
        NSString * status = dateButtonArray[idx][@"yy_name"];
        NSDictionary* dic = dateButtonArray[idx];
        NSInteger a = [dic[@"disabled"] integerValue];
        DatePickButton * dateDetailsButton = [DatePickButton customButtonWithTitle:time andWithStatus:status andAppointment:a];
        dateDetailsButton.frame = CGRectMake(1 +(width+1)*x, 41 + (height + 1)*y, width,height);
        dateDetailsButton.tag = POPVIEWDATEBUUTONTAG + idx;
        dateDetailsButton.dateIndex =(int)sender.tag - POPVIEWDATEDAYBUUTONTAG;
        [dateDetailsButton addTarget:self action:@selector(dateDetailsButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.backGroundView addSubview:dateDetailsButton];
    }];

}

#pragma mark -  PopTimeViewDelegate
-(void)dateDetailsButton:(DatePickButton * )sender{
    
    NSInteger dateIndex = sender.dateIndex;
    NSInteger dateDetailsButtonTag = sender.tag - POPVIEWDATEBUUTONTAG;
    if (self.delegate) {
        if (!(sender.dateIndex >self.DateArray.count)) {
            if ([self.delegate respondsToSelector:@selector(didClickOnDateButton:andDateDetailsButton:andPopTimeView:)] == YES) {
                [self.delegate  didClickOnDateButton:dateIndex andDateDetailsButton:dateDetailsButtonTag andPopTimeView:self];
            }
        }
    }
}

-(void)tappedCancel{
    [self tappedCancelWithStatus:NO];
}

#pragma mark -  dismissFromSuperView
- (void)tappedCancelWithStatus:(BOOL)status{
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        [self.backGroundView setFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}
#pragma mark - 显示方法
- (void)showInView:(UIView *)view{
    
    UIView * coverView = [UIApplication sharedApplication].delegate.window.rootViewController.view;
    for (UIView * view in coverView.subviews) {
        if ([view isKindOfClass:self.class]) {
            [view removeFromSuperview];
        }
    }
    [coverView addSubview:self];
}
@end
