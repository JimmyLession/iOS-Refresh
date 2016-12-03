//
//  ViewController.m
//  refresh
//
//  Created by 雷建民 on 16/12/2.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *lable = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 30, 30)];
    lable.backgroundColor = [UIColor clearColor];
    
    CGPoint point = CGPointMake(lable.frame.size.width/2, lable.frame.size.width/2);
    CGFloat ra = lable.frame.size.width/2;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0.9 * M_PI;
    CGFloat lineWidth = 4;
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:point radius:ra startAngle:startAngle endAngle:2*M_PI clockwise:YES];
    
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.frame = lable.bounds;
    shapeLayer2.strokeColor = [UIColor colorWithRed:191/255.0f green:191.0f/255.0f blue:191/255.0f alpha:1].CGColor;
    shapeLayer2.fillColor = [UIColor clearColor].CGColor;
    shapeLayer2.path = path2.CGPath;
    shapeLayer2.lineWidth = lineWidth;
    [lable.layer addSublayer:shapeLayer2];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:ra startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = lable.bounds;
    shapeLayer.strokeColor = [UIColor colorWithRed:131/255.0f green:131/255.0f blue:131/255.0f alpha:1].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = lineWidth;
    [lable.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animate.byValue = @(M_PI*2);
    animate.duration = 1;
    animate.repeatCount = MAXFLOAT;
    [shapeLayer addAnimation:animate forKey:@"animate"];
    [self.view addSubview:lable];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
