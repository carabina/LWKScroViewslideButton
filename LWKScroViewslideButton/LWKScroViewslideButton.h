//
//  LWKScroViewslideButton.h
//  Huihui
//
//  Created by 伟凯   刘 on 2017/2/21.
//  Copyright © 2017年 pg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectIndex)(int,NSString *);

@interface LWKScroViewslideButton : UIView <UIScrollViewDelegate>

@property(nonatomic,assign)CGSize buttonSize;

- (instancetype)initWithFrame:(CGRect)frame andButtonStrs:(NSArray *)strArray;
- (void)setScrollViewBackColor:(UIColor *)ScrollViewBackColor andSetButtonTextColor:(UIColor *)ButtonTextColor andSetButtonSelectTextColor:(UIColor *)ButtonSelectTextColor;
- (void)setButtonWidth:(CGFloat)width;

@property(nonatomic,copy)selectIndex selectBlack;
@end
