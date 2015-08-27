//
//  UIImage+AmUIImage.m
//  Quartz_WaterImage
//
//  Created by AmberWhiteSky on 15/8/27.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "UIImage+AmUIImage.h"

@implementation UIImage (AmUIImage)
/**  
 *打水印图片
 *bg 背景图片
 *logo 右下角水印图片
 **/
+(instancetype)  waterImageWithBg :(NSString *) bg logo:(NSString *) logo{



    UIImage  *oldimage = [UIImage  imageNamed:bg];
    
    //位图上下文（bitmap）所有的东西需要绘制到一张新的图片上去
    
    //1.创建一个基于位图的上下文(开启一个基于位图的上下文)
    //size  尺寸
    //opaque yes 不透明 no  透明
    //scale
    UIGraphicsBeginImageContextWithOptions(oldimage.size, NO, 0.0);
    
    //2.先画背景图片
    [oldimage  drawInRect:CGRectMake(0, 0, oldimage.size.width, oldimage.size.height)];
    
    //3.画右下角水印图片
    UIImage  *smallimage = [UIImage  imageNamed:logo];
    CGFloat  margin =5;//间距
    
    CGFloat scale =0.2;//缩放
    CGFloat  smallwidth =smallimage.size.width*scale;
    CGFloat  smallheight = smallimage.size.height*scale;
    CGFloat smallx =oldimage.size.width-smallwidth-margin;
    CGFloat smally=oldimage.size.height-smallheight-margin;
    [smallimage drawInRect:CGRectMake(smallx, smally, smallwidth, smallheight)];
    
    //4.从上下文取得制作完毕的uiimage对象
    UIImage  *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.结束上下文
    UIGraphicsEndImageContext();
    
    return newimage;
    
};

@end
