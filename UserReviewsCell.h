//
//  UserReviewsCell.h
//  D2D
//
//  Created by jaya prakash rao polsani on 02/01/13.
//  Copyright (c) 2013 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserReviewsCell : UITableViewCell
{

UILabel *commentLabel;
UIImageView *starImgView1;
}
@property(nonatomic,strong)IBOutlet UILabel *commentLabel;
@property(nonatomic,strong)IBOutlet UIImageView *starImgView1;
@end
