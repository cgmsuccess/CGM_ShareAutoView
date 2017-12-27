//
//  XC_OpptionView.m
//  optionsDemo
//
//  Created by cgm on 2017/12/26.
//  Copyright © 2017年 cgm. All rights reserved.
//

#import "XC_OptionView.h"
#import "XC_optionViewCell.h"

#define KWidth [UIScreen mainScreen].bounds.size.width

// 每个item的 宽度
#define itemWH (KWidth - (optionscols - 1) * margin) / optionscols

CGFloat  margin = 1; //间隔
CGFloat OptionsHeight = 72 ; //每个选项的高度
NSInteger  optionscols = 5; // 5 列
NSString * const xcoptionCell = @"xcoptionCell";

@interface XC_OptionView()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// MARK:- 每个选项的图片
@property (nonatomic,strong)NSArray *optionsImageArr ;
// MARK:- 每个选项的title
@property (nonatomic,strong)NSArray *optionsTitleArr ;
// MARK:- collection
@property (nonatomic,strong)UICollectionView *optonsCollections ;
// MARK:- 上下间距
@property (nonatomic,assign)CGFloat topBottomDistance;

@end

@implementation XC_OptionView

#pragma mark Lazy
-(UICollectionView *)optonsCollections
{
    if (!_optonsCollections) {
        //此处必须要有创见一个UICollectionViewFlowLayout的对象
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(KWidth/_optionsImageArr.count, KWidth/_optionsImageArr.count);
        layout.minimumInteritemSpacing = margin;
        layout.minimumLineSpacing = margin;
        
        _optonsCollections=[[UICollectionView alloc]initWithFrame:CGRectMake(0, _topBottomDistance, KWidth, 100) collectionViewLayout:layout];
        _optonsCollections.backgroundColor=[UIColor clearColor];
        _optonsCollections.delegate=self;
        _optonsCollections.dataSource=self;
        //这个是横向滑动
        layout.scrollDirection=UICollectionViewScrollDirectionVertical;
        
        //这种是xib建的cell 需要这么注册
        UINib *cellNib=[UINib nibWithNibName:@"XC_optionViewCell" bundle:nil];
        [_optonsCollections registerNib:cellNib forCellWithReuseIdentifier:xcoptionCell];

        
        _optonsCollections.showsHorizontalScrollIndicator = NO ;
        _optonsCollections.showsVerticalScrollIndicator = NO ;
        _optonsCollections.scrollEnabled = NO ;

        [self addSubview:_optonsCollections];
    }
    return _optonsCollections;
}

#pragma mark Init
-(instancetype)initWithOptionArr:(NSArray *)OptionsArrImage AndOptonsTitle:(NSArray *)titileArr
             AndOptionsRowsCount:(NSInteger)count AndOptionTopBottomDistance:(CGFloat)distance AndOptionsHeight:(CGFloat)optionsHeight
{
    if (self = [super init]) {
        self.optionsImageArr = OptionsArrImage;
        self.optionsTitleArr = titileArr ;
        optionscols = count; //列数
        OptionsHeight =  optionsHeight ; //每个选项的高度
        self.topBottomDistance = distance ; //上下距离
        [self optonsCollections];
    }
    return self;
}

-(instancetype)initWithXCOptionColumn:(NSInteger)Colnumer AndImageArr:(NSArray *)imageArr AndTitleArr:(NSArray *)titleArr{
    
    if (self = [super init]) {
        self.optionsImageArr = imageArr;
        self.optionsTitleArr = titleArr ;
        optionscols = Colnumer; //列数
        OptionsHeight =  72 ; //每个选项的高度
        self.topBottomDistance = 10 ; //上下距离
        [self optonsCollections];
    }
    return self;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //高度计算
    _optonsCollections.frame = [self getCollectionRect] ;

}

#pragma mark Other

-(CGFloat)viewHeight
{
    CGRect rect = [self getCollectionRect];
    //这里 self.topBottomDistance * 2  是上下间的距离
    return rect.size.height + self.topBottomDistance * 2 ;
}

-(CGRect)getCollectionRect
{
    NSInteger count = _optionsImageArr.count;
    NSInteger rows = (count - 1) / optionscols + 1; //多少行
    
    CGRect rect =  _optonsCollections.frame;
    //collectionView 的 高度计算
    rect.size.height = rows * OptionsHeight + (rows + 1) * margin;
    return rect ;
}


-(void)setItemCellWidthAndHeight:(CGFloat)itemCellWidthAndHeight
{
    _itemCellWidthAndHeight = itemCellWidthAndHeight;
}

-(void)setOptionsTitleColor:(UIColor *)optionsTitleColor
{
    _optionsTitleColor = optionsTitleColor ;
}

-(void)setTitleFont:(CGFloat)titleFont
{
    _titleFont = titleFont;
}

-(void)setOptionsBackColor:(UIColor *)optionsBackColor
{
    _optionsBackColor = optionsBackColor ;
}

#pragma mark UICollectionViewDataSource UICollectionViewDelegateFlowLayout
//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.optionsImageArr.count;
}
//每一个cell是什么
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XC_optionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:xcoptionCell forIndexPath:indexPath];
    NSString *iamgeStr = _optionsImageArr[indexPath.row];
    NSString *titltrStr= _optionsTitleArr[indexPath.row];
    cell.optionImageView.image = [UIImage imageNamed:iamgeStr];
    cell.optionsTitle.text = titltrStr ;
    
    //设置属性
    if (_itemCellWidthAndHeight != 0) {
        cell.cellWidth.constant = _itemCellWidthAndHeight;
        cell.cellHeight.constant = _itemCellWidthAndHeight ;
    }
    
    if (_titleFont != 0) {
        cell.optionsTitle.font = [UIFont systemFontOfSize:_titleFont] ;
    }
    
    if (_optionsTitleColor) {
        cell.optionsTitle.textColor = _optionsTitleColor;
    }
    
    if (_optionsBackColor) {
        cell.backgroundColor = _optionsBackColor;
    }
    return cell;
}

//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(itemWH, OptionsHeight);
}

//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

// 点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *title = _optionsTitleArr[indexPath.row];
    

    self.cilckOptionHandle(title, indexPath.row);
}



@end
