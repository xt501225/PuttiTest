//
//  ItemListVC.h
//  PuttiTest
//
//  Created by summer on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Events.h"
//#import "BaseRequest.h"
#import "Events.h"
#import "EventModel.h"
#import <YYModel/YYModel.h>
#import "ItemListCell.h"
#import "ItemCellProtocol.h"
#import "ItemDetailVC.h"

@interface ItemListVC : UITableViewController

@property (nonatomic,strong) Events* events;

@end
