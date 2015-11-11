//
//  TravelNotesCell.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelNotesCell : UITableViewCell
// 自定义cell图片
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

// 自定义cell标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
