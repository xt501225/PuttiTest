//
//  ItemListVC.h
//  PuttiTest
//
//  Created by Sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "AbstractItemVC.h"
#import "Events.h"
#import "EventModel.h"
#import "ItemListCell.h"
#import "SectionDescriptor.h"
#import "RowDescriptor.h"

@interface ItemListVC : AbstractItemVC

@property (nonatomic,strong) Events* events;

@end
