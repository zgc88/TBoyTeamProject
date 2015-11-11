//
//  ThoughtsVC.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 lanou3g. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void (^TextRtn)(NSString *);


@interface ThoughtsVC : UIViewController
@property (nonatomic,copy) TextRtn textRtn;
@property (nonatomic,strong) NSString *theArticle;
@end
