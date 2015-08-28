//
//  ViewController.m
//  平铺背景
//
//  Created by AmberWhiteSky on 15/8/28.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    self.view.backgroundColor  =[UIColor yellowColor];
    
    //
//    UIImage * oldImage = [UIImage  imageNamed:@"hong"];
//    self.view.backgroundColor = [UIColor  colorWithPatternImage:oldImage];
    
    
    //1.创建一行的背景图片
    CGFloat  bgw= self.view.frame.size.width;
    CGFloat   bgH =40;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(bgH, bgH), NO, 0.0);
    
     CGContextRef context =UIGraphicsGetCurrentContext();
    //画矩形框
    
    [[UIColor  greenColor ]set];
    CGContextAddRect(context, CGRectMake(0, 0, bgw, bgH));
    CGContextFillPath(context);
    
    //2.画线
    [[UIColor  blackColor]set];
    CGFloat lineWidth=2;
    CGContextSetLineWidth(context, lineWidth);
    CGFloat dividerX=10;
    CGFloat dividerY= bgH-lineWidth;
    CGContextMoveToPoint(context, dividerX, dividerY);
    CGContextAddLineToPoint(context, bgw-dividerX, dividerY);
    CGContextStrokePath(context);
    
    //3取图
    UIImage  *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //4.结束上下文
    UIGraphicsEndImageContext();
    
    //5.设置为背景
    self.view.backgroundColor  = [UIColor  colorWithPatternImage:newImage];
    
}


-(void)  setBg{
    UIImage *oldImage = [UIImage  imageNamed:@"hong"];
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0);
    [oldImage  drawInRect:self.view.bounds];
    
    UIImage *newImage  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor =[UIColor  colorWithPatternImage:newImage];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
