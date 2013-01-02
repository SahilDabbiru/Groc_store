//
//  WelcomeViewController.m
//  D2D
//
//  Created by Shankar Dabbiru on 14/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "WelcomeViewController.h"
#import "listViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController
@synthesize imageView;
@synthesize searchBar;
@synthesize imagesArray;

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
    
    self.navigationItem.title=@"D2D";
    self.navigationController.navigationBarHidden=NO;

    
    count=0;
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    
      imagesArray = [[NSMutableArray alloc] init];
    
    
    
   
    
        // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{

    self.navigationController.navigationBarHidden=NO;
    [self.navigationController setNavigationBarHidden:NO animated:animated];

    for (int i=1; i<=4; i++) {
        [imagesArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"image%d.png",i]]];
    }
    
    imageView.animationImages = imagesArray;
    imageView.animationDuration = 10;
    
    [imageView startAnimating] ;

}
-(void)viewWillDisappear:(BOOL)animated
{
   self.navigationController.navigationBarHidden=YES;
    [self.navigationController setNavigationBarHidden:YES animated:animated];

    [imageView stopAnimating] ;

}



-(IBAction)callButtonPressed:(id)Sender
{
    
#if TARGET_IPHONE_SIMULATOR
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Simulator Not Support Call Functionality" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
#elif TARGET_OS_IPHONE
    
    NSString *phonePref;
    
    phonePref=[NSString stringWithFormat:@"tel://%@",@"+918008833321"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonePref]];
    
    
#endif
}

/*
-(IBAction)homeViewCalling:(id)sender
{
   
    
    UITabBarController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    [self.navigationController pushViewController:controller animated:YES];
}
*/
-(IBAction)leftArrowPressed:(id)sender

{
    //int x=5;
    
    
    count=count-320;
    NSLog(@"count---%d",count);
    
    if(count>=5)
    {
        
        leftArrow_Button.hidden=NO;
        //[smallPhotos_ScrollView setContentOffset:CGPointMake(count, 0) animated:YES];
        if(count==0)
        {
            leftArrow_Button.hidden=YES;
        }
    }
    
    
}
-(IBAction)rightArrowPressed:(id)sender

{
    leftArrow_Button.hidden=NO;
    count=count+320;
    NSLog(@"count---%d",count);
    
   // [smallPhotos_ScrollView setContentOffset:CGPointMake(count, 0) animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
       UITouch * touch = [touches anyObject];
        if(touch.phase == UITouchPhaseBegan) {
            [self.view endEditing:YES];
        }
    }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    listViewController *listView= segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"usefulLinks"]) {
        listView.list=@"usefulLinks";
        listView.navigationItem.title=@"UsefulLinks";
    }
    else if ([segue.identifier isEqualToString:@"newProducts"]) {
        listView.list=@"newProducts";
        listView.navigationItem.title=@"NewProducts";

    }
    else if ([segue.identifier isEqualToString:@"bestSelling"]) {
        listView.list=@"bestSelling";
        listView.navigationItem.title=@"BestSelling";

    }
    else if ([segue.identifier isEqualToString:@"information"]) {
        listView.list=@"information";
        listView.navigationItem.title=@"Information";

    }
}


@end
