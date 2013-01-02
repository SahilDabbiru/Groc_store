//
//  CartViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 27/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoViewController.h"

@interface CartViewController : UITableViewController
{
    
}
@property (nonatomic,retain) NSMutableArray *aCart;
@property (nonatomic,retain) NSMutableArray *deld;
@property (nonatomic,readwrite) int *ccount;
@property (nonatomic,readwrite) int total;

@end
