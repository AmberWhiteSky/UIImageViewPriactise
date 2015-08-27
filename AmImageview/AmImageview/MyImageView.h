//
//  MyImageView.h
//  AmImageview
//
//  Created by AmberWhiteSky on 15/8/27.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyImageView : UIView
//自定义的属性 一定要重写set方法，并且在set方法中调用重绘方法刷新界面
@property(nonatomic,strong) UIImage *image;
@end
