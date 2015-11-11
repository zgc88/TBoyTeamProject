
//
//  TravelNotesImgCell.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "TravelNotesImgCell.h"

@implementation TravelNotesImgCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self.contentView addSubview:self.imgView];
}

- (UIImageView *)imgView{
    if (nil == _imgView) {
        self.imgView = [[UIImageView alloc] initWithFrame:self.bounds];
//        _imgView.backgroundColor = [UIColor magentaColor];
    }
    return _imgView;
}

@end
