//
//  AbstractItemVC.h
//  PuttiTest
//
//  Created by summer on 16/9/4.
//  Copyright © 2016年 Sam. All rights reserved.
//


#import "SectionDescriptor.h"

@interface AbstractItemVC : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray<SectionDescriptor *> *sectionDescriptors;


- (NSUInteger)numberOfSestions;

- (void)addSectionDescriptor:(SectionDescriptor *)sectionDescriptor;

- (void)addSectionDescriptors: (NSArray<SectionDescriptor *> *)sectionDescriptors;

@end
