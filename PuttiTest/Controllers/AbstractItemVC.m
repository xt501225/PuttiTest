//
//  AbstractItemVC.m
//  PuttiTest
//
//  Created by summer on 16/9/4.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "AbstractItemVC.h"

@interface AbstractItemVC ()

@end

@implementation AbstractItemVC


- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [view setBackgroundColor:[UIColor whiteColor]];
    self.view = view;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // table view
    _tableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStyleGrouped];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView setRowHeight:UITableViewAutomaticDimension];
    [_tableView setEstimatedRowHeight:44.0];
    [self.view addSubview:_tableView];
    _sectionDescriptors = [NSMutableArray<SectionDescriptor *> new];
    
    [self initTableView];
    
}

//subclass override
-(void) initTableView {
    
}

#pragma mark Section

- (NSUInteger)numberOfSestions {
    return [_sectionDescriptors count];
}

- (void)addSectionDescriptor:(SectionDescriptor *)sectionDescriptor {
    [_sectionDescriptors addObject:sectionDescriptor];
}

- (void)addSectionDescriptors: (NSArray<SectionDescriptor *> *)sectionDescriptors {
    [_sectionDescriptors addObjectsFromArray:sectionDescriptors];
}



#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [[_sectionDescriptors objectAtIndex:section] headerHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[_sectionDescriptors objectAtIndex:section] headerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [[_sectionDescriptors objectAtIndex:section] footerHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[_sectionDescriptors objectAtIndex:section] footerView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell<ItemCellProtocol> *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(tappedInTableView:viewController:)])
    {
        [cell tappedInTableView:tableView viewController:self];
    }
}

#pragma makr UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self numberOfSestions];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SectionDescriptor *sectionDescriptor = [_sectionDescriptors objectAtIndex:section];
    return [sectionDescriptor numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SectionDescriptor *sectionDescriptor = [_sectionDescriptors objectAtIndex:indexPath.section];
    RowDescriptor *rowDescriptor = [sectionDescriptor.rowDescriptors objectAtIndex:indexPath.row];
    return [rowDescriptor cellForTableView:tableView viewController:self];
}


@end
