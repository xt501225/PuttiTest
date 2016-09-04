//
//  ItemImageCell.h
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "AbstractCell.h"
#import "Constant.h"


@class ImageCellModel;
@interface ItemImageCell : AbstractCell

@property (nonatomic,strong) ImageCellModel *model;

@end


@interface ImageCellModel : NSObject

@property(nonatomic, copy) NSString *image;
@property(nonatomic) CGFloat height;

+ (instancetype)modelWithImages:(NSString *)image height:(CGFloat)height;

@end
