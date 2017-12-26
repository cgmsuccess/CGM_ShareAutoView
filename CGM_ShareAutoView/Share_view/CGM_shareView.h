//
//  CGM_shareView.h
//  QQ_ShareView
//
//  Created by apple on 17/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 NSInteger rows = (count - 1) / cols + 1; //计算有多少列
 如何根据列数算行数   。总的选项数减 1 。除以 列数 加 1 即等于 行数
 */

@interface CGM_shareView : UIView

/**
 创建分享弹出

 @param titleAlrr 分享按钮名称
 @param imageArr  分享按钮图片
 @param offset    视图是否偏移64个单位，为什么留这个参数，因为 以前用的XC_tabbar 作为根视图。现在排行 界面用的 RanKtababr.作为管理，中间的跳转用的 modal 方法 ,所以造成了  keywindow  拿window 的时候，因为有navargationabr 的原因 居然向下偏移了 64 个单位  ,传NO 就可以了
 @param  setcols  自定义列数
 @return CGM_shareView
 */
-(instancetype)initWithTitle:(NSArray *)titleAlrr AndWithImage:(NSArray *)imageArr Andcols:(NSInteger)setcols AndOffset:(BOOL)offset;

@property (nonatomic,copy)void(^selectBlock)(NSString *selectStr); //选择回调


@end
