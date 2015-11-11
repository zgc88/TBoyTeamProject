//
//  PageTowController.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "PageTowController.h"
#import "PageTowCell.h"
#import "PageTowModel.h"
#import "UIImageView+WebCache.h"
#import "Networking.h"
#import "PageTwo4TVController.h"
@interface PageTowController ()
@property (nonatomic,strong)NSMutableArray *dataarray;
@end

@implementation PageTowController

static NSString * const cellID = @"cellid";
- (void)viewDidLoad {
    [super viewDidLoad];
     //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"PageTowCell" bundle:nil] forCellReuseIdentifier:cellID];

    [self loadData];
}


- (void)loadData{
    [[Networking shareNetworking]networkingGetWithURL:self.id_str Block:^(id object) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingAllowFragments error:nil];
        //字典给数组   (若下层字典 便利数组)
        NSArray * array = dict[@"data"];
        //开辟空间
        _dataarray = [[NSMutableArray alloc]initWithCapacity:20];
        //便利数组
        for (NSDictionary *dic in array) {
            PageTowModel * model = [PageTowModel new];
            [model setValuesForKeysWithDictionary:dic];
            [_dataarray addObject:model];
        }//刷新数据
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
    PageTowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.model = _dataarray[indexPath.row];
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

//点击cell跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PageTwo4TVController * pagetwo4 = [PageTwo4TVController new];
    
    [self.navigationController pushViewController:pagetwo4 animated:YES];
    
    
}

//懒加载
- (NSMutableArray *)dataarray{
    if (_dataarray == nil) {
        _dataarray = [NSMutableArray new];
    }
    return _dataarray;
}


@end
