//
//  PageOneTableVC.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "PageOneTableVC.h"

#define FIRSTURL @"http://q.chanyouji.com/api/v1/timelines.json?page=1&per=50"

@interface PageOneTableVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray *allDataArr;
@property(nonatomic,strong)UIAlertController *alertController;

@end

@implementation PageOneTableVC

-(instancetype)init{
    if (self=[super init]) {
        self.title=@"one";
    }
    return self;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstPageTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    //隐藏tableview的线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //加载头视图
//    [self loadHeaderView];
    
}

//加载数据
-(void)loadData{
    NSURL *url=[NSURL URLWithString:FIRSTURL];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array=dict[@"data"];
        
        for (NSDictionary *dic in array) {
            FirstPageModel *fpm=[FirstPageModel new];
            [fpm setValuesForKeysWithDictionary:dic];
            [self.allDataArr addObject:fpm];
        }
        [self.tableView reloadData];
    }];

    
    
}


//加载头视图
-(void)loadHeaderView{
    
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    headerView.backgroundColor=[UIColor yellowColor];
    self.tableView.tableHeaderView=headerView;
    
    NSArray *array=@[[UIImage imageNamed:@"lun1.jpg"],
                     [UIImage imageNamed:@"lun2.jpg"],
                     [UIImage imageNamed:@"lun3.jpg"],
                     [UIImage imageNamed:@"lun4.jpg"]];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150) imagesGroup:array];
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [headerView addSubview:cycleScrollView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld",self.allDataArr.count);
    return self.allDataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    FirstPageModel *pageModel=self.allDataArr[indexPath.row];
    
    cell.pageModel=pageModel;
    
    //给collectionView赋值
    [cell loadCollectionView];

    
    [cell.fenxiangButton addTarget:self action:@selector(fenxiangButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 800;
}

-(void)fenxiangButtonAction:(UIButton *)sender{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"分享" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"分享");
    }];
    
    UIAlertAction *action2=[UIAlertAction actionWithTitle:@"举报不良内容" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIAlertController *alertCon=[UIAlertController alertControllerWithTitle:@"确定举报吗?" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionAl1=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *actionAl2=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"举报成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *jubao=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:jubao];
            [self presentViewController:alertController animated:YES completion:nil];
            
        }];
        [alertCon addAction:actionAl1];
        [alertCon addAction:actionAl2];
        
        [self presentViewController:alertCon animated:YES completion:nil];
        
        
    }];
    
    UIAlertAction *action3=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

-(NSMutableArray *)allDataArr{
    if (!_allDataArr) {
        self.allDataArr=[NSMutableArray array];
    }
    return _allDataArr;
}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
