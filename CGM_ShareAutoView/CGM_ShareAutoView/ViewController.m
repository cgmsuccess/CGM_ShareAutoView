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

#import "XC_OptionView.h"

#define KWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    //// 组1 数据
    NSArray *DataSourceArr;
    NSArray *iamgeArr ;
    NSArray *titleArr ;


    ///组二数据
    NSArray *secondArr;

}


@property (weak, nonatomic) IBOutlet UITableView *tablview;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self getSectionData]; //获取组1 数据
    [self getSectionDataTwo]; //获取组2 数据
    
    self.automaticallyAdjustsScrollViewInsets = NO ;
    [self.tablview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

-(void)getSectionData
{
    DataSourceArr = @[@"demo1间隔3列",@"demo2间隔4列",@"demo3间隔5列",@"demo4间隔6列，选项高100",];
    iamgeArr = @[@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png",@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png",@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png"];
    titleArr = @[@"QQ",@"空间",@"微信",@"朋友圈",@"QQ",@"空间",@"微信",@"朋友圈",@"QQ",@"空间",@"微信",@"朋友圈"];
}

-(void)getSectionDataTwo
{
    secondArr = @[@"快速创建选项列表Demo1",@"应用场景Demo2",@"应用场景Demo3"];
}

#pragma mark UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return DataSourceArr.count ;
    }else{
        return secondArr.count ;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *title ;
    if (indexPath.section == 0) {
        title = DataSourceArr[indexPath.row];
    }else{
        title = secondArr[indexPath.row];
    }
    cell.textLabel.text = title ;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row <3) {
            [self creatShareViewColos:indexPath.row + 3 AndOptionsHeight:72];
        }else if(indexPath.row == 3){
            [self creatShareViewColos:indexPath.row + 3 AndOptionsHeight:100];
        }
    }else{
   
        NSString *title  = secondArr[indexPath.row];
        NSRange range = [title rangeOfString:@"Demo"];
        NSString *subTitle = [title substringToIndex:range.location]; //这个角标之前的字符串
        NSString *subTitle1 = [title substringFromIndex:range.location];//这个角标之后的字符串
        //字符串创建对象
        NSString *ctrlTitle = [NSString stringWithFormat:@"%@ViewController",subTitle1];
        UIViewController *vc = [NSClassFromString(ctrlTitle) new];
        vc.title = subTitle ;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)creatShareViewColos:(NSInteger)cols AndOptionsHeight:(CGFloat)optionsHeight
{
    //创建  ---- >分享页面
    CGM_shareView *shareView = [[CGM_shareView alloc] initWithTitle:titleArr AndWithImage:iamgeArr Andcols:cols AndOptionsHeight:optionsHeight AndOffset:NO];
    shareView.selectBlock=^(NSString *platForm){
        //分享对应platframe
      
        NSLog(@"platForm = %@" ,platForm) ;
        [CGM_AlertContoller  alertMesasgeTwoBtn:platForm AndUIAlertControllerStyle:UIAlertControllerStyleAlert confirmHandler:^(UIAlertAction *No_cancal) {
            
        } AndconfirmActionString:platForm cancleHandler:^(UIAlertAction *cancal) {
            
        } AndcancleString:@"取消"];
    };
    [self.view addSubview: shareView];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"分享页面快速创建";
    }
    return @"选项demo";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
