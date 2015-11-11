//
//  PageTowModel.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "PageTowModel.h"

@implementation PageTowModel


//拼接字符串(2页)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"inspiration_activities_count"]) {
        self.subname = [NSString stringWithFormat:@"-%@条旅行灵感-",value];
    }
    
    //根据id获取对应的内容
if ([key isEqualToString:@"id"]) {
        
        self.id_str = [value stringValue];
        
        
    }
    
}
- (NSString *)description{
    return [NSString stringWithFormat:@"%@",_photo_url];
    
}














@end
