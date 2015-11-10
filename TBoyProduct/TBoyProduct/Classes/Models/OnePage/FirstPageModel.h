//
//  FirstPageModel.h
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FirstPageModel : NSObject

@property(nonatomic,copy)FirstPageInforModel *activity; //对应的是字典
@property(nonatomic,copy)NSString *event_type;
@property(nonatomic,copy)NSString *user;  //对应的是字典


/*
 {
 "activity": {
 "categories": [
 {
 "category_type": "official",
 "id": 12,
 "name": "旅途故事"
 }
 ],
 "comments_count": 5,
 "contents": [
 {
 "caption": null,
 "height": 1600,
 "id": 18271,
 "photo_url": "http://inspiration.chanyouji.cn/UserActivityContent/18271/45f7c6f638b993c38c59b575309af1bc.jpg",
 "position": 0,
 "width": 1093
 },
  ],
 "contents_count": 9,
 "created_at": "2015-11-09T03:53:46.000Z",
 "description": "大洋洲的岛国瓦努阿图对中国游客“免签”，可99%的中国人不会去那里，但我去了！一趟只从墨尔本出发计算来回就换乘了8个航班的旅行，但值了！
 第一晚住在首都维拉港有着一片白沙滩的海滨别墅酒店，主管站在房间的沙滩露台上告诉我们这里的海水在阳光照射下会呈现七种色彩。
 于是我就有了一个无比美妙的阳光早晨，一次无法抑制的邂逅艳遇，一个无与伦比的彩色世界！",
 "district_id": 1445563,
 "districts": [
 {
 "id": 1445563,
 "name": "瓦努阿图"
 }
 ],
 "id": 3810,
 "inspiration_activity_id": 0,
 "likes_count": 8,
 "made_at": "2015-07-27T03:19:28.000Z",
 "poi": null,
 "topic": "七彩的海",
 "user": {
 "gender": 1,
 "id": 2952,
 "level": 2,
 "name": "片儿川",
 "photo_url": "http://inspiration.chanyouji.cn/User/2952/3e4289ed838c313eeb2ababdd59eba99.jpg"
 }
 },
 "event_type": "recommend",
 "user": {
 "gender": 1,
 "id": 101,
 "level": 3,
 "name": "氢精选",
 "photo_url": "http://inspiration.chanyouji.cn/User/101/f6341c3e033d48ac8dcc6b2fa151b96c.jpg"
 }
 },

 */

@end
