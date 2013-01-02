//
//  detailedListViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 21/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface detailedListViewController : UIViewController<MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) id detailItem;
@property (nonatomic,retain) NSString *selectedItem;

@property (weak,nonatomic) IBOutlet UITextView *detailDescriptionText;

@end
