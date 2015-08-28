//
//  ViewController.m
//  屏幕截图
//
//  Created by AmberWhiteSky on 15/8/28.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CatchPictureImageView.h"

@interface ViewController ()
- (IBAction)clicpScreen;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//按钮点击事件  屏幕截图
- (IBAction)clicpScreen {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //        //1.开启上下文
        //        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0);
        //
        //        //2. 将控制器view的layer渲染到上下文
        //        [ self.view.layer renderInContext :UIGraphicsGetCurrentContext()];
        //
        //        //3.取出图片
        //        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        //
        //        //写出文件
        //        NSData *data = UIImagePNGRepresentation(newImage);
        //        //    NSString *path = [[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"my.png"];
        //        NSString * filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject ] stringByAppendingPathComponent:@"my.png" ];
        //        NSLog(@"success");
        //        [data writeToFile:filepath atomically:YES];
        //
        //
        //        //4.结束上下文
        //        UIGraphicsEndImageContext();
        //
        
        UIImage *newImage = [UIImage  catchPicWithView:self.view];
        //写出文件
        NSData *data = UIImagePNGRepresentation(newImage);
        //    NSString *path = [[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"my.png"];
        NSString * filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject ] stringByAppendingPathComponent:@"my.png" ];
        NSLog(@"success");
        [data writeToFile:filepath atomically:YES];
        
        
    });
    
    
}
@end
