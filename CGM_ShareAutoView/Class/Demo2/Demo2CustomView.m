//
//  Demo2CustomView.m
//  CGM_ShareAutoView
//
//  Created by 陈桂民 on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Demo2CustomView.h"

@implementation Demo2CustomView


+(instancetype)loadShareView
{
    return [[NSBundle mainBundle] loadNibNamed:@"Demo2CustomView" owner:nil options:0][0];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




@end
