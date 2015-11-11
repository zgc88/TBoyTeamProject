//
//  PageTowT_V_Controller.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "PageTowT_V_Controller.h"
#import "PageTowT_V_Cell.h"
#import "PageTowController.h"

#import "Networking.h"
#import "UIImageView+WebCache.h"
#import "PageTowModel.h"

@interface PageTowT_V_Controller ()

@property (nonatomic,strong)NSMutableArray * dataarray;


@end

@implementation PageTowT_V_Controller

-(instancetype)init{
    if (self=[super init]) {
        self.title=@"旅行灵感";
    }
    return self;
}


//标识符
static NSString * const cellID = @"cellid";

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"PageTowT_V_Cell" bundle:nil] forCellReuseIdentifier:cellID];
   //刷新数据
    [self loadData];

}
//解析数据
- (void)loadData{
    [[Networking shareNetworking]networkingGetWithURL:self.id_str Block:^(id object) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = dict[@"data"];
      
        //将model放进数组
        _dataarray = [[NSMutableArray alloc]initWithCapacity:20];
        for (NSDictionary * dic in array) {
            //初始化model
            PageTowModel * model = [PageTowModel new];
            [model setValuesForKeysWithDictionary:dic];
            [_dataarray addObject:model];
        }
        [self.tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataarray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PageTowT_V_Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    //传值
    cell.model = _dataarray[indexPath.row];
    
    
    return cell;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
//点击跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PageTowController *pageVC = [PageTowController new];
    //数据
    PageTowModel *twomodel1 = _dataarray[indexPath.row];
    //下一页网址
    pageVC.id_str = [NSString stringWithFormat:@"http://q.chanyouji.com/api/v1/activity_collections/%@.json",twomodel1.id_str];
    
    [self.navigationController pushViewController:pageVC animated:YES];
}

//懒加载
- (NSMutableArray *)dataarray{
    if (_dataarray == nil) {
        _dataarray = [NSMutableArray new];
    }
    return _dataarray;
}



@end
