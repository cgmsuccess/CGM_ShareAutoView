//
//  XC_optionViewCell.h
//  optionsDemo
//
//  Created by cgm on 2017/12/26.
//  Copyright © 2017年 cgm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XC_optionViewCell : UICollectionViewCell

/**   提示点   */
@property (weak, nonatomic) IBOutlet UILabel *markLabel;

/**   提示点的高   */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markLabelHeigt;

/**   提示点的宽   */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markLabelWidth;



// MARK:- 选项的图片
@property (weak, nonatomic) IBOutlet UIImageView *optionImageView;
// MARK:- 选项的标题
@property (weak, nonatomic) IBOutlet UILabel *optionsTitle;


// MARK:- 宽度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellWidth;
// MARK:- 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellHeight;


@end
