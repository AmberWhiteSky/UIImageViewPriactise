//
//  ViewController.m
//  AmImageview
//
//  Created by AmberWhiteSky on 15/8/27.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"
#import "MyImageView.h"

@interface ViewController ()
- (IBAction)click;
@property(nonatomic,weak) MyImageView*  imageview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MyImageView *imageview = [[MyImageView  alloc]init];
    imageview.image = [UIImage  imageNamed:@"drink"];
    imageview.frame = CGRectMake(100, 100, 100, 100);
    [self.view  addSubview:imageview];
    self.imageview =imageview;
    
    
}



-(void) imageViewUse{
    UIImage  *image = [UIImage  imageNamed:@"drink"];
    
    UIImageView *imageview = [[UIImageView  alloc]initWithImage:image];
    imageview.image = [UIImage  imageNamed:@"drink"];
    imageview.frame = CGRectMake(100, 100, 100, 100);
    [self.view  addSubview:imageview];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click {
    _imageview.image =[UIImage  imageNamed:@"hong"];
    
    //    self.imageview.image = [UIImage  imageNamed:@"hong"];
    
}
@end
