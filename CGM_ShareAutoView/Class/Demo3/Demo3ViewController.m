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

//注释:-
@property (nonatomic,strong)XC_OptionView *optionview ;

//注释:-
@property (nonatomic,strong)NSMutableArray *markArr ; ;


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
    
    _optionview = [[XC_OptionView alloc] initWithOptionArr:iamgeArr AndOptonsTitle:titleArr AndOptionsRowsCount:5 AndOptionTopBottomDistance:10 AndOptionsHeight:72];
    
    
    
    //这里设置一样的颜色就可以不显示缝隙了。
    _optionview.optionsBackColor = [UIColor whiteColor] ;
    _optionview.backgroundColor = Color(232, 241, 241, 1);
    CGFloat height = [_optionview viewHeight];

    _optionview.frame = CGRectMake(0, 64, KWidth, height);
    
    _optionview.optionsTitleColor = [UIColor grayColor];
    _optionview.itemCellWidthAndHeight = 20;
    
    //默认 1 2 选项的 提示 是 1 ，3
    self.markArr = [NSMutableArray arrayWithArray: @[@"0",@"1",@"3",@"0",@"0"]] ;
   
    _optionview.optionMarkArr = [NSMutableArray arrayWithArray:self.markArr];
    [self.view addSubview:_optionview];
    
    
    WS(weakSelf);
    _optionview.cilckOptionHandle = ^(NSString *title, NSInteger index) {
        
        //点击选项，提示框消失
        [weakSelf.markArr replaceObjectAtIndex:index withObject:@"0"];
        
        NSLog(@"weakSelf.markArr = %@" ,weakSelf.markArr ) ;
        
         weakSelf.optionview.optionMarkArr = weakSelf.markArr  ;
        
        
        NSString *s = [NSString stringWithFormat:@"点击了%@  角标 %ld",title,index];
        
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
