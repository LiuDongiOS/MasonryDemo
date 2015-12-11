//
//  Model.h
//  MasonryButton
//
//  Created by 刘栋 on 15/12/7.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, strong)NSString *digest;
@property (nonatomic, strong)NSString *docid;
@property (nonatomic, strong)NSString *replyCount;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *source;
@property (nonatomic, strong)NSArray *img;
@property (nonatomic, strong)NSString *imgsrc;
@property (nonatomic, strong)NSString *downTimes;
@property (nonatomic, strong)NSString *upTimes;
@property (nonatomic, strong)NSString *body;
@property (nonatomic, assign)BOOL isLiked;
@property (nonatomic, assign)NSInteger recType;
+ (instancetype)modelWithDic:(NSDictionary *)dic;

@end
