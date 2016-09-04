//
//  EventModel.h
//  PuttiTest
//
//  Created by Sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

/**
 *  JSON Data From Server
 */
@interface EventModel : NSObject

//newsID
@property(nonatomic,assign) NSInteger newsID;

//Title
@property(nonatomic,copy) NSString* title;

//Synopsis
@property(nonatomic,copy)  NSString* synopsis;

//Description
@property(nonatomic,copy)  NSString* description;

//Ordering
@property(nonatomic,copy) NSString* ordering;

//StartDate
@property(nonatomic,copy) NSString* startDate;

//EventDateTime
@property(nonatomic,copy) NSString* eventDateTime;

//OrginalImageURL
@property(nonatomic,copy)  NSString* originalImageURL;

//ThumbnailImageURL
@property(nonatomic,copy)  NSString* thumbnailImageURL;

//ImageDate
@property(nonatomic,copy)  NSString* imageDate;

//ShareURL
@property(nonatomic,copy) NSString* shareURL;

//MediaURL
@property(nonatomic,copy) NSString* mediaURL;

//UpdatedDate
@property(nonatomic,copy) NSString* updatedDate;

@end
