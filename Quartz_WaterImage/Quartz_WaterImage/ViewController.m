//
//  ViewController.m
//  Quartz_WaterImage
//
//  Created by AmberWhiteSky on 15/8/27.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+AmUIImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.返回水印图片
    UIImage *newImage = [UIImage waterImageWithBg:@"hong" logo:@"maomao"];
    
    //2.显示图片
    self.iconImage.image =newImage;
    
    
    
    
}

//打印水印图片
-(void) testWaterImage {
    
    UIImage  *oldimage = [UIImage  imageNamed:@"hong"];
    
    //位图上下文（bitmap）所有的东西需要绘制到一张新的图片上去
    
    //1.创建一个基于位图的上下文(开启一个基于位图的上下文)
    //size  尺寸
    //opaque yes 不透明 no  透明
    //scale
    UIGraphicsBeginImageContextWithOptions(oldimage.size, NO, 0.0);
    
    //2.先画背景图片
    [oldimage  drawInRect:CGRectMake(0, 0, oldimage.size.width, oldimage.size.height)];
    
    //3.画右下角水印图片
    UIImage  *smallimage = [UIImage  imageNamed:@"maomao"];
    CGFloat  margin =5;//间距
    
    CGFloat scale =0.2;
    CGFloat  smallwidth =smallimage.size.width*scale;
    CGFloat  smallheight = smallimage.size.height*scale;
    CGFloat smallx =oldimage.size.width-smallwidth-margin;
    CGFloat smally=oldimage.size.height-smallheight-margin;
    [smallimage drawInRect:CGRectMake(smallx, smally, smallwidth, smallheight)];
    
    //4.从上下文取得制作完毕的uiimage对象
    UIImage  *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.结束上下文
    UIGraphicsEndImageContext();
    
    //6.显示到uiimageview上
    self.iconImage.image =newimage;
    
    //7.将image对象 压缩为png格式的二进制数据
    NSData *data =  UIImagePNGRepresentation(newimage);
    //    UIImageJPEGRepresentation(<#UIImage *image#>, <#CGFloat compressionQuality#>)
    
    //8.写入文件
    NSString *path= [[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    NSLog(@"success");
    [data writeToFile:path atomically:YES];
    


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
