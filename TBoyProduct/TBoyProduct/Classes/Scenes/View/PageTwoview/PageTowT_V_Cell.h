//
//  PageTowT_V_Cell.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageTowModel.h"
@interface PageTowT_V_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *inage2;
@property (weak, nonatomic) IBOutlet UILabel *lable2a;
@property (weak, nonatomic) IBOutlet UILabel *lable2b;

@property (nonatomic,strong)PageTowModel * model;

@end
