//
//  Demo3ViewController.m
//  CGM_ShareAutoView
//
//  Created by 陈桂民 on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Demo3ViewController.h"
#import "XC_OptionView.h"

@interface Demo3ViewController ()
{
    XC_OptionView *optionview ;
}
@end

@implementation Demo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ////////////////////这个一定不能少。不然会偏移的
    self.automaticallyAdjustsScrollViewInsets = NO ;  //如果高度不准确。就是自动偏移了
    
    
    [self creatOptions]; //创建选项
    
    
    [self lizi];//创建例子图片
  
}

-(void)lizi
{

    UIImage *image = [UIImage imageNamed:@"qqqq.png"];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, KWidth, 200)];
    
    imageview.image = image ;
    [self.view addSubview:imageview];
}

-(void)creatOptions
{
    NSArray  * iamgeArr = @[@"bags.png",@"folder.png",@"QRCode.png",@"service.png",@"set.png"];
    NSArray  * titleArr = @[@"购物",@"文件",@"二维码",@"客服",@"设置"];
    
    optionview = [[XC_OptionView alloc] initWithOptionArr:iamgeArr AndOptonsTitle:titleArr AndOptionsRowsCount:5 AndOptionTopBottomDistance:10 AndOptionsHeight:72];
    
    
    
    //这里设置一样的颜色就可以不显示缝隙了。
    optionview.optionsBackColor = [UIColor whiteColor] ;
    optionview.backgroundColor = Color(232, 241, 241, 1);
    CGFloat height = [optionview viewHeight];

    optionview.frame = CGRectMake(0, 64, KWidth, height);
    
    optionview.optionsTitleColor = [UIColor grayColor];
    optionview.itemCellWidthAndHeight = 20;
    
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
