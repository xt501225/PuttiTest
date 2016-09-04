//
//  ItemDetailVC.m
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemDetailVC.h"


@interface ItemDetailVC() {
    SectionDescriptor *_imageSD;
    SectionDescriptor *_infoSD;
    SectionDescriptor *_descriptionSD;
}
@end

@implementation ItemDetailVC


- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [view setBackgroundColor:[UIColor whiteColor]];
    self.view = view;
}

/**
 *  init method
 *
 *  @param eventModel Model Object
 *
 *  @return instanceType
 */
- (instancetype) initWithItem: (EventModel*) eventModel {
     self = [super init];
    
    if(self) {
        self.eventModel = eventModel;
    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _eventModel.title;
    
    // table view
    _tableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStyleGrouped];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView setRowHeight:UITableViewAutomaticDimension];
    [_tableView setEstimatedRowHeight:44.0];
    [self.view addSubview:_tableView];
    
    // setction descriptor
    _sectionDescriptors = [NSMutableArray<SectionDescriptor *> new];
    [self initTableView];
    
}

-(void) initTableView {
    
    _imageSD = [SectionDescriptor new];
    _imageSD.headerHeight = CGFLOAT_MIN;
    _infoSD = [SectionDescriptor new];
    _descriptionSD = [SectionDescriptor new];
    [self addSectionDescriptors:@[ _imageSD, _infoSD, _descriptionSD ]];
    
    
    RowDescriptor *imageRD =  [RowDescriptor descriptorWithCellClass:[ItemImageCell class] cellValue:[ImageCellModel modelWithImages:_eventModel.originalImageURL height: 300 ]];
    [_imageSD addRowDescriptor:imageRD];
    
    
    RowDescriptor *newsID = [RowDescriptor descriptorWithCellClass:[ItemLabelCell class] cellValue:[LabelCellModel modelWithLeftStr: CONSTANT_NEWSID rightStr: [NSString stringWithFormat: @"%lu", _eventModel.newsID]]];
    RowDescriptor *ordering = [RowDescriptor descriptorWithCellClass:[ItemLabelCell class] cellValue:[LabelCellModel modelWithLeftStr: CONSTANT_ORDERING rightStr: _eventModel.ordering]];
    RowDescriptor *startDate = [RowDescriptor descriptorWithCellClass:[ItemLabelCell class] cellValue:[LabelCellModel modelWithLeftStr: CONSTANT_START_DATE rightStr: _eventModel.startDate]];
    RowDescriptor *eventDateTime = [RowDescriptor descriptorWithCellClass:[ItemLabelCell class] cellValue:[LabelCellModel modelWithLeftStr: CONSTANT_EVENT_DATETIME rightStr: _eventModel.eventDateTime]];
    RowDescriptor *imageDate = [RowDescriptor descriptorWithCellClass:[ItemLabelCell class] cellValue:[LabelCellModel modelWithLeftStr: CONSTANT_IMAGE_DATE rightStr: _eventModel.imageDate]];
    RowDescriptor *updatedDate = [RowDescriptor descriptorWithCellClass:[ItemLabelCell class] cellValue:[LabelCellModel modelWithLeftStr: CONSTANT_UPDATED_DATE rightStr: _eventModel.updatedDate]];
    RowDescriptor *shareURL = [RowDescriptor descriptorWithCellClass:[ItemLabelCell class] cellValue:[LabelCellModel modelWithLeftStr: CONSTANT_SHARE_URL rightStr: _eventModel.shareURL]];
    RowDescriptor *mediaURL = [RowDescriptor descriptorWithCellClass:[ItemLabelCell class] cellValue:[LabelCellModel modelWithLeftStr: CONSTANT_MEDIA_URL rightStr: _eventModel.mediaURL]];
    
    NSString * str = @"Synopsis:<br/>";
    RowDescriptor *synopsis = [RowDescriptor descriptorWithCellClass:[ItemRichLabelCell class] cellValue:[str stringByAppendingString:_eventModel.synopsis]];
    
    [_infoSD addRowDescriptor:newsID];
    [_infoSD addRowDescriptor:ordering];
    [_infoSD addRowDescriptor:startDate];
    [_infoSD addRowDescriptor:eventDateTime];
    [_infoSD addRowDescriptor:imageDate];
    [_infoSD addRowDescriptor:updatedDate];
    [_infoSD addRowDescriptor:shareURL];
    [_infoSD addRowDescriptor:mediaURL];
    [_infoSD addRowDescriptor:synopsis];
    _infoSD.headerView = [[CellHeadView alloc]initWithText:CONSTANT_INFO];
    _infoSD.headerHeight = 20.0f;
    
    
    
    RowDescriptor *descriptionRD =
    [RowDescriptor descriptorWithCellClass:[ItemRichLabelCell class]
                                 cellValue:_eventModel.description];
    
    [_descriptionSD addRowDescriptor:descriptionRD];
    _descriptionSD.headerView = [[CellHeadView alloc]initWithText:CONSTANT_DESCRIPTION];
    _descriptionSD.headerHeight = 20.0f;
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