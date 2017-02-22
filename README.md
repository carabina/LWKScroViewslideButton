
# LWKScroViewslideButton
# pod 'LwkScrollViewSlideBtton', '~> 0.0.1'
- (void)viewDidLoad {
    [super viewDidLoad];
    
    LWKScroViewslideButton * buttonView = [[LWKScroViewslideButton alloc] initWithFrame:CGRectMake(0, 200, [[UIScreen mainScreen] bounds].size.width, 50) andButtonStrs:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]];
    
    [buttonView setScrollViewBackColor:[UIColor whiteColor] andSetButtonTextColor:[UIColor grayColor] andSetButtonSelectTextColor:[UIColor greenColor]];
    
    buttonView.selectBlack = ^(int num,NSString * str){
        NSLog(@"%d,->(%@)",num,str);
    };
    
    [self.view addSubview:buttonView];
    
}



//初始化(返回一个UIView *对象)
- (instancetype)initWithFrame:(CGRect)frame andButtonStrs:(NSArray *)strArray;

//背景颜色和按钮字体的颜色及按钮选中时的字体颜色
- (void)setScrollViewBackColor:(UIColor *)ScrollViewBackColor andSetButtonTextColor:(UIColor *)ButtonTextColor 
andSetButtonSelectTextColor:(UIColor *)ButtonSelectTextColor;

//每个按钮的大小
- (void)setButtonWidth:(CGFloat)width;

//按钮点击的Block,
@property(nonatomic,copy)selectIndex selectBlack;
