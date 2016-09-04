//
//  AbstractCell.h
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemCellProtocol.h"

@interface AbstractCell : UITableViewCell<ItemCellProtocol> {
   @protected
    BOOL _setConstraints;
}

- (void)initCell;

- (void)initConstraints;

- (CGFloat)vPadding;

- (CGFloat)hPadding;


@end
