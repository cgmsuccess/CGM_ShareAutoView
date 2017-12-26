//
//  XC_OpptionView.h
//  optionsDemo
//
//  Created by 陈桂民 on 2017/12/26.
//  Copyright © 2017年 cgm. All rights reserved.
//


/*
 NSInteger rows = (count - 1) / cols + 1; //计算有多少列
 如何根据列数算行数   。总的选项数减 1 。除以 列数 加 1 即等于 行数
 */

#import <UIKit/UIKit.h>

@interface XC_OpptionView : UIView


/**  item的大小设置  ***/
@property (nonatomic,assign)CGFloat itemCellWidthAndHeight;


/**
 快速创建选项

 @param OptionsArrImage 选项图片
 @param titileArr 选项title
 @param count 有几列
 @param distance 选项距离上下的间距
 @return self
 */
-(instancetype)initWithOptionArr:(NSArray *)OptionsArrImage AndOptonsTitle:(NSArray *)titileArr
             AndOptionsRowsCount:(NSInteger)count AndOptionTopBottomDistance:(CGFloat)distance;


/**
 获得当前创建的视图的最适应高度

 @return 高度
 */
-(CGFloat)viewHeight;




@end
