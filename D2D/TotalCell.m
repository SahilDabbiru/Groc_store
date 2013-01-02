//
//  TotalCell.m
//  D2D
//
//  Created by jaya prakash rao polsani on 31/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "TotalCell.h"

@implementation TotalCell
@synthesize totalLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
