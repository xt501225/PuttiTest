//
//  ItemDetailVC.m
//  PuttiTest
//
//  Created by Sam on 16/9/3.
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

@end