//
//  FirstPageTableViewCell.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstPageModel.h"

@interface FirstPageTableViewCell : UITableViewCell

@property(nonatomic,strong)FirstPageModel *pageModel;


@property (weak, nonatomic) IBOutlet UIImageView *headerImgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIButton *guanzhuButton;
@property (weak, nonatomic) IBOutlet UIImageView *bigImgView;

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *desLalbe;

@property (weak, nonatomic) IBOutlet UIButton *btn1Button;
@property (weak, nonatomic) IBOutlet UIButton *btn2Button;
@property (weak, nonatomic) IBOutlet UIButton *btn3Button;



@property (weak, nonatomic) IBOutlet UIButton *zanButton;
@property (weak, nonatomic) IBOutlet UIButton *pinglunButton;
@property (weak, nonatomic) IBOutlet UIButton *fenxiangButton;


-(void)loadCollectionView;




@end
