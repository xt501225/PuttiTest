//
//  ItemDetailVC.h
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionDescriptor.h"
#import "EventModel.h"
#import "ItemCellProtocol.h"
#import "ItemImageCell.h"
#import "ItemLabelCell.h"
#import "ItemRichLabelCell.h"
#import "Constant.h"
#import "CellHeadView.h"

@interface ItemDetailVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) EventModel* eventModel;

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray<SectionDescriptor *> *sectionDescriptors;


- (instancetype) initWithItem: (EventModel*) eventModel;

- (NSUInteger)numberOfSestions;

- (void)addSectionDescriptor:(SectionDescriptor *)sectionDescriptor;

- (void)addSectionDescriptors: (NSArray<SectionDescriptor *> *)sectionDescriptors;

@end
