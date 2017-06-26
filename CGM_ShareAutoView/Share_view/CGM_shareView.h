//
//  CGM_shareView.h
//  QQ_ShareView
//
//  Created by apple on 17/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGM_shareView : UIView

/**
 创建分享弹出

 @param titleAlrr 分享按钮名称
 @param imageArr  分享按钮图片
 @param offset    视图是否偏移64个单位，为什么留这个参数，因为 以前用的XC_tabbar 作为根视图。现在排行 界面用的 RanKtababr.作为管理，中间的跳转用的 modal 方法 ,所以造成了  keywindow  拿window 的时候，因为有navargationabr 的原因 居然向下偏移了 64 个单位  ,传NO 就可以了

 @return CGM_shareView
 */
-(instancetype)initWithTitle:(NSArray *)titleAlrr AndWithImage:(NSArray *)imageArr AndOffset:(BOOL)offset;

@property (nonatomic,copy)void(^selectBlock)(NSString *selectStr); //选择回调

@end
