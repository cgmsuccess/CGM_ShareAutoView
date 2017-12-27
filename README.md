# CGM_ShareAutoView
自适应分享页面。只需要传入图片和名字即可。 以及对 UIAlertController 的二次小封装

<h1>效果图</h1>

![(效果图)](http://upload-images.jianshu.io/upload_images/2018474-11c92543ba335f66.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

<h4>

    最近整合了一下项目，发现很多重复UI，于是简单的封装了下。便于日后整合
    
</h4>

## 主要思路就是对collectionview的简单封装抽取了一下
```
NSInteger rows = (count - 1) / cols + 1; //计算有多少列
如何根据列数算行数   。总的选项数减 1 。除以 列数 加 1 即等于 行数 。
最主要是根据这个公式获得冬天的高度，进行计算 。

```

#####  分享简单的使用

```
CGM_shareView *shareView = [[CGM_shareView alloc] initWithTitle:titleArr AndWithImage:iamgeArr Andcols:5 AndOptionsHeight:72 AndOffset:NO];
shareView.selectBlock=^(NSString *platForm){
//分享对应platframe

NSLog(@"platForm = %@" ,platForm) ;
[CGM_AlertContoller  alertMesasgeTwoBtn:platForm AndUIAlertControllerStyle:UIAlertControllerStyleAlert confirmHandler:^(UIAlertAction *No_cancal) {

} AndconfirmActionString:platForm cancleHandler:^(UIAlertAction *cancal) {

} AndcancleString:@"取消"];
};
[self.view addSubview: shareView];
```

##### 这里注意。因为是collectionview 继承 UIScrollview 在控制器 会 自动偏移64单位。
```
self.automaticallyAdjustsScrollViewInsets = NO
//很重要，要不然高度计算不准确
```
##### 选项视图的简单使用
```
self.automaticallyAdjustsScrollViewInsets = NO ;  //如果高度不准确。就是自动偏移了

NSArray  * iamgeArr = @[@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png",@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png",@"ic_qiuqiu.png",@"ic_zone.png",@"ic_wxchat.png",@"ic_pyq.png"];
NSArray  * titleArr = @[@"QQ",@"空间",@"微信",@"朋友圈",@"QQ",@"空间",@"微信",@"朋友圈",@"QQ",@"空间",@"微信",@"朋友圈"];

XC_OptionView *optionview = [[XC_OptionView alloc] initWithXCOptionColumn:5 AndImageArr:iamgeArr AndTitleArr:titleArr];


optionview.backgroundColor = [UIColor cyanColor];
CGFloat height = [optionview viewHeight];

optionview.optionsBackColor = [[UIColor grayColor] colorWithAlphaComponent:0.3f];
optionview.frame = CGRectMake(0, 66, KWidth, height);

[self.view addSubview:optionview];

```
