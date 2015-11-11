//
//  PageTowT_V_Cell.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "PageTowT_V_Cell.h"
#import "PageTowModel.h"
#import "UIImageView+WebCache.h"
@implementation PageTowT_V_Cell

- (void)awakeFromNib {
    // Initialization code
}



- (void)setModel:(PageTowModel *)model{
    [self.inage2 sd_setImageWithURL:[NSURL URLWithString:model.photo_url]];
    
    self.lable2a.text = model.topic;
    self.lable2b.text = model.subname;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
