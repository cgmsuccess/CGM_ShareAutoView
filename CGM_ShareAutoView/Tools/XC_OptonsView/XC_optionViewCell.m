//
//  XC_optionViewCell.m
//  optionsDemo
//
//  Created by cgm on 2017/12/26.
//  Copyright © 2017年 cgm. All rights reserved.
//

#import "XC_optionViewCell.h"

@implementation XC_optionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.markLabel.layer.masksToBounds = YES;
    self.markLabel.layer.cornerRadius = 10 ;
    
}



@end
