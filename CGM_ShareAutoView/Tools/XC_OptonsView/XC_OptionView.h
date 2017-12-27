//
//  XC_OpptionView.h
//  optionsDemo
//
//  Created by cgm on 2017/12/26.
//  Copyright © 2017年 cgm. All rights reserved.
//


/*
 NSInteger rows = (count - 1) / cols + 1; //计算有多少列
 如何根据列数算行数   。总的选项数减 1 。除以 列数 加 1 即等于 行数
 */

#import <UIKit/UIKit.h>

@interface XC_OptionView : UIView

/**  每个item的图片大小设置  设置宽高的。不建议超过50 。如果要想超过50.那么创建的时候设置 optionsHeight 选择高度再次基础上加 20 label 的高度 ***/
@property (nonatomic,assign)CGFloat itemCellWidthAndHeight;

/**  每个item选项的标题的字体大小  ***/
@property (nonatomic,assign)CGFloat titleFont;

/**  每个item选项的字体的颜色   ***/
@property (nonatomic)UIColor *optionsTitleColor;

/**  每个item选项的颜色  ***/
@property (nonatomic)UIColor *optionsBackColor;


/**  点击每个选项的block回调 ***/
@property (nonatomic,copy)void(^cilckOptionHandle)(NSString *title , NSInteger index);


/**
 简单的自定义创建 ，配合属性进行简单的宽高设置
 @param OptionsArrImage 选项图片
 @param titileArr 选项title
 @param count 有几列
 @param distance 选项距离上下的间距
 @param optionsHeight 选项的高度，建议72 ，他的高度是默认的 图片高度50 + 21 label 高度，如果上面设置了图片高度再次基础 + 20 即可
 @return self
 
 */
-(instancetype)initWithOptionArr:(NSArray *)OptionsArrImage AndOptonsTitle:(NSArray *)titileArr
             AndOptionsRowsCount:(NSInteger)count AndOptionTopBottomDistance:(CGFloat)distance AndOptionsHeight:(CGFloat)optionsHeight;


/**
 快速创建
 @param Colnumer 列数
 @param imageArr 图片数组
 @param titleArr 字体数组
 @return self
 */
-(instancetype)initWithXCOptionColumn:(NSInteger)Colnumer AndImageArr:(NSArray *)imageArr AndTitleArr:(NSArray *)titleArr;



/**
 获得当前创建的视图的最适应高度。建议使用此属性设置frame 的高度 
 @return 高度
 */
-(CGFloat)viewHeight;




@end
