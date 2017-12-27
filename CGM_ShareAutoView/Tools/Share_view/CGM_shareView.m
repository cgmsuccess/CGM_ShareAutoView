//
//  CGM_shareView.m
//  QQ_ShareView
//
//  Created by apple on 17/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CGM_shareView.h"
#import "CGM_shareCell.h"

#define CustomColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define KWidth [UIScreen mainScreen].bounds.size.width
#define itemWH (KWidth - (cols - 1) * margin) / cols

NSInteger  cols = 5; //默认列数
CGFloat  ItemHeight = 72 ;  //每个选项的高度 。可以修改他但是不建议低于 72 ，可以高于72
static CGFloat const margin = 1; //间隔
static CGFloat cancleHeight = 44 ; //取消按钮高度
static CGFloat animationTime = 0.25; //动画时间。从下面移动到上面

@interface CGM_shareView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIView *bgView;              /** 背景view */

@property (nonatomic, strong) UIButton *cancleBtn;              /** 取消view */

@property (nonatomic, strong) NSArray *titlrArr ;

@property (nonatomic, strong) NSArray *imageArr ;

@property(nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,assign)BOOL isOffset ;//是否偏移

@property (nonatomic,assign)CGFloat bgViewHeith ; //显示白色界面父视图高度 ;

@end

@implementation CGM_shareView

-(instancetype)initWithTitle:(NSArray *)titleAlrr AndWithImage:(NSArray *)imageArr Andcols:(NSInteger)setcols AndOptionsHeight:(CGFloat)optionsHeight AndOffset:(BOOL)offset{
    
    self = [super init];
    if (self) {
        _bgViewHeith = 160 ;//默认
        cols = setcols ;
        ItemHeight = optionsHeight ;
        self.titlrArr = titleAlrr ;
        self.imageArr = imageArr ;
        self.isOffset = offset ;
        [self initSubViewUI]; //初始化UI
    }
    return self;
}


- (void)initSubViewUI{
    
    UIWindow *windowView = [self lastWindow];
    
    self.frame = [UIApplication sharedApplication].keyWindow.bounds;
    
    [windowView addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    [self addSubview:self.bgView]; //白色底图父视图
    
    [self.bgView addSubview:self.bg_viewBackImageview];
    
    [self fuzzy];

    [self.bgView addSubview:self.cancleBtn];  //取消按钮
    
    [self colletionUI];
    
    [self showPickView]; //显示

}
- (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}


//毛玻璃
-(void)fuzzy{
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *view = [[UIVisualEffectView alloc]initWithEffect:beffect];
    
    view.frame = self.bgView.bounds;
    
    [self.bgView addSubview:view];
}


#pragma mark - UI

- (UIView *)bgView{
    if (!_bgView) {
        //初始化设置在屏幕之外
        NSInteger count = self.imageArr.count;
        NSInteger rows = (count - 1) / cols + 1; //计算有多少列
       
        _bgViewHeith = ItemHeight * rows + cancleHeight + 30 ; //计算bgviewHeight 的动态高度 ,加 30 是我觉得好看
        
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, _bgViewHeith)];
        _bgView.backgroundColor = CustomColor(239, 239, 239, 1.0f);
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];;
    }
    return _bgView;
}

-(UIImageView *)bg_viewBackImageview{
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_qiuqiu.png"]];
    imageview.frame = self.bgView.bounds;
    
    return imageview   ;
}

- (UIButton *)cancleBtn{
    if (!_cancleBtn) {
        _cancleBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _cancleBtn.frame=CGRectMake(0, self.bgView.frame.size.height-cancleHeight, self.frame.size.width, cancleHeight);
        _cancleBtn.layer.borderWidth = 0.5;
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancleBtn.layer.borderColor = [UIColor grayColor].CGColor;
        [_cancleBtn addTarget:self action:@selector(cancleAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}

-(void)colletionUI{
    //此处必须要有创见一个UICollectionViewFlowLayout的对象
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
   
    layout.itemSize = CGSizeMake(itemWH, ItemHeight);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 15, [UIScreen mainScreen].bounds.size.width , 100) collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor clearColor];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    //这个是横向滑动
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    [self.bgView addSubview:_collectionView];
    
    //这种是xib建的cell 需要这么注册
    UINib *cellNib=[UINib nibWithNibName:@"CGM_shareCell" bundle:nil];
    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"CGM_shareCell"];
    
    NSInteger count = self.imageArr.count;
    NSInteger rows = (count - 1) / cols + 1;
    CGRect rect =  _collectionView.frame;
    //高度计算
    rect.size.height = rows * ItemHeight + 30  ;

    _collectionView.frame = rect ;
    
    _collectionView.showsHorizontalScrollIndicator = NO ;
}

//取消
-(void)cancleAction{
    [self hidePickView];
}


#pragma mark private methods  方法
//显示
- (void)showPickView{
    if (self.isOffset) { //要偏移64
        [UIView animateWithDuration:animationTime animations:^{
            self.bgView.frame = CGRectMake(0, self.frame.size.height - _bgViewHeith - 64, self.frame.size.width, _bgViewHeith);
        } completion:^(BOOL finished) {
            
        }];
  
    }else{
            //不偏移
        [UIView animateWithDuration:animationTime animations:^{
            self.bgView.frame = CGRectMake(0, self.frame.size.height - _bgViewHeith , self.frame.size.width, _bgViewHeith);
        } completion:^(BOOL finished) {
            
        }];
    }
}

//隐藏
- (void)hidePickView{
    
    if (self.isOffset) {
        [UIView animateWithDuration:animationTime animations:^{
            self.bgView.frame = CGRectMake(0, self.frame.size.height+64, self.frame.size.width, _bgViewHeith);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else{
        [UIView animateWithDuration:animationTime animations:^{
            self.bgView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, _bgViewHeith);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([touches.anyObject.view isKindOfClass:[self class]]) {
        [self hidePickView];
    }
}

#pragma mark UIcollectionDelegate
//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titlrArr.count;
}
//每一个cell是什么
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGM_shareCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CGM_shareCell" forIndexPath:indexPath];
    NSString *iamgeStr = self.imageArr[indexPath.row];
    NSString *titltrStr= self.titlrArr[indexPath.row];
    cell.shareImage.image = [UIImage imageNamed:iamgeStr];
    cell.platformLabel.text = titltrStr ;

    return cell;
}

//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(itemWH, ItemHeight);
}

//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *titleString = self.titlrArr[indexPath.row];
    self.selectBlock(titleString);
    [self hidePickView];
}

@end
