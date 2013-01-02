//
//  HomeUpkeepViewController.h
//  D2D
//
//  Created by Shankar Dabbiru on 18/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeUpkeepViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
IBOutlet  UITableView *homeTableView;
    NSArray *EdiblesDataList;
}
@property (nonatomic,retain) NSArray *EdiblesDataList;
-(IBAction)backButtonPressed:(id)sender;
-(IBAction)homeButtonPressed:(id)sender;

@end
