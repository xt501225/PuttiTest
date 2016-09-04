//
//  ItemListCell.h
//  PuttiTest
//
//  Created by summer on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//


#import "EventModel.h"
#import "ItemCellProtocol.h"
#import "ItemDetailVC.h"

@interface ItemListCell : UITableViewCell<ItemCellProtocol>

//image
@property (nonatomic,strong) UIImageView * imageImageView;

//title
@property (nonatomic,strong) UILabel *titleLabel;

//subtitle: ordering
@property (nonatomic,strong) UILabel *subtitleLabel;

//updateTime
@property (nonatomic,strong) UILabel *lastModifiedTimeLabel;

@end
