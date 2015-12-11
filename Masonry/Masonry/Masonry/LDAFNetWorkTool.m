//
//  LDAFNetWorkTool.m
//  Test
//
//  Created by 刘栋 on 15/11/6.
//  Copyright © 2015年 Liu Dong. All rights reserved.
//

#import "LDAFNetWorkTool.h"
#import "AFNetworking.h"

@implementation LDAFNetWorkTool

+ (void)getUrl:(NSString *)url
          boby:(id)boby
     resoponse:(LDResponseStyle)style
requestHeadFile:(NSDictionary *)headFile
       success: (void (^)(NSURLSessionDataTask *task, id resposeOnject))success
       failure: (void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    //1.获取单例的网络管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.根据style的类型,去选择返回值的类型
    switch (style) {
        case LDJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
          case LDXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
            case LDData:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    // 3.设置响应数据支持类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript", nil]];
    //4.请求头文件
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            
            [manager.requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
        }
    }
    
    [manager.requestSerializer setValue:@"49ef05bf6b30c806642450a08b111e76" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"rBsbefjx" forHTTPHeaderField:@"Key"];
    [manager.requestSerializer setValue:@"Thu, 05 Nov 2015 03:51:18 GMT" forHTTPHeaderField:@"Date"];
    // 5.UTF8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    //6.发送GET请求
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //防止为空,程序crash
        if (success) {
             success(task, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //防止为空,程序crash
        if (failure) {
            failure(task, error);
        }
    }];
 
    
}
+ (void)postUrlString:(NSString *)url
                 body:(id)body
             response:(LDResponseStyle)style
            bodyStyle:(LDRequestStyle)bodyStyle
      requestHeadFile:(NSDictionary *)headFile
              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    // 1.获取Session管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2.设置网络请求返回时, responseObject的数据类型
    switch (style) {
        case LDJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case LDXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case LDData:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    // 3.判断body体的类型
    switch (bodyStyle) {
        case RequestJSON:
            // 以JSON格式发送
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            break;
        case RequestString:
            // 保持字符串样式
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError *__autoreleasing *error) {
                return parameters;
            }];
        case RequestDefault:
            // 默认情况会把JSON拼接成字符串, 但是没有顺序
            break;
            
        default:
            break;
    }
    // 4.给网络请求加请求头
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            [manager.requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
        }
    }
    // 5.设置支持的响应头格式
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript", nil]];
    // 6.发送网络请求
    [manager POST:url parameters:body success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task, error);
        }
    }];
    
    
}


@end
