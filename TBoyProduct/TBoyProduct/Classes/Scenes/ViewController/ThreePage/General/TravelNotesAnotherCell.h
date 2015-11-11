//
//  TravelNotesAnotherCell.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelNotesAnotherCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *thoughtsLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *imgCollectionView;

@end
