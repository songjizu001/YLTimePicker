![Logo](http://pic.58pic.com/58pic/12/71/65/13M58PICy8j.jpg)
YLTimePicker
===
- A display goods time control, displaying products to service time. If you have questions, please contact 1045329617 @qq.com
- 一个展示商品时间的控件，展示商品可服务的时间。如有问题请联系1045329617@qq.com

GitHub：[songjizu001](https://github.com/songjizu001)

# <a id="Getting_Started"></a> Getting Started【开始使用】

## <a id="Features"></a> Features【能做什么】
- YLTimePicker
*一个展示商品时间的控件，展示商品可服务的时间。如有问题请联系1045329617@qq.com
*工程中使用了Masonry纯代码自动布局的框架如果不想使用可以更改成frame

# <a id="Examples"></a> Examples【示例】


![](https://coding.net/u/songjizu/p/Time/git/blob/master/TimePick/YLTimePicker.gif)
![(demo)](https://coding.net/u/songjizu/p/Time/git/blob/master/TimePick/11111.png)
![(demo)](https://coding.net/u/songjizu/p/Time/git/blob/master/TimePick/12222.png)


```objc
@interface YLTimePicker ()<PopTimeViewDelegate>

@property(nonatomic,strong)NSMutableArray * dateArrM;

@property(nonatomic,strong)NSMutableArray * timeArrM;

@property(nonatomic,strong)YLDateScrollView * scroll;

@property(nonatomic,assign)int  count;//测试代码

@end

/***********************************************/


PopTimeView * pop =[[PopTimeView alloc]initWithDateArray:_dateArrM delegate:self DateDetailsArray:_timeArrM andViewShowTag:self.count];

[pop showInView:self.view];


- (void)didClickOnDateButton:(NSInteger )dateButtonIndex  andDateDetailsButton:(NSInteger )DateDetailsButtonIndex andPopTimeView:(PopTimeView *)PopTimeView{
NSArray * arry = self.timeArrM[dateButtonIndex];
NSLog(@"\n%@\n%@",arry[DateDetailsButtonIndex][@"yy_name"],arry[DateDetailsButtonIndex][@"label"]);

[PopTimeView tappedCancelWithStatus:YES];
}

```

### <a id="More_use_cases"></a> More use cases【更多用法】
- Please reference to `PopTimeView.h` and `DateView.h`
- Modification of internal parameters to fit your needs


## 期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的框架代码看看BUG修复没有）
* 如果在使用过程中发现功能不够用，希望你能Issues我 谢谢

