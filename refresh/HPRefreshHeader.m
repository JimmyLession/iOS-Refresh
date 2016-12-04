//
//  HPRefreshHeader.m
//  refresh
//
//  Created by 雷建民 on 16/12/2.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#define HPColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]


#import "HPRefreshHeader.h"

@interface HPRefreshHeader ()

@property (nonatomic ,weak) UILabel *title;
@property (nonatomic ,weak) UIImageView *topImageView;
@property (nonatomic ,weak) UIImageView *leftImageView;

@end


@implementation HPRefreshHeader

- (void)prepare
{
    [super prepare];
    
    self.backgroundColor = HPColor(242, 243, 244);
    self.mj_h = 288.0f;

    
    
    UIImageView *topImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_top_refresh_header"]];
    [self addSubview:topImage];
    self.topImageView = topImage;
    
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_refresh_ arrows"]];
    leftImage.backgroundColor = [UIColor clearColor];
    [self addSubview:leftImage];
    self.leftImageView = leftImage;
    
    
    UILabel *titleLable = [UILabel mj_label];
    titleLable.textColor = [UIColor lightGrayColor];
    titleLable.font = [UIFont systemFontOfSize:11];
    [self addSubview:titleLable];
    self.title = titleLable;
    
}


#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.topImageView.frame = CGRectMake(0, 0, self.mj_w, 244);
    
    self.leftImageView.frame = CGRectMake(self.mj_w * 0.5-7,CGRectGetMaxY(self.topImageView.frame)+5,14, 14);
    
    self.title.frame = CGRectMake(self.mj_w * 0.5+12,CGRectGetMaxY(self.topImageView.frame)+8 ,80 ,10);
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}
#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.leftImageView.image  = [UIImage imageNamed:@"icon_refresh_ arrows"];
            break;
        case MJRefreshStatePulling:
            //如果self的高度为默认或者小于150以下时候这里是会执行的。太高的时候就不执行了。。。
            self.leftImageView.image  = [UIImage imageNamed:@"icon_refresh_ arrows"];
            break;
        case MJRefreshStateRefreshing:
            self.title.text = @"正在刷新...";
          //  [self setUpRefreshLable:self.leftImageView];
            break;
        default:
            break;
    }
    
}


#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    NSLog(@"-------%.2f",pullingPercent);
    
    if (pullingPercent  < 0.20) {
        self.title.text = @"下拉刷新";
        [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
            self.leftImageView.transform = CGAffineTransformMakeRotation(0.000001 - M_PI);
        }];
    }
  
    
    if (pullingPercent > 0.20) {
       self.title.text = @"释放刷新";
        [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
            self.leftImageView.transform = CGAffineTransformIdentity;
        }];

    }
    
   
    
}














- (void)setUpRefreshLable:(UIImageView *)leftImage
{
    leftImage.image = nil;
    CGPoint point = CGPointMake(leftImage.frame.size.width/2, leftImage.frame.size.width/2);
    CGFloat ra = leftImage.frame.size.width/2;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0.9 * M_PI;
    CGFloat lineWidth = 4;
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:point radius:ra startAngle:startAngle endAngle:2*M_PI clockwise:YES];
    
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.frame = leftImage.bounds;
    shapeLayer2.strokeColor = [UIColor colorWithRed:191/255.0f green:191.0f/255.0f blue:191/255.0f alpha:1].CGColor;
    shapeLayer2.fillColor = [UIColor clearColor].CGColor;
    shapeLayer2.path = path2.CGPath;
    shapeLayer2.lineWidth = lineWidth;
    [leftImage.layer addSublayer:shapeLayer2];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:ra startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = leftImage.bounds;
    shapeLayer.strokeColor = [UIColor colorWithRed:131/255.0f green:131/255.0f blue:131/255.0f alpha:1].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = lineWidth;
    [leftImage.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animate.byValue = @(M_PI*2);
    animate.duration = 1;
    animate.repeatCount = MAXFLOAT;
    [shapeLayer addAnimation:animate forKey:@"animate"];

    
   }

@end
