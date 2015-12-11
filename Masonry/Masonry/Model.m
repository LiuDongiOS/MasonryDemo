
//
//  Model.m
//  MasonryButton
//
//  Created by 刘栋 on 15/12/7.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (instancetype)modelWithDic:(NSDictionary *)dic{
    
    Model *model = [[Model alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
