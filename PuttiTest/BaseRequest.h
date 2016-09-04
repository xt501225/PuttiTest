//
//  BaseRequest.h
//  PuttiTest
//
//  Created by summer on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//


#import "YTKNetworkPrivate.h"

@interface BaseRequest : YTKRequest


/**
 *  初始化：适合于访问逛逛服务器，数据需要加密(不使用缓存)
 *
 *  @param model 请求参数Model对象
 *  @param url   请求的URL
 *
 *  @return BaseRequest obj
 */
- (instancetype)initWithModel:(NSObject *)model URL:(NSString *)url;


/**
 *  初始化：适合于访问逛逛服务器，数据需要加密；设置缓存时间, 缓存网络请求
 *
 *  @param model 请求参数Model对象
 *  @param url   请求的URL
 *  @param time  缓存时间 >0：启用缓存；<=0：不使用缓存
 *
 *  @return BaseRequest obj
 */
- (instancetype)initWithModel:(NSObject *)model URL:(NSString *)url cacheTime:(NSInteger)time;

/**
 *  初始化：适合于访问逛逛服务器，数据需要加密(不使用缓存)
 *
 *  @param dict 请求参数Dictionary对象
 *  @param url   请求的URL
 *
 *  @return BaseRequest obj
 */
- (instancetype)initWithDict:(NSDictionary *)dict URL:(NSString *)url;

/**
 *  初始化：适合于访问逛逛服务器，数据需要加密；设置缓存时间, 缓存网络请求
 *
 *  @param dict 请求参数Dictionary对象
 *  @param url   请求的URL
 *  @param time  缓存时间 >0：启用缓存；<=0：不使用缓存
 *
 *   @return BaseRequest obj
 */
- (instancetype)initWithDict:(NSDictionary *)dict URL:(NSString *)url cacheTime:(NSInteger)time;

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
                    cacheTime:(NSInteger)time;


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
                   cacheTime:(NSInteger)time;




@end
