//
//  ItemLabelCell.h
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "AbstractCell.h"


@interface ItemLabelCell : AbstractCell
   @property UILabel *leftLabel;
   @property UILabel *rightLabel;

@end

@interface LabelCellModel : NSObject

@property(nonatomic, strong) NSString *leftStr;
@property(nonatomic, strong) NSString *rightStr;

+ (instancetype)modelWithLeftStr:(NSString *)leftStr rightStr:(NSString *)rightStr;
@end

