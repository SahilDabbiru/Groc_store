//
//  EdibleViewController.h
//  D2D
//
//  Created by Shankar Dabbiru on 18/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"
#import "GADRequest.h"
#import "SampleConstants.h"

@interface EdibleViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,GADBannerViewDelegate>
{

NSArray *EdiblesDataList;
    
  IBOutlet  UITableView *editleTableView;
    GADBannerView *adBanner;
    BOOL isAdMobPressed;
}
@property (nonatomic,retain) NSArray *EdiblesDataList;

@property(nonatomic, retain) GADBannerView *adBanner;

- (GADRequest *)createRequest;
-(IBAction)homeMethodCall:(id)sender;


@end

