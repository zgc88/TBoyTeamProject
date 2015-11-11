//
//  PageTowCell.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "PageTowCell.h"
#import "PageTowModel.h"
#import "UIImageView+WebCache.h"
@implementation PageTowCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setModel:(PageTowModel *)model{
    
    self.lable3.text = model.topic;
}


@end
