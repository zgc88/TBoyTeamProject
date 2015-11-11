//
//  FirstPageTableViewCell.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FirstPageTableViewCell.h"

@interface FirstPageTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

//存放图片
@property(nonatomic,strong)NSMutableArray *allDatArr;

@end

@implementation FirstPageTableViewCell


-(void)setPageModel:(FirstPageModel *)pageModel{
    
    self.allDatArr=[NSMutableArray array];
    
    [self.allDatArr removeAllObjects];

    FirstPageInforModel *infor=pageModel.activity;
    NSDictionary *dict=(NSDictionary *)infor;
    NSDictionary *userDict=dict[@"user"];
    [self.headerImgView sd_setImageWithURL:[NSURL URLWithString:userDict[@"photo_url"]]];
    self.nameLable.text=userDict[@"name"];
    NSArray *array=dict[@"contents"];
    for (NSDictionary *ddd in array) {
        NSString *urlStr=ddd[@"photo_url"];
        [self.allDatArr addObject:urlStr];
    }
    
    [self.bigImgView sd_setImageWithURL:[NSURL URLWithString:self.allDatArr[0]]];
    self.titleLable.text=dict[@"topic"];
    NSString *subDes=[dict[@"description"] substringToIndex:40];
    NSString *newDes=[subDes stringByAppendingString:@"...."];
    self.desLalbe.text=newDes;
    
    NSArray *arr1=dict[@"districts"];
    NSDictionary *disDict=[arr1 firstObject];
    
    [self.btn1Button setTitle:disDict[@"name"] forState:UIControlStateNormal];
    
    NSArray *arr2=dict[@"categories"];
    NSDictionary *catDict=[arr2 firstObject];
    [self.btn3Button setTitle:catDict[@"name"] forState:UIControlStateNormal];
    
    NSString *time=dict[@"made_at"];
    NSString *month=[time substringWithRange:NSMakeRange(5, 2)];
    NSString *newMonth=[month stringByAppendingString:@"月"];
    [self.btn2Button setTitle:newMonth forState:UIControlStateNormal];
    
    NSString *zanStr=@"赞";
//    if ([dict[@"likes_countStr"] length]==0) {
//        return;
//    }else{
//        [zanStr stringByAppendingString:dict[@"likes_countStr"]];
//    }
    [self.zanButton setTitle:zanStr forState:UIControlStateNormal];
    
    NSString *pinglunStr=@"评论";
//    if ([dict[@"comments_countStr"] length]==0) {
//        return;
//    }else{
//        [pinglunStr stringByAppendingString:dict[@"comments_countStr"]];
//    }
    [self.pinglunButton setTitle:pinglunStr forState:UIControlStateNormal];
    
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadCollectionView];
    }
    return self;
}


-(void)loadCollectionView{
    
    [self.myCollectionView reloadData];
    
    self.myCollectionView.backgroundColor=[UIColor whiteColor];
    self.myCollectionView.dataSource=self;
    self.myCollectionView.delegate=self;
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"FirstPageCollectionVC" bundle:nil] forCellWithReuseIdentifier:@"item"];
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.allDatArr.count-1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstPageCollectionVC *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.allDatArr[indexPath.row+1]]];
    
    return cell;
    
}


- (IBAction)guanzhuButton:(UIButton *)sender {
    
    NSLog(@"关注");
}

- (IBAction)btn1Button:(UIButton *)sender {
    
    NSLog(@"111111111111");
}

- (IBAction)btn2Button:(UIButton *)sender {
    
    NSLog(@"2222222222222");
}

- (IBAction)btn3Button3:(id)sender {
    NSLog(@"3333333333333333333");
}

- (IBAction)zanButton:(UIButton *)sender {
    NSLog(@"赞一个");
}

- (IBAction)pinglunButton:(UIButton *)sender {
    NSLog(@"评论了 ");
}

- (IBAction)fenxiangButton:(UIButton *)sender {
    
    NSLog(@"分享一下");
}


- (void)awakeFromNib {
    // Initialization code
    
    
    UIImageView *imgView=[[UIImageView alloc]init];
    imgView.layer.masksToBounds=YES;
    imgView.layer.cornerRadius=30;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
