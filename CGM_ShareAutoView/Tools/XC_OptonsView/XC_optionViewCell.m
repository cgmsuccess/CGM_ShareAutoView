//
//  XC_optionViewCell.m
//  optionsDemo
//
//  Created by cgm on 2017/12/26.
//  Copyright © 2017年 cgm. All rights reserved.
//

#import "XC_optionViewCell.h"

@interface XC_optionViewCell()


@end

@implementation XC_optionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.markLabel.layer.masksToBounds = YES;
    self.markLabel.layer.cornerRadius = 10 ;
    
}

-(void)setModel:(XC_optionsModel *)model
{
    _model = model ;
    self.optionImageView.image = [UIImage imageNamed:_model.optionsImage];
    self.optionsTitle.text = _model.optionTitle ;
    self.markLabel.text = _model.markTitle ;
    if ([_model.markTitle isEqualToString:@"0"]) {
        self.markLabel.hidden = YES ;
    }else{
        self.markLabel.hidden = NO ;
    }
}


@end
