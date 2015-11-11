//
//  PageTowCollectionViewCell.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageTowModel.h"

@interface PageTowCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UILabel *lable1a;
@property (weak, nonatomic) IBOutlet UILabel *lable1b;

@property (nonatomic ,strong)PageTowModel *model;

@end
