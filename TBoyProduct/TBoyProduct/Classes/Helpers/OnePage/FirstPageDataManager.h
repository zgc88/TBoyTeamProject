//
//  FirstPageDataManager.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MyBlock)();

@interface FirstPageDataManager : NSObject

+(instancetype)sharedManager;

@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)MyBlock block;

@end
