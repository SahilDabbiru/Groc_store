//
//  EdibleViewController.m
//  D2D
//
//  Created by Shankar Dabbiru on 18/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "EdibleViewController.h"
#import "WelcomeViewController.h"
#import "ViewController.h"


@interface EdibleViewController ()

@end

@implementation EdibleViewController


@synthesize EdiblesDataList;
@synthesize adBanner;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
     isAdMobPressed=NO;
    
    // Uncomment the following line to preserve selection between presentations.
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    EdiblesDataList= [[NSMutableArray alloc] initWithObjects:@"JAM/HONEY/KETCHUP",
                      @"OATS/CORN FLAKES", @"CHIPS/MUNCHES", @"CHOCLATES",
                      @"COOKIES", @"BREAKFAST MIX'S",@"POP CORN", @"SNACKS/NAMKEEN",@"SOUPS/NOODLES", nil];
    
    //   NSString *str=[NSString stringWithFormat:@"%d",int];
    
    self.navigationController.navigationItem.title=@"Edibles";
    UIImage *home_image=[UIImage imageNamed:@"done.png"];
    UIButton *home_Button=[UIButton buttonWithType:UIButtonTypeCustom];
    home_Button.frame=CGRectMake(0.0, 0.0, 50.0, 30.0);
    [home_Button setImage:home_image forState:UIControlStateNormal];
    [home_Button addTarget:self action:@selector(homeMethodCall) forControlEvents:UIControlEventTouchUpInside];
    home_Button.showsTouchWhenHighlighted=YES;
    
    UIBarButtonItem *home_barButton=[[UIBarButtonItem alloc] initWithCustomView:home_Button];
    self.navigationItem.leftBarButtonItem=home_barButton;
    
    self.adBanner = [[GADBannerView alloc] initWithFrame:CGRectMake(0.0,45.0,320.0,50.0)];
    self.adBanner.adUnitID = kSampleAdUnitID;
    self.adBanner.delegate = self;
    [self.adBanner setRootViewController:self];
    
    
    // [self.view addSubview:homeViewController.view];
    //self.selectedViewController=homeViewController;
    [self.view addSubview:self.adBanner];
    
    [self.adBanner loadRequest:[self createRequest]];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;

}

-(IBAction)homeMethodCall:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
   

}

- (GADRequest *)createRequest
{
    GADRequest *request = [GADRequest request];
    
    //Make the request for a test ad
    request.testDevices = [NSArray arrayWithObjects:
                           GAD_SIMULATOR_ID,                               // Simulator
                           nil];
    
    return request;
}

#pragma mark GADBannerViewDelegate impl

// Since we've received an ad, let's go ahead and set the frame to display it.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"Received ad");
    
    NSLog(@"UICustomTabViewController adViewDidReceiveAd **********************************************");
    
    
      
    
    
}
- (void)adViewWillPresentScreen:(GADBannerView *)bannerView
{
    NSLog(@"UICustomTabViewController adViewWillPresentScreen **********************************************");
    
    
    
}

- (void)adViewDidDismissScreen:(GADBannerView *)bannerView
{
    NSLog(@"UICustomTabViewController adViewWillPresentScreen **********************************************");
    isAdMobPressed=YES;
    
}
- (void)adView:(GADBannerView *)view
didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"Failed to receive ad with error: %@", [error localizedFailureReason]);
}
-(void)homeMethodCall
{
    // [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
    // [self.navigationController popToRootViewControllerAnimated:YES];
    NSArray *arr;
    for(int i=0;i<[self.navigationController.viewControllers count];i++)
    {
        arr=[self.navigationController.viewControllers objectAtIndex:i];
        
    }
    NSLog(@"array---%@",arr);
    
    UIViewController *prevVC = [self.navigationController.viewControllers objectAtIndex:0];
    [self.navigationController popToViewController:prevVC animated:YES];
    
    
    
}

-(NSInteger) tableView : (UITableView *) tableView
  numberOfRowsInSection: (NSInteger) section {
    NSLog(@"list: %@",EdiblesDataList);
    return [self.EdiblesDataList count];
}
-(UITableViewCell *) tableView : (UITableView *) tableView
          cellForRowAtIndexPath: (NSIndexPath *) indexPath {
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"acell"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:@"acell"];
    }
    cell.textLabel.text = [self.EdiblesDataList
                           objectAtIndex:[indexPath row]];
    
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellAccessoryNone;
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

-(IBAction)homeButtonPressed:(id)sender

{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    //    ViewController *photoVC=[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //    [self.navigationController pushViewController:photoVC animated:YES];
    
    //UIViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    ViewController *c = [ViewController new];
    c=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    c.sample=@"sample";
    
    [self.navigationController pushViewController:c animated:YES];
    
    
}

@end
