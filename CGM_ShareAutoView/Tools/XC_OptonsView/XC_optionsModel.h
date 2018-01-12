//
//  XC_optionsModel.h
//  CGM_ShareAutoView
//
//  Created by 陈桂民 on 2018/1/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XC_optionsModel : NSObject

/**  选项的title  ***/
@property (nonatomic,copy)NSString *optionTitle;

/**   选项的图片 ***/
@property (nonatomic,copy)NSString *optionsImage;

/**  选项的消息数 0 , 1 , 2 , 3, 4  ***/
@property (nonatomic,copy)NSString *markTitle;

@end
