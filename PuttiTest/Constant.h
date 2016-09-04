//
//  Constant.h
//  PuttiTest
//
//  Created by Sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#define SERVER_URL   @"http://testing.moacreative.com/job_interview/event.php"

#define DEBUGLog(format, ...) NSLog(format, ##__VA_ARGS__)

#define CONSTANT_EVENT @"Events"
#define CONSTANT_NEWSID @"NewsID"
#define CONSTANT_TITLE @"Title"
#define CONSTANT_SYNOPSIS @"Synopsis"
#define CONSTANT_DESCRIPTION @"Description"
#define CONSTANT_ORDERING @"Ordering"
#define CONSTANT_START_DATE @"StartDate"
#define CONSTANT_EVENT_DATETIME @"EventDateTime"
#define CONSTANT_ORIGINAL_IMAGE_URL @"OrginalImageURL"
#define CONSTANT_THUMBNAIL_IMAGE_URL @"ThumbnailImageURL"
#define CONSTANT_IMAGE_DATE @"ImageDate"
#define CONSTANT_SHARE_URL @"ShareURL"
#define CONSTANT_MEDIA_URL @"MediaURL"
#define CONSTANT_UPDATED_DATE @"UpdatedDate"
#define CONSTANT_INFO @"Info"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SCALE [UIScreen mainScreen].scale
#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]

#endif /* Constant_h */
