//
//  MyImageView.m
//  AmImageview
//
//  Created by AmberWhiteSky on 15/8/27.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void) drawRect:(CGRect)rect {

    [self.image  drawInRect:rect];
    

}

//第一  第一  第一 重写set方法

-(void)setImage:(UIImage *)image {
    _image =image;
    
    //重绘方法
    [self  setNeedsDisplay];


}
@end
