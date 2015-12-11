//
//  LDAFNetWorkTool.h
//  Test
//
//  Created by 刘栋 on 15/11/6.
//  Copyright © 2015年 Liu Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LDResponseStyle) {
    LDJSON,
    LDXML,
    LDData,
};
typedef NS_ENUM(NSUInteger, LDRequestStyle) {
    RequestJSON,
    RequestString,
    RequestDefault
};
@interface LDAFNetWorkTool : NSObject

+ (void)getUrl:(NSString *)url
          boby:(id)boby
     resoponse:(LDResponseStyle)style
requestHeadFile:(NSDictionary *)headFile
       success: (void (^)(NSURLSessionDataTask *task, id resposeOnject))success
       failure: (void (^)(NSURLSessionDataTask *task, NSError *error))failure;

+ (void)postUrlString:(NSString *)url
                 body:(id)body
             response:(LDResponseStyle)style
            bodyStyle:(LDRequestStyle)bodyStyle
      requestHeadFile:(NSDictionary *)headFile
              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
