//
//  EdibleViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 14/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"



@interface EdibleViewController : UIViewController
{
    NSArray *EdiblesDataList;
}
@property (nonatomic,retain) NSArray *EdiblesDataList;
-(IBAction)homeMethodCall:(id)sender;


@end
