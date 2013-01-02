//
//  listViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 19/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailedListViewController.h"

@interface listViewController : UITableViewController
{
    NSMutableArray *datas;
}
@property(nonatomic, retain) NSMutableArray *datas;
@property(nonatomic,retain) NSString *list;

@end
