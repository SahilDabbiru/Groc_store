//
//  PhotoViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 15/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "sqlite3.h"
#import "CartViewController.h"
@interface PhotoViewController : UIViewController
<UIPickerViewDataSource,UIPickerViewDelegate> {
    UIButton *doneButton ;
    UIButton *backButton ;
    UIScrollView *smallPhotos_ScrollView;
    UIPickerView *weightTypePicker;
	UIPickerView *quantityTypePicker;
	NSMutableArray *weightTypes;
	NSMutableArray *quantityTypes;
	IBOutlet UIButton *weightTypeBtn;
	IBOutlet UIButton *quantityTypeBtn;
    NSMutableDictionary *cart;
    
    int pickertag;
    int count;
    int x;
    IBOutlet UIButton *leftArrow_Button;
    IBOutlet UIButton *rightArrow_Button;
    NSString *databasePath;
    UILabel *status_label;
    sqlite3 *LoginDB;
}

-(IBAction) showweightTypePicker;
-(IBAction) showquantityTypePicker;
-(IBAction)leftArrowPressed:(id)sender;
-(IBAction)rightArrowPressed:(id)sender;
-(IBAction)addToCart;


@property(nonatomic,strong) IBOutlet UIImageView *productImageView;
@property(nonatomic,strong) IBOutlet UIScrollView *smallPhotos_ScrollView;
@property(nonatomic,strong) NSMutableArray *imagesArray;

@end
