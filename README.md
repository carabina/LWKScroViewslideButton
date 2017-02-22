# LWKScroViewslideButton
//初始化
- (instancetype)initWithFrame:(CGRect)frame andButtonStrs:(NSArray *)strArray;

//背景颜色和按钮字体的颜色及按钮选中时的字体颜色
- (void)setScrollViewBackColor:(UIColor *)ScrollViewBackColor andSetButtonTextColor:(UIColor *)ButtonTextColor 
andSetButtonSelectTextColor:(UIColor *)ButtonSelectTextColor;

//每个按钮的大小
- (void)setButtonWidth:(CGFloat)width;

//按钮点击的Block
@property(nonatomic,copy)selectIndex selectBlack;
