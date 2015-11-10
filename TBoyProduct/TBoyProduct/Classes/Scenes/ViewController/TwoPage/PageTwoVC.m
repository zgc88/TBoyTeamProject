//
//  PageTwoVC.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "PageTwoVC.h"
#import "PageTowCollectionViewCell.h"
#import "PageTowT_V_Controller.h"
@interface PageTwoVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView * collection;
@end

@implementation PageTwoVC
//注册cell
static NSString * const PageTowcellID = @"cellID";
//注册区头/区尾
static NSString * const PageTowHeader = @"header";
static NSString * const PageTowFooter = @"footer";

-(instancetype)init{
    if (self=[super init]) {
        self.title=@"two";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc]init];
    
    _collection = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowlayout];
    
    //cell大小
    flowlayout.itemSize = CGSizeMake(120, 160);
    
    //区头大小/区尾
    flowlayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 40);
    flowlayout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 10);
    
    //上下间距
    flowlayout.minimumInteritemSpacing = 5;
    flowlayout.minimumLineSpacing = 5;
    
    //遵循代理
    _collection.delegate = self;
    _collection.dataSource =self;
    
    //注册cell
    [_collection registerNib:[UINib nibWithNibName:@"PageTowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:PageTowcellID];
    
    //注册区头/区尾
    [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:PageTowHeader];
    
    [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:PageTowFooter];
    
    //背景颜色
    _collection.backgroundColor = [UIColor whiteColor];
    
    //添加视图
    [self.view addSubview:_collection];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //区头
    UICollectionReusableView * header = [_collection dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:PageTowHeader forIndexPath:indexPath];
    //区尾
    UICollectionReusableView * footer = [_collection dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:PageTowFooter forIndexPath:indexPath];
    //区头加lable
    UILabel*lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 15, self.view.frame.size.width, 10)];
    lable.text = @"国内热门氢攻略";
    //添加lable
    [header addSubview:lable];
    
    footer.backgroundColor = [UIColor darkGrayColor];
    
    return header;
}

//组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}
//每组cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 15;
}
//每行显示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PageTowCollectionViewCell *pagetowcell = [collectionView dequeueReusableCellWithReuseIdentifier:PageTowcellID forIndexPath:indexPath];
    
    return pagetowcell;
}
//点击cell跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PageTowT_V_Controller *pageTVC = [PageTowT_V_Controller new];
    
    [self.navigationController pushViewController:pageTVC animated:YES];
    
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
