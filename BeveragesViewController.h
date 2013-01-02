//
//  BeveragesViewController.h
//  D2D
//
//  Created by Shankar Dabbiru on 18/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeveragesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
IBOutlet  UITableView *beverTableView;
    NSArray *EdiblesDataList;
}
@property (nonatomic,retain) NSArray *EdiblesDataList;


@end
