//
//  Demo2ViewController.m
//  CGM_ShareAutoView
//
//  Created by 陈桂民 on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Demo2ViewController.h"
#import "XC_OptionView.h"
#import "Demo2CustomView.h"

@interface Demo2ViewController ()
{
    XC_OptionView *optionview ;
}
@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO ;  //如果高度不准确。就是自动偏移了
    
    [self optionsView]; //快速创建
    
    [self instructions];//说明
    
}

-(void)instructions
{
    
    Demo2CustomView *view = [Demo2CustomView loadShareView];
    view.frame = CGRectMake(0, CGRectGetMaxY(optionview.frame), KWidth, 330);    
    [self.view addSubview:view];
    
}


-(void)optionsView
{
    NSArray  * iamgeArr = @[@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png",@"ic_qiuqiu.png"];
    NSArray  * titleArr = @[@"QQ",@"空间",@"微信",@"朋友圈",@"QQ"];
    
    optionview = [[XC_OptionView alloc] initWithOptionArr:iamgeArr AndOptonsTitle:titleArr AndOptionsRowsCount:5 AndOptionTopBottomDistance:10 AndOptionsHeight:100];
    
    optionview.backgroundColor = [UIColor cyanColor];
    CGFloat height = [optionview viewHeight];
    
    optionview.optionsBackColor = [UIColor whiteColor] ;
    optionview.frame = CGRectMake(0, 64, KWidth, height);
    optionview.itemCellWidthAndHeight = 40;
    optionview.optionsTitleColor = [UIColor redColor];
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
