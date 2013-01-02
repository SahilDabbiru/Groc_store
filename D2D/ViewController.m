//
//  ViewController.m
//  D2D
//
//  Created by jaya prakash rao polsani on 15/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()

@end

@implementation ViewController
@synthesize imagesArray;
@synthesize photo_ScrollView;
@synthesize itemnameArray,itempriceArray;
@synthesize str,sample;

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
    NSLog(@"str--%@",sample);

    
    self.navigationItem.title=@"All Items";
    self.navigationController.navigationBar.tintColor =[UIColor blackColor];
    self.navigationController.navigationBarHidden=NO;

    
    imagesArray=[[NSMutableArray alloc] initWithObjects:@"image1.png",@"image2.png",@"image3.png",@"image4.png",@"image3.png",@"image2.png",@"image1.png",@"image4.png",@"image2.png",@"image4.png",@"image3.png",@"image2.png",@"image2.png",@"image4.png",@"image3.png",@"image1.png", nil];
    
       itemnameArray =[[NSMutableArray alloc] initWithObjects:@"Saffola Oats",@"kelloggs chocos",@"Quaker Oats",@"Ponds",@"Fair&Lovely",@"Fem Golden",@"TajMahal Tea",@"Tata Gemini Tea",@"Ponds",@"Fair&Lovely",@"Saffola Oats",@"Green Label",@"kelloggs chocos",@"Fem Golden",@"Quaker Oats",@"TajMahal Tea", nil];
    
        itempriceArray=[[NSMutableArray alloc] initWithObjects:@"Rs.33.49",@"Rs.45.54",@"Rs.60.76",@"Rs.34.65",@"Rs.44.00",@"Rs.38.61",@"Rs.201.96",@"Rs.114.52",@"Rs.145.54",@"Rs.33.49",@"image3.png",@"Rs.45.54",@"Rs.60.76",@"Rs.44.00",@"Rs.44.00",@"Rs.38.61", nil];
    /*
     for (int i=1; i<=4; i++) {
     [imagesArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"image%d.png",i]]];
     }
     */
    [self createScrollView];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"UpLoad Items" style:UIBarButtonItemStylePlain target:self action:@selector(UpLoad:)];
    
    
}
-(void)UpLoad:(UIBarButtonItem *)sender{
    
    //perform your action
    UIViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"upLoadViewController"];
    
    
    [self.navigationController pushViewController:controller animated:YES];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self videoPlay];
    
    // self.navigationController.navigationBarHidden=YES;
}

-(void)videoPlay
{
    
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"intro123" ofType:@"mp4"];
    NSLog(@"urlStr--%@",urlStr);
    
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    
    moviePlayer =[[MPMoviePlayerController alloc] initWithContentURL:url];
	
	//moviePlayer.view.frame=self.window.bounds;
	[moviePlayer setFullscreen:YES];
	
	moviePlayer.view.frame=CGRectMake(5,400,310,100);
    
    [self.view addSubview:moviePlayer.view];
    
    
	[[NSNotificationCenter defaultCenter] addObserver:self
           selector:@selector(moviePlayerFinished)
               name:
     MPMoviePlayerPlaybackDidFinishNotification
             object:moviePlayer];
    
    
	//[moviePlayer setFullscreen:YES animated:NO];
	[moviePlayer setControlStyle:MPMovieControlModeDefault];
	
	
	[moviePlayer play];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    //self.navigationController.navigationBarHidden=YES;
    
    [moviePlayer stop];
    moviePlayer=nil;
    [moviePlayer.view removeFromSuperview ];
    
}
-(void)moviePlayerFinished
{
    NSLog(@"moviePlayerFinished");
    
    [self videoPlay];
}

- (void) createScrollView
{
	
	NSLog(@"in create scrollview");
	
	//add views to scrolview
	
	int x=5;
	int y=9;
	
	for (int i=0;i<[self.imagesArray count];i++)
	{
        
        NSLog(@"self.imagesArray---%@",self.imagesArray);
		UIView *userView=[[UIView alloc] initWithFrame:CGRectMake(x, y, 104, 110)];
        
        // userView.backgroundColor=[UIColor redColor];
		userView.tag=i;
        
        
        UILabel *itemname_label=[[UILabel alloc] initWithFrame:CGRectMake(3, 69, 70, 18)];
        itemname_label.text=[itemnameArray objectAtIndex:i];
        itemname_label.font = [UIFont boldSystemFontOfSize:12.0];
        UILabel *price_label=[[UILabel alloc] initWithFrame:CGRectMake(3, 85, 70, 15)];
        price_label.text=[itempriceArray objectAtIndex:i];
        price_label.font = [UIFont boldSystemFontOfSize:12.0];
        
        
		
		UIImageView *backgroundImgView=[[UIImageView alloc] initWithFrame:CGRectMake(3, 4, 95, 62)];
		backgroundImgView.tag=1;
        // backgroundImgView.backgroundColor=[UIColor grayColor];
		
        //UIImage *image=[UIImage imageNamed:[imagesArray objectAtIndex:i]];
        // NSLog(@"image$$---%@",[UIImage imageNamed:[imagesArray objectAtIndex:i]]);
        
        
        [backgroundImgView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:i]]];
        //[backgroundImgView setImageWithURL:[NSURL URLWithString:plist.smallimage] placeholderImage:[UIImage imageNamed:@"logo_grey.png"]];
        
        
		///////////// round corners of image//////////
        UIButton *userButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70,70)];
        
        // userButton.backgroundColor=[UIColor grayColor];
		[userButton addTarget:self action:@selector(userImageClicked:) forControlEvents:UIControlEventTouchUpInside];
		userButton.tag=i;
		
		CALayer *imageLayer = [CALayer layer];
		imageLayer.frame =  CGRectMake(0,0, 70, 70);
		imageLayer.cornerRadius = 5.0;
		imageLayer.masksToBounds =YES;
        imageLayer.contents=(id)[UIImage imageNamed:[imagesArray objectAtIndex:i]].CGImage;
        
        [userButton.layer addSublayer:imageLayer];
        
		
		//////////// end round corners /////////////
        
		
		
        
        
		
		//CGPoint center=self.view.center;
		UIActivityIndicatorView *activity=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
		
		activity.frame=CGRectMake(25, 30, 17, 17);
		activity.hidesWhenStopped=YES;
		[activity startAnimating];
		
        
        
		//[userView addSubview:backgroundImgView];
		[userView addSubview:userButton];
        [userView addSubview:itemname_label];
        [userView addSubview:price_label];
        [userView addSubview:userButton];
		///[userView addSubview:activity];
		
		[self.photo_ScrollView addSubview:userView];
		
		
		x+=80;
		
		if ((i+1)%4==0) {
			
			//if added image is 4 th image
			y+=105;
			x=5;
		}
		
	}
	
	if (y+100>self.photo_ScrollView.frame.size.height) {
		self.photo_ScrollView.contentSize=CGSizeMake(320, y+105);
	}
	else {
		self.photo_ScrollView.contentSize=CGSizeMake(320, self.photo_ScrollView.frame.size.height+80);
	}
	
}

- (IBAction) userImageClicked: (id) sender
{
    
//    PhotoViewController *photoDetailVC=[[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:nil];
//    [self.navigationController pushViewController:photoDetailVC animated:YES];

    UIViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
