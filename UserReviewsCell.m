//
//  UserReviewsCell.m
//  D2D
//
//  Created by jaya prakash rao polsani on 02/01/13.
//  Copyright (c) 2013 jaya prakash rao polsani. All rights reserved.
//

#import "UserReviewsCell.h"

@implementation UserReviewsCell
@synthesize commentLabel;
@synthesize  starImgView1;

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
