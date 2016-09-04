//
//  ItemDetailVC.h
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "AbstractItemVC.h"
#import "EventModel.h"
#import "ItemCellProtocol.h"
#import "ItemImageCell.h"
#import "ItemLabelCell.h"
#import "ItemRichLabelCell.h"
#import "Constant.h"
#import "CellHeadView.h"

@interface ItemDetailVC : AbstractItemVC

@property (nonatomic,strong) EventModel* eventModel;

- (instancetype) initWithItem: (EventModel*) eventModel;

@end
