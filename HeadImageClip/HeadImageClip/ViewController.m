//
//  ViewController.m
//  HeadImageClip
//
//  Created by AmberWhiteSky on 15/8/27.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //1.加载原图
    UIImage  *oldImage = [UIImage  imageNamed:@"hong"];
    //2.开启上下文
    CGFloat  borderw=2;
    CGFloat  imageW =oldImage.size.width+2*borderw;
    CGFloat  imageH =oldImage.size.height+2*borderw;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    //    CGFloat scale =0.2;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    //3.取得当前的上下文
    CGContextRef  context =UIGraphicsGetCurrentContext();
    
    //4 画边框
    [[UIColor  greenColor] set];
    CGFloat bigRadius =imageW*0.5;
    CGFloat centerX=bigRadius;//圆心
    CGFloat centerY =bigRadius;//圆心
    CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //5小图片
    CGFloat  smallRadius =bigRadius-borderw;
    CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI*2, 0);
    //6裁剪
    CGContextClip(context);
    
    //7画图
    [oldImage  drawInRect:CGRectMake(borderw, borderw, oldImage.size.width, oldImage.size.height)];
    
    
    //8取图
    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
    //9结束
    UIGraphicsEndImageContext();
    //10显示
    self.image.image =newImage;
    
    //11.写出文件
    NSData *data = UIImagePNGRepresentation(newImage);
    //    NSString *path = [[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"my.png"];
    NSString * filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject ] stringByAppendingPathComponent:@"my.png" ];
    NSLog(@"success");
    [data writeToFile:filepath atomically:YES];
    
}



-(void)  clipImageView{
    
    //1 加载原图
    UIImage *oldImage = [UIImage  imageNamed:@"hong"];
    
    //2 开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    
    //3
    //上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //4.画图
    CGRect  circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);
    CGContextAddEllipseInRect(context, circleRect);
    
    
    //5。裁剪
    //按照当前的路径形状 （圆形）裁剪  超出这个形状以外的哪痛都不显示
    CGContextClip(context);
    
    //6.画图
    [oldImage  drawInRect:circleRect];
    
    
    //7 .保存图片
    UIImage  *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //8.结束
    UIGraphicsEndImageContext();
    
    //9.写出文件
    NSData *data = UIImagePNGRepresentation(newImage);
    //    NSString *path = [[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"my.png"];
    NSString * filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject ] stringByAppendingPathComponent:@"my.png" ];
    [data writeToFile:filepath atomically:YES];
    
    
    //10.显示图片
    self.image.image =newImage;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
