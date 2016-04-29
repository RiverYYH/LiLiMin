//
//  JSFRedBadge.m
//  FiteamSoft_2.0
//
//  Created by 高云 on 15/12/28.
//  Copyright © 2015年 wangyongbo. All rights reserved.
//

#import "RedBadge.h"

@implementation RedBadge

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        self.titleLabel.font = setFont(11);
        [self setBackgroundImage:[UIImage resizedImageWithName:@"badge_circle_red"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        self.hidden = NO;
        // 设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        // 设置frame
        CGRect frame = self.frame;
        //        CGFloat badgeH = self.currentBackgroundImage.size.height;
        //        CGFloat badgeW = self.currentBackgroundImage.size.width;
        CGFloat badgeH = 8;
        CGFloat badgeW = 8;
        if (badgeValue.length > 1) {
            // 文字的尺寸
            NSDictionary *attribute = @{NSFontAttributeName : self.titleLabel.font};
            CGSize badgeSize = [badgeValue sizeWithAttributes:attribute];
            badgeW = badgeSize.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        frame.origin.x=frame.origin.x-2;
        frame.origin.y=frame.origin.y+2;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}
@end
