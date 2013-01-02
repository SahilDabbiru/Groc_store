//
//  UserReviewsViewController.m
//  D2D
//
//  Created by jaya prakash rao polsani on 02/01/13.
//  Copyright (c) 2013 jaya prakash rao polsani. All rights reserved.
//

#import "UserReviewsViewController.h"

@interface UserReviewsViewController ()

@end

@implementation UserReviewsViewController

@synthesize reviewTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"navbar_320.png"];
    UIImageView *nav_imageView = [[UIImageView alloc] initWithImage:image];
    [self.navigationController.navigationBar addSubview:nav_imageView];
	// Do any additional setup after loading the view.
}

-(NSInteger) tableView : (UITableView *) tableView
  numberOfRowsInSection: (NSInteger) section {
    
    
    return 10;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"UserReviewsCell";
    
    UserReviewsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UserReviewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    cell.commentLabel.text =@"Testing commnt";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end