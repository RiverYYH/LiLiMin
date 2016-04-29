//
//  APPBadgeButton.m
//
//  Created by wangyongbo on 15/10/15.
//  Copyright (c) 2015年 wangyongbo. All rights reserved.
//

#import "APPBadgeButton.h"

@implementation APPBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        self.titleLabel.font = setFont(11);
        [self setBackgroundImage:[UIImage resizedImageWithName:@"circle_red"] forState:UIControlStateNormal];
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
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
//        CGFloat badgeH = 8;
//        CGFloat badgeW = 8;
            if (badgeValue.length > 1) {
                // 文字的尺寸
                NSDictionary *attribute = @{NSFontAttributeName : self.titleLabel.font};
                CGSize badgeSize = [badgeValue sizeWithAttributes:attribute];
                badgeW = badgeSize.width + 10;
            }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        frame.origin.x=frame.origin.x;
        frame.origin.y=frame.origin.y;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}

@end
