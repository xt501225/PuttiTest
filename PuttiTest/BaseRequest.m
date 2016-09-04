//
//  BaseRequest.m
//  GuangGuang
//
//  Created by summer on 16/1/4.
//  Copyright © 2016年 Fundstar & Investment. All rights reserved.
//

#import "BaseRequest.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "YTKNetworkConfig.h"
#import <YYModel.h>
#import "Constant.h"


@interface BaseRequest () {
    NSString *requestUrl;                //请求的URL
    YTKRequestMethod reqMethod;          //请求方法：默认post
    YTKRequestSerializerType serialType; //请求类型：默认json
    NSInteger cacheTime;                 //缓存超时时间
}

// request请求参数键值映射
@property(nonatomic, strong) NSMutableDictionary *paramMap;

@end

@implementation BaseRequest

#pragma mark GuangGuang Server Request
/**
 *  初始化：适合于访问逛逛服务器，数据需要加密(不使用缓存)
 *
 *  @param model 请求参数Model对象
 *  @param url   请求的URL
 *
 *  @return BaseRequest obj
 */
- (instancetype)initWithModel:(NSObject *)model URL:(NSString *)url {
    return [self initWithModel:model URL:url cacheTime:0];
}

/**
 *  初始化：适合于访问逛逛服务器，数据需要加密；设置缓存时间, 缓存网络请求
 *
 *  @param model 请求参数Model对象
 *  @param url   请求的URL
 *  @param time  缓存时间 >0：启用缓存；<=0：不使用缓存
 *
 *  @return BaseRequest obj
 */
- (instancetype)initWithModel:(NSObject *)model
                          URL:(NSString *)url
                    cacheTime:(NSInteger)time {
    return [self initWithModel:model
                           URL:url
                     reqMethod:YTKRequestMethodPost
         requestSerializerType:YTKRequestSerializerTypeJSON
                     cacheTime:time];
}

/**
 *  初始化：适合于访问逛逛服务器，数据需要加密(不使用缓存)
 *
 *  @param dict 请求参数Dictionary对象
 *  @param url   请求的URL
 *
 *  @return BaseRequest obj
 */
- (instancetype)initWithDict:(NSDictionary *)dict URL:(NSString *)url {
    return [self initWithDict:dict URL:url cacheTime:0];
}

/**
 *  初始化：适合于访问逛逛服务器，数据需要加密；设置缓存时间, 缓存网络请求
 *
 *  @param dict 请求参数Dictionary对象
 *  @param url   请求的URL
 *  @param time  缓存时间 >0：启用缓存；<=0：不使用缓存
 *
 *   @return BaseRequest obj
 */
- (instancetype)initWithDict:(NSDictionary *)dict
                         URL:(NSString *)url
                   cacheTime:(NSInteger)time {
    return [self initWithDict:dict
                          URL:url
                    reqMethod:YTKRequestMethodPost
        requestSerializerType:YTKRequestSerializerTypeJSON
                    cacheTime:time];
}

#pragma mark NOT GuangGuang Server Request
/**
 *  初始化：适合于访问第三方地址，不需要加密
 *
 *  @param model  请求参数Model对象
 *  @param url    请求的URL(访问第三方地址以http://或https://开头)
 *  @param method http请求的metho: get/post
 *  @param type   application类型: http/json
 *  @param time   缓存时间 >0：启用缓存；<=0：不使用缓存
 *
 *  @return BaseRequest obj
 */
- (instancetype)initWithModel:(NSObject *)model
                          URL:(NSString *)url
                    reqMethod:(YTKRequestMethod)method
        requestSerializerType:(YTKRequestSerializerType)type
                    cacheTime:(NSInteger)time {
    NSDictionary *dict = [model yy_modelToJSONObject];
    return [self initWithDict:dict
                          URL:url
                    reqMethod:method
        requestSerializerType:type
                    cacheTime:time];
}

/**
 *  初始化：适合于访问第三方地址，不需要加密
 *
 *  @param dict  请求参数Dict对象
 *  @param url    请求的URL(访问第三方地址以http://或https://开头)
 *  @param method http请求的metho: get/post
 *  @param type   application类型: http/json
 *  @param time   缓存时间 >0：启用缓存；<=0：不使用缓存
 *
 *  @return BaseRequest obj
 */
- (instancetype)initWithDict:(NSDictionary *)dict
                         URL:(NSString *)url
                   reqMethod:(YTKRequestMethod)method
       requestSerializerType:(YTKRequestSerializerType)type
                   cacheTime:(NSInteger)time {
    self = [super init];
    if (self) {
        _paramMap = dict == nil
        ? [NSMutableDictionary dictionaryWithCapacity:10]
        : [NSMutableDictionary dictionaryWithDictionary:dict];
        requestUrl = url;
        reqMethod = method;
        serialType = type;
        if (time > 0) {
            cacheTime = time;
        }
    }
    return self;
}

/**
 *  判断数据传输是否需要加密
 *
 *  @return BOOL true: 需要加密;false:不需要加密
 */
- (BOOL)isNeedEncrypt {
    return false;
}


/**
 *  获取response JSON对象
 *
 *  @return 返回解密后的JSON对象
 */
- (id)responseJSONObject {
    if ([self isDataFromCache] && self.cacheJson != nil) {
        DEBUGLog(
                 @"http请求:%@ 获取数据来自缓存",
                 [NSString stringWithFormat:@"%@%@",
                  [[YTKNetworkConfig sharedInstance] baseUrl],
                  requestUrl]);
    } else {
        DEBUGLog(
                 @"http请求:%@ 获取数据来自远程",
                 [NSString stringWithFormat:@"%@%@",
                  [[YTKNetworkConfig sharedInstance] baseUrl],
                  requestUrl]);
    }
    
    id dataObject = [super responseJSONObject];
    if (dataObject == nil) {
        DEBUGLog(@"%@", @"JSON数据为空");
        return nil;
    }
        return dataObject;
}



/**
 *  请求的类型,默认是POST
 *
 *  @return YTKRequestMethod
 */

    - (YTKRequestMethod)requestMethod {
         return reqMethod;
    }
/**
 *  rquest请求content-Type: 默认使用Json传递
 *
 *  @return YTKRequestSerializerType
 */
- (YTKRequestSerializerType)requestSerializerType {
    return serialType;
}

/**
 *  请求的URL
 *
 *  @return requestURL
 */
- (NSString *)requestUrl {
    return requestUrl;
}

/**
 *  请求的参数
 *
 *  @return NSDictionary* paramMap
 */
- (id)requestArgument {
    return _paramMap;
}

/**
 *  HTTP响应超时时间
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)requestTimeoutInterval {
    return 15;
}

/**
 *  在HTTP报头添加的自定义参数
 *
 *  @return NSDictionary
 */
- (NSDictionary *)requestHeaderFieldValueDictionary {
//    Dictionary *dict =
//    [NSDictionary dictionaryWithObject:@"MyTestClient : X-Signiture=1Uhi8g9A91" forKey:@"User-Agent"];
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"MyTestClient : X-Signiture=1Uhi8g9A91"  forKey:@"User-Agent"];
    [dict setValue:@"697381b065bbfe4a714cd14cf394978e" forKey:@"X-Key"];
    return dict;
}

/**
 *  缓存超时时间(秒)
 *
 *  @return NSInteger
 */
- (NSInteger)cacheTimeInSeconds {
    return cacheTime;
}

/**
 *  用于在cache结果，计算cache文件名时，忽略掉一些指定的参数
 *
 *  @param argument 参数
 *
 *  @return
 */
- (id)cacheFileNameFilterForRequestArgument:(id)argument {
    return nil;
}

@end
