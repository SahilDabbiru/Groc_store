//
//  UserReviewsViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 02/01/13.
//  Copyright (c) 2013 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserReviewsCell.h"

@interface UserReviewsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)IBOutlet UITableView *reviewTable;
@end
