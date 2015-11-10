//
//  FirstPageInforModel.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FirstPageInforModel.h"

@implementation FirstPageInforModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        _num_id=[NSString stringWithFormat:@"%@",value];
    }
    
    if ([key isEqualToString:@"comments_count"]) {
        _comments_countStr=[NSString stringWithFormat:@"%@",value];
    }
    
    if ([key isEqualToString:@"contents_count"]) {
        _contents_countStr=[NSString stringWithFormat:@"%@",value];
    }
    
    if ([key isEqualToString:@"description"]) {
        _descriptionStr=value;
    }
    
    if ([key isEqualToString:@"district_id"]) {
        _district_idStr=[NSString stringWithFormat:@"%@",value];
    }
    
    if ([key isEqualToString:@"inspiration_activity_id"]) {
        _inspiration_activity_idStr=[NSString stringWithFormat:@"%@",value];
    }
    
    if ([key isEqualToString:@"likes_count"]) {
        _likes_countStr=[NSString stringWithFormat:@"%@",value];
    }
    
    
    
    
    
    
    
    
}




@end
