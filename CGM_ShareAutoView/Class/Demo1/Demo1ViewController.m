//
//  Demo1ViewController.m
//  CGM_ShareAutoView
//
//  Created by cgm on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Demo1ViewController.h"
#import "XC_OptionView.h"
@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO ;  //如果高度不准确。就是自动偏移了
    
    NSArray  * iamgeArr = @[@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png",@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png",@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png"];
     NSArray  * titleArr = @[@"QQ",@"空间",@"微信",@"朋友圈",@"QQ",@"空间",@"微信",@"朋友圈",@"QQ",@"空间",@"微信",@"朋友圈"];
    
    XC_OptionView *optionview = [[XC_OptionView alloc] initWithXCOptionColumn:5 AndImageArr:iamgeArr AndTitleArr:titleArr];
    
    
    optionview.backgroundColor = [UIColor cyanColor];
    CGFloat height = [optionview viewHeight];
    
    optionview.optionsBackColor = [[UIColor grayColor] colorWithAlphaComponent:0.3f];
    optionview.frame = CGRectMake(0, 66, KWidth, height);
   
    [self.view addSubview:optionview];
    
    optionview.cilckOptionHandle = ^(NSString *title, NSInteger index) {
      
        NSString *s = [NSString stringWithFormat:@"点击了%@  角标 %ld",title,index];
        NSLog(@"s = %@" ,s);
        
        [CGM_AlertContoller alertMesasge:s confirmHandler:^(UIAlertAction *No_cancal) {
            
        }];
        
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
