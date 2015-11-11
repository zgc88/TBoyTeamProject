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
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "PageTowModel.h"
#import "Networking.h"
@interface PageTwoVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//要创建字典 保存 种类name
@property (nonatomic,strong)NSMutableDictionary *dataDict;
@property (nonatomic,strong)NSMutableArray *keyArray;
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
        self.title=@"目的地";
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
    [self loadData];
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //区头
    UICollectionReusableView * header = [_collection dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:PageTowHeader forIndexPath:indexPath];
    
    //区尾
    UICollectionReusableView * footer = [_collection dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:PageTowFooter forIndexPath:indexPath];
    
    
    //区头加lable
        UILabel*lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 15, self.view.frame.size.width, 10)];
    //给lable赋值!
    lable.text = self.keyArray[indexPath.section];

        
    
        //添加lable
        [header addSubview:lable];
    
    
     footer.backgroundColor = [UIColor darkGrayColor];
    return header;
}

#pragma mark 解析数据
- (void)loadData
{
    
    [[Networking shareNetworking]networkingGetWithURL:@"http://q.chanyouji.com/api/v1/destinations.jaon" Block:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = dict[@"data"];
        //遍历种类数组
        for (NSDictionary *dic in array) {
            //接收种类()
            NSString *name = dic[@"name"];
            //让name正常顺序
            [self.keyArray addObject:name];
            NSArray *array1 = dic[@"destinations"];
            //为mArray开辟空间
            NSMutableArray *mArray = [[NSMutableArray alloc]initWithCapacity:20];
            //遍历数组去具体值
            for (NSDictionary *dic1 in array1) {
                //初始化model
                PageTowModel *model = [PageTowModel new];
                [model setValuesForKeysWithDictionary:dic1];
                [mArray addObject:model];
            }//取KEY值
            [self.dataDict setObject:mArray forKey:name];
        }//刷新页面
        [self.collection reloadData];
    }];
 
}
//组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.keyArray.count;
}
//每组cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSString *key = self.keyArray[section];
    NSArray *array = self.dataDict[key];
    return array.count;
}
//每行显示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PageTowCollectionViewCell *pagetowcell = [collectionView dequeueReusableCellWithReuseIdentifier:PageTowcellID forIndexPath:indexPath];
    
    
    NSString *key = self.keyArray[indexPath.section];
    NSArray *array = self.dataDict[key];
    pagetowcell.model = array[indexPath.item];
    
    return pagetowcell;
}
//点击cell跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PageTowT_V_Controller *pageTVC = [PageTowT_V_Controller new];
    //下一页面通过本页id获得
    NSString *key = self.keyArray[indexPath.section];
    NSArray *arraya = self.dataDict[key];
    PageTowModel* twomodel = arraya[indexPath.item];
    pageTVC.id_str = [NSString stringWithFormat:@"http://q.chanyouji.com/api/v1/activity_collections.json?destination_id=%@",twomodel.id_str];
    
    [self.navigationController pushViewController:pageTVC animated:YES];
    
}

#pragma mark 懒加载
- (NSMutableDictionary *)dataDict{
    if (_dataDict== nil) {
        _dataDict = [NSMutableDictionary new];
    }
    return _dataDict;
}
//保持数据顺序
- (NSMutableArray *)keyArray
{
    if (!_keyArray) {
        _keyArray = [[NSMutableArray alloc]initWithCapacity:2];
    }
    return _keyArray;
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
