//
//  UIImage+XMGExternsion.m
//  百思不得姐
//
//  Created by 孙 on 2019/9/25.
//  Copyright © 2019 小情调. All rights reserved.
//

#import "UIImage+XMGExternsion.h"

#import <UIKit/UIKit.h>


@implementation UIImage (XMGExternsion)

- (instancetype)circleImage{
    //开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    //上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    //裁剪
    CGContextClip(ctx);
    //绘制图片
    [self drawInRect:rect];
    //获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图像上下文
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)circleImage:(NSString *)name{
    return [[self imageNamed:name]circleImage];
}
@end
