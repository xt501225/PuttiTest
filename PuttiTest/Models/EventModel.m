//
//  EventModel.m
//  PuttiTest
//
//  Created by Sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "EventModel.h"

@implementation EventModel

@synthesize description = _description;


+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
              @"description": @"Description",
              @"imageDate" : @"ImageDate",
              @"mediaURL" :@"MediaURL",
              @"newsID" : @"NewsID",
              @"originalImageURL" : @"OriginalImageURL",
              @"shareURL" : @"ShareURL",
              @"synopsis": @"Synopsis",
              @"title" : @"Title",
              @"updatedDate" : @"UpdatedDate"
             };
}

@end
