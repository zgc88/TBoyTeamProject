//
//  FirstPageDataManager.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FirstPageDataManager.h"
#define FIRSTURL @"http://q.chanyouji.com/api/v1/timelines.json?page=1&per=50"

@interface FirstPageDataManager ()

@property(nonatomic,strong)NSMutableArray *allDataArr;

@end

@implementation FirstPageDataManager

+(instancetype)sharedManager{
    static FirstPageDataManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[FirstPageDataManager new];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadDta];
    }
    return self;
}


-(void)loadDta{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url=[NSURL URLWithString:FIRSTURL];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray *array=dict[@"data"];
            
            for (NSDictionary *dic in array) {
                FirstPageModel *fpm=[FirstPageModel new];
                [fpm setValuesForKeysWithDictionary:dic];
                [self.allDataArr addObject:fpm];
            }
//            NSLog(@"????????????????%ld",self.allDataArr.count);
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.block();
        });
    });
    
}

-(NSArray *)array{
    return [_allDataArr copy];
}

//懒加载
-(NSMutableArray *)allDataArr{
    if (!_allDataArr) {
        self.allDataArr=[NSMutableArray array];
    }
    return _allDataArr;
}









@end
