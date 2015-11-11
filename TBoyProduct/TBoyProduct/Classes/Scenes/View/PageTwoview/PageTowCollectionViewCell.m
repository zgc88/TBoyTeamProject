//
//  PageTowCollectionViewCell.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "PageTowCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation PageTowCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(PageTowModel *)model
{
    [self.image1 sd_setImageWithURL:[NSURL URLWithString:model.photo_url]];
    self.lable1a.text = model.name;
    self.lable1b.text = model.name_en;
    
    
}


@end
