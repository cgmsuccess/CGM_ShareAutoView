//
//  ViewController.m
//  CGM_ShareAutoView
//
//  Created by apple on 17/6/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"

#import "CGM_shareView.h"

#import "CGM_AlertContoller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)ActionBtn:(id)sender {
    
    
        NSArray *iamgeArr = @[@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png",@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png"];
        NSArray *titleArr = @[@"QQ",@"空间",@"微信",@"朋友圈",@"QQ",@"空间",@"微信",@"朋友圈"];
        //分享页面
        CGM_shareView *shareView = [[CGM_shareView alloc] initWithTitle:titleArr AndWithImage:iamgeArr AndOffset:NO];
        shareView.selectBlock=^(NSString *platForm){
            //分享对应platframe
            NSLog(@"platForm = %@" ,platForm) ;
            
            [CGM_AlertContoller  alertMesasgeTwoBtn:platForm AndUIAlertControllerStyle:UIAlertControllerStyleAlert confirmHandler:^(UIAlertAction *No_cancal) {
                
            } AndconfirmActionString:platForm cancleHandler:^(UIAlertAction *cancal) {
                
            } AndcancleString:@"取消"];
            
        };
    
   
    
        [self.view addSubview: shareView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
