//
//  WelcomeViewController.h
//  D2D
//
//  Created by Shankar Dabbiru on 14/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController<UISearchBarDelegate>

{
    IBOutlet UIButton *leftArrow_Button;
    IBOutlet UIButton *rightArrow_Button;
    int count;

}
@property(nonatomic,retain)IBOutlet UIImageView *imageView;
@property(nonatomic,retain)IBOutlet UISearchBar *searchBar;
@property(nonatomic,retain)NSMutableArray *imagesArray;

-(IBAction)callButtonPressed:(id)Sender;
-(IBAction)leftArrowPressed:(id)sender;
-(IBAction)rightArrowPressed:(id)sender;




@end
