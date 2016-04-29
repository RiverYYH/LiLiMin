//
//  AuthcodeView.m
//  LiLiMi
//
//  Created by wangyongbo on 16/3/10.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "AuthcodeView.h"

#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0];
#define kLineWidth 1.0
#define kFontSize [UIFont systemFontOfSize:arc4random() % 5 + 15]

@interface AuthcodeView()

@property (nonatomic, assign) NSInteger charCount;//验证字符个数

@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (nonatomic, assign) BOOL isNetWork;//是否是网络获取

@end

@implementation AuthcodeView

- (instancetype)initWithChatCount:(NSInteger)charCount
{
    self = [super init];
    if (self)
    {
        self.charCount = charCount;
        [self getAuthcode];//获得验证码
        self.isNetWork = NO;
    }
    return self;
}

-(instancetype)initWithNetwork
{
    self = [super init];
    if (self)
    {
        self.isNetWork = YES;
        [self getAuthcode];
    }
    return self;
}

-(void)layoutSubviews
{
    self.layer.cornerRadius = 5.0f;
    self.layer.masksToBounds = YES;
    self.backgroundColor = kRandomColor;
}

#pragma mark 获得验证码
- (void)getAuthcode
{
    //服务器获取
    if (self.isNetWork) {
        _authCodeStr = (NSMutableString *)@"滚你麻痹";
        self.charCount = _authCodeStr.length;
    }
    //本地生成
    else
    {
        //字符串素材
        _dataArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
        
        _authCodeStr = [[NSMutableString alloc] initWithCapacity:self.charCount];
        //随机从数组中选取需要个数的字符串，拼接为验证码字符串
        for (int i = 0; i < self.charCount; i++)
        {
            NSInteger index = arc4random() % (_dataArray.count-1);
            NSString *tempStr = [_dataArray objectAtIndex:index];
            _authCodeStr = (NSMutableString *)[_authCodeStr stringByAppendingString:tempStr];
        }
    }
}

#pragma mark 切换验证码
- (void)chengeAuthcode
{
    [self getAuthcode];
    
    //setNeedsDisplay调用drawRect方法来实现view的绘制
    [self setNeedsDisplay];
}

#pragma mark 点击界面切换验证码
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.isCanTouch) {
        [self chengeAuthcode];
    }
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //设置随机背景颜色
    self.backgroundColor = kRandomColor;
    
    //根据要显示的验证码字符串，根据长度，计算每个字符串显示的位置
    NSString *text = [NSString stringWithFormat:@"%@",_authCodeStr];
    
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    int width = rect.size.width/text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    
    CGPoint point;
    
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX,pY;
    for ( int i = 0; i<text.length; i++)
    {
        pX = arc4random() % width + rect.size.width/text.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize}];
    }
    
    //调用drawRect：之前，系统会向栈中压入一个CGContextRef，调用UIGraphicsGetCurrentContext()会取栈顶的CGContextRef
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线条宽度
    CGContextSetLineWidth(context, kLineWidth);
    
    //绘制干扰线
    for (int i = 0; i < self.charCount; i++)
    {
        UIColor *color = kRandomColor;
        CGContextSetStrokeColorWithColor(context, color.CGColor);//设置线条填充色
        
        //设置线的起点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        //设置线终点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        //画线
        CGContextStrokePath(context);
    }
}

- (NSInteger)charCount
{
    if (_charCount == 0) {
        return 4;
    }
    return _charCount;
}

@end
