//
//  PageTowModel.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageTowModel : NSObject
//1.data
//区头的name
@property (nonatomic,strong)NSString *namet;
//2.destinations
//避免与系统id名字冲突
@property (nonatomic,strong)NSString *id_str;//1,2,3页共用
//cell上的name
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *name_en;

@property (nonatomic,strong)NSString *photo_url;//1,2,3页共用


//第2页
@property (nonatomic,strong)NSString *subname;

@property (nonatomic,strong)NSString *topic;//2,3页共用

//第3页
@property (nonatomic,strong)NSString *summary;











@end
