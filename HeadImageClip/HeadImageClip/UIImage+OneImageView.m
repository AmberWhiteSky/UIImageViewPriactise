//
//  UIImage+OneImageView.m
//  HeadImageClip
//
//  Created by AmberWhiteSky on 15/8/28.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "UIImage+OneImageView.h"

@implementation UIImage (OneImageView)
+(instancetype)circleImageView:(NSString *)name borderWidth:(CGFloat)borderWidth boderColor:(UIColor *)borderColoer {

    //1.加载原图
    UIImage  *oldImage = [UIImage  imageNamed:name];
    //2.开启上下文
    //    CGFloat  borderw=2;
    CGFloat  imageW =oldImage.size.width+2*borderWidth;
    CGFloat  imageH =oldImage.size.height+2*borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    //    CGFloat scale =0.2;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    //3.取得当前的上下文
    CGContextRef  context =UIGraphicsGetCurrentContext();
    
    //4 画边框
    //    [[UIColor  greenColor] set];
    [borderColoer set];
    CGFloat bigRadius =imageW*0.5;
    CGFloat centerX=bigRadius;//圆心
    CGFloat centerY =bigRadius;//圆心
    CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //5小图片
    CGFloat  smallRadius =bigRadius-borderWidth;
    CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI*2, 0);
    //6裁剪
    CGContextClip(context);
    
    //7画图
    [oldImage  drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    
    //8取图
    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
    //9结束
    UIGraphicsEndImageContext();
    
    return   newImage;

}
@end
