//
//  JSFADViewControl.m
//  FiteamSoft_2.0
//
//  Created by 高云 on 16/1/11.
//  Copyright © 2016年 wangyongbo. All rights reserved.
//

#import "APPADViewControl.h"

@implementation APPADViewControl
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor blueColor];
    
    UIImageView * bgview=[[UIImageView alloc]initWithFrame:self.view.frame];
    bgview.image=[UIImage imageNamed:@"signin_bg"];
    [self.view addSubview:bgview];
}
@end
