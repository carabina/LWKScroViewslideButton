//
//  LWKScroViewslideButton.m
//  Huihui
//
//  Created by 伟凯   刘 on 2017/2/21.
//  Copyright © 2017年 pg. All rights reserved.
//

#import "LWKScroViewslideButton.h"

@implementation LWKScroViewslideButton{
    
    UIScrollView * _scrollView;
    NSMutableArray * _lablesArray;
    NSArray * _stringArray;
    UIColor * _selectColor;
    UIColor * _textColor;
    
}


- (instancetype)initWithFrame:(CGRect)frame andButtonStrs:(NSArray *)strArray{
    self = [super initWithFrame:frame];
    if (self){
        
        _lablesArray = [[NSMutableArray alloc] init];
        _stringArray = strArray;
        [self createUI:strArray];
    }
    return  self;
}

- (void)createUI:(NSArray *)strArray{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(60 * [strArray count], self.frame.size.height);
    [self addSubview:_scrollView];
    
    if (strArray.count != 0){
        
        for (NSInteger i = 0; i < [strArray count] ; i++ ){
            
            UILabel * lable = [self createLables];
            if (i == 0){
                lable.textColor = [UIColor greenColor];
                lable.font = [UIFont systemFontOfSize:16];
            }else{
                lable.textColor = [UIColor grayColor];
                lable.font = [UIFont systemFontOfSize:14];
            }
            lable.tag = 100 + i;
            lable.frame = CGRectMake(60 * i, 0, 60, 40);
            lable.text = strArray[i];
            UITapGestureRecognizer * lableGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lableGesAction:)];
            [lable addGestureRecognizer:lableGes];
            [_scrollView addSubview:lable];
            
            [_lablesArray addObject:lable];
            
        }
    }
    
    
}
- (void)lableGesAction:(UIGestureRecognizer *)ges{
    
    int index = (int)ges.view.tag - 100;
    for (int i = 0; i < [_lablesArray count]; i ++){
         UILabel * lable = _lablesArray[i];
        if (index == i){
            [UIView animateWithDuration:0.5 animations:^{
                lable.textColor = _selectColor;
                lable.font = [UIFont systemFontOfSize:16];
            }];
            
            if (_selectBlack){
                _selectBlack(i,_stringArray[i]);
            }
            if (((lable.frame.origin.x + 60) > [[UIScreen mainScreen] bounds].size.width/2)){
                if ((_scrollView.contentSize.width - lable.frame.origin.x) < [[UIScreen mainScreen] bounds].size.width/2){
                    [UIView animateWithDuration:0.5 animations:^{
                        _scrollView.contentOffset = CGPointMake(_scrollView.contentSize.width - [[UIScreen mainScreen] bounds].size.width, 0.0);
                    }];
                    
                }else{
                    CGFloat _lable_X = lable.frame.origin.x;
                    CGFloat _X = _lable_X - [[UIScreen mainScreen] bounds].size.width/2;
                    [UIView animateWithDuration:0.5 animations:^{
                        _scrollView.contentOffset = CGPointMake(_X + 30, 0.0);
                    }];
                    
                }
                
            }else{
                [UIView animateWithDuration:0.5 animations:^{
                    _scrollView.contentOffset = CGPointMake(0.0, 0.0);
                }];
                
            }
            
            
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                lable.textColor = _textColor;
                lable.font = [UIFont systemFontOfSize:14];
            }];
            
        }
    }
    
    
}
- (UILabel *)createLables{
    
    UILabel * lable = [[UILabel alloc] init];
    lable.userInteractionEnabled = YES;
    lable.textAlignment = NSTextAlignmentCenter;
    
    return lable;
}
- (void)setScrollViewBackColor:(UIColor *)ScrollViewBackColor andSetButtonTextColor:(UIColor *)ButtonTextColor andSetButtonSelectTextColor:(UIColor *)ButtonSelectTextColor{
    _scrollView.backgroundColor = ScrollViewBackColor;
    _selectColor = ButtonSelectTextColor;
    _textColor = ButtonTextColor;
    [self delete];
    if (_stringArray.count != 0){
        
        for (NSInteger i = 0; i < [_stringArray count] ; i++ ){
            
            UILabel * lable = [self createLables];
            if (i == 0){
                lable.textColor = _selectColor;
                lable.font = [UIFont systemFontOfSize:16];
            }else{
                lable.textColor = _textColor;
                lable.font = [UIFont systemFontOfSize:14];
            }
            lable.tag = 100 + i;
            lable.frame = CGRectMake(60 * i, 0, 60, 40);
            lable.text = _stringArray[i];
            UITapGestureRecognizer * lableGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lableGesAction:)];
            [lable addGestureRecognizer:lableGes];
            [_scrollView addSubview:lable];
            
            [_lablesArray addObject:lable];
            
        }
    }
    
}
- (void)setButtonWidth:(CGFloat)width{
    _scrollView.contentSize = CGSizeMake(width * [_stringArray count], 0.0);
    [self delete];
    if (_stringArray.count != 0){
        
        for (NSInteger i = 0; i < [_stringArray count] ; i++ ){
            
            UILabel * lable = [self createLables];
            if (i == 0){
                lable.textColor = _selectColor;
                lable.font = [UIFont systemFontOfSize:16];
            }else{
                lable.textColor = _textColor;
                lable.font = [UIFont systemFontOfSize:14];
            }
            lable.tag = 100 + i;
            lable.frame = CGRectMake(width * i, 0, width, 40);
            lable.text = _stringArray[i];
            UITapGestureRecognizer * lableGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lableGesAction:)];
            [lable addGestureRecognizer:lableGes];
            [_scrollView addSubview:lable];
            
            [_lablesArray addObject:lable];
            
        }
    }
}
- (void)delete{
    for (id subView in _scrollView.subviews ){
        [subView removeFromSuperview];
    }
    [_lablesArray removeAllObjects];
}
@end
