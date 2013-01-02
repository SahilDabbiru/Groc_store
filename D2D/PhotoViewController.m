//
//  PhotoViewController.m
//  D2D
//
//  Created by jaya prakash rao polsani on 15/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()
{
    NSString *weightType;
    NSString *imageselected;
    NSString *quantityType;
    int count1,countVar;
    NSMutableArray *total;
    NSString *priceselected;
    NSMutableArray *noCart;
    int sum;
}
@end

@implementation PhotoViewController

@synthesize smallPhotos_ScrollView;
@synthesize imagesArray;
@synthesize productImageView;
#define kPICKERCOLUMN 1
#define kweightTYPEPICKERTAG 20
#define kquantityTYPEPICKERTAG 21

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
		    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     NSLog(@"controllers--%@",self.navigationController.viewControllers);
    count1=0;
    sum=0;
    total = [NSMutableArray new];
    count=5;
    
    self.navigationItem.title=@"Item Description";
    imagesArray=[[NSMutableArray alloc] initWithObjects:@"image1.png",@"image2.png",@"image3.png",@"image4.png",@"image3.png",@"image2.png",@"image1.png",@"image4.png",@"image2.png",@"image4.png",@"image3.png",@"image2.png",@"image2.png",@"image4.png",@"image3.png",@"image1.png", nil];
    
    weightTypes = [[NSMutableArray alloc] initWithObjects:@"50 grms",@"100 grms",@"250 grms",@"500 grms",@"1 kg",
                   @"5 kgs",@"10 kgs",nil];
    
    quantityTypes = [[NSMutableArray alloc] init];
    for (int i=1; i<=100; i++) {
        [quantityTypes addObject:[[NSString alloc] initWithFormat:@"%d",i]];
    }

    [self createScrollView];
    // Do any additional setup after loading the view from its nib.
    weightTypePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
	weightTypePicker.tag =weightTypeBtn.tag;//      kweightTYPEPICKERTAG;
	weightTypePicker.showsSelectionIndicator = TRUE;
	weightTypePicker.dataSource = self;
	weightTypePicker.delegate = self;
	weightTypePicker.hidden = YES;
	quantityTypePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
	quantityTypePicker.backgroundColor = [UIColor blueColor];
	quantityTypePicker.tag = quantityTypeBtn.tag;//kquantityTYPEPICKERTAG;
	quantityTypePicker.showsSelectionIndicator = TRUE;
	quantityTypePicker.hidden = YES;
	quantityTypePicker.dataSource = self;
	quantityTypePicker.delegate = self;
    
    databasePath = [[NSBundle mainBundle] pathForResource:@"loginjp" ofType:@"sqlite"];

    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Cart" style:UIBarButtonItemStylePlain target:self action:@selector(Cart:)];
    
    [weightTypeBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
    [quantityTypeBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
    noCart=[NSMutableArray new];
}
-(void)Cart:(UIBarButtonItem *)sender{
    
    //perform your action
    CartViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"CartViewController"];
    NSLog(@"%@",cart);
    controller.aCart=noCart;
    [self.navigationController pushViewController:controller animated:YES];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eve
{
	
	if ( !quantityTypePicker.hidden) {
		quantityTypePicker.hidden = YES;
	}
	if ( !weightTypePicker.hidden) {
		weightTypePicker.hidden = YES;
	}
}


- (void) createScrollView
{
	
	NSLog(@"in create scrollview");
	
	//add views to scrolview
	 NSLog(@"self.imagesArray---%d",[self.imagesArray count]);
	x=5;
	int y=7;
	
	for (int i=0;i<[self.imagesArray count];i++)
	{
        
       
		UIView *userView=[[UIView alloc] initWithFrame:CGRectMake(x, y, 70, 80)];
		userView.tag=i;
		
		UIImageView *backgroundImgView=[[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 70, 70)];
		backgroundImgView.tag=1;
		
        UIImage *image=[UIImage imageNamed:[imagesArray objectAtIndex:i]];
        // NSLog(@"image$$---%@",[UIImage imageNamed:[imagesArray objectAtIndex:i]]);
        
        
        [backgroundImgView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:i]]];
        //[backgroundImgView setImageWithURL:[NSURL URLWithString:plist.smallimage] placeholderImage:[UIImage imageNamed:@"logo_grey.png"]];
        
        
		///////////// round corners of image//////////
		
		CALayer *imageLayer = [CALayer layer];
		imageLayer.frame =  CGRectMake(0,0, 70, 70);
		imageLayer.cornerRadius = 5.0;
		imageLayer.masksToBounds =YES;
		
		
		//////////// end round corners /////////////
        
		
		UIButton *userButton=[[UIButton alloc]initWithFrame:CGRectMake(1, 1, 70,70)];
		[userButton addTarget:self action:@selector(userImageClicked:) forControlEvents:UIControlEventTouchUpInside];
		userButton.tag=i;
		
		//CGPoint center=self.view.center;
		UIActivityIndicatorView *activity=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
		
		activity.frame=CGRectMake(25, 30, 17, 17);
		activity.hidesWhenStopped=YES;
		[activity startAnimating];
		
		[userView addSubview:backgroundImgView];
		[userView addSubview:userButton];
		///[userView addSubview:activity];
		
		[self.smallPhotos_ScrollView addSubview:userView];
		
		
		x+=80;
		/*
         if ((i+1)%4==0) {
         
         //if added image is 4 th image
         x+=80;
         x=5;
         }
         */
        NSLog(@"X+ value is---%d",x);

	}
	
	if (x+40>self.smallPhotos_ScrollView.frame.size.height) {
        
        NSLog(@"X value is---%d",x);
		//self.smallPhotos_ScrollView.contentSize=CGSizeMake(320, y+100);
        self.smallPhotos_ScrollView.contentSize=CGSizeMake(x, y);
        
	}
    /*
	else {
		//self.smallPhotos_ScrollView.contentSize=CGSizeMake(320, self.smallPhotos_ScrollView.frame.size.height+60);
        self.smallPhotos_ScrollView.contentSize=CGSizeMake(self.smallPhotos_ScrollView.frame.size.width+40, 20);
        
	}
	
	*/
	
}

-(IBAction)leftArrowPressed:(id)sender

{
    //int x=5;
    rightArrow_Button.hidden=NO;

   
    count=count-320;
    NSLog(@"count---%d",count);
    
    if(count>=5)
    {
       
        leftArrow_Button.hidden=NO;
    [smallPhotos_ScrollView setContentOffset:CGPointMake(count, 0) animated:YES];
        if(count==5)
        {
             leftArrow_Button.hidden=YES;
            rightArrow_Button.hidden=NO;

        }
    }
   

}
-(IBAction)rightArrowPressed:(id)sender

{
      leftArrow_Button.hidden=NO;
    NSLog(@"count$$$$$$$$$$$$$$---%d",count);
    if(count<x)
    {

  count=count+320;
    }
    NSLog(@"count^^^^^^^^^^^^^^^---%d",count);
    NSLog(@"x^^^^^^^^^^^^^^^---%d",x);

    
    if(x-320>=count)
    {

    [smallPhotos_ScrollView setContentOffset:CGPointMake(count, 0) animated:YES];
    }
    
    if(x-320==count)
    {
        leftArrow_Button.hidden=NO;
        rightArrow_Button.hidden=YES;
    }
   
    
}

- (IBAction) userImageClicked: (id) sender
{
     countVar=[sender tag];
    
    NSLog(@"count---%d",countVar);
    
    
    [productImageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:countVar]]];
    /*
     PhotoDetailViewController *photoDetailVC=[[PhotoDetailViewController alloc] initWithNibName:@"PhotoDetailViewController" bundle:nil];
     [self.navigationController pushViewController:photoDetailVC animated:YES];
     */
    
}


#pragma mark picker methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSLog(@"numberOfComponentsInPickerView");

	return 1;//kPICKERCOLUMN;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    NSLog(@"numberOfRowsInComponent [weightTypes count]---%d ",[weightTypes count]);
    NSLog(@"numberOfRowsInComponent [weightTypes count]---%d ",[quantityTypes count]);

	if (pickertag==0)
    {
        NSLog(@"tag=0");
		return [weightTypes count];
}
	else
    {
        NSLog(@"tag=1");

		return [quantityTypes count];
    }
	
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSLog(@"%@,%@",weightTypes,quantityTypes);
	if (pickertag==0)
    {
        NSLog(@"titleForRow tag=0");

		return [weightTypes objectAtIndex:row];
    }
	else
    {
        NSLog(@"titleForRow tag=1");

		return [quantityTypes objectAtIndex:row];
    }
	
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if (pickertag==0)
    {
		weightType  = [weightTypes objectAtIndex:[pickerView selectedRowInComponent:0]];
		[weightTypeBtn setTitle:weightType forState:UIControlStateNormal];
		
	}else {
		
		quantityType  = [quantityTypes objectAtIndex:[pickerView selectedRowInComponent:0]];
		[quantityTypeBtn setTitle:quantityType forState:UIControlStateNormal];
		
	}
    
    [pickerView removeFromSuperview];
	
}
-(IBAction) showquantityTypePicker{
    
    
    if ( quantityTypePicker.hidden) {
        quantityTypePicker.hidden = NO;
    }
    
    pickertag=1;
    [self.view addSubview:quantityTypePicker];
}
-(IBAction) showweightTypePicker
{
    
    if ( weightTypePicker.hidden) {
        weightTypePicker.hidden = NO;
    }
    pickertag=0;
	[self.view addSubview:weightTypePicker];
}


-(IBAction)addToCart
{
    count1++;
    NSString *selected= [imagesArray objectAtIndex:countVar];
    NSArray *select =[selected componentsSeparatedByString:@"."];
    imageselected = [select objectAtIndex:0];
    NSLog(@"imageselected:%@",imageselected);
    NSArray *select1 =[weightType componentsSeparatedByString:@" "];
    NSString *weightselected = [select1 objectAtIndex:0];
    NSLog(@"%@",weightselected);
   

    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if(sqlite3_open(dbpath, &LoginDB) == SQLITE_OK){
        
        NSString *price = [NSString stringWithFormat: @"select price from price WHERE  image=\'%@\' and kg=\'%@\'",imageselected,weightselected];
        const char *query_stmt = [price UTF8String];
        NSLog(@"price:%@",price);
        if (sqlite3_prepare_v2(LoginDB, query_stmt, -1, &statement, NULL) == SQLITE_OK){
            
            while (sqlite3_step(statement) == SQLITE_ROW){
                
                priceselected = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                NSLog(@"%@,%@,%@",priceselected,quantityType,imageselected);
                NSString *str = [NSString stringWithFormat:@"%d",[priceselected intValue] * [quantityType intValue]];
                NSLog(@"str: %@",str);
                [total addObject:str];
                NSLog(@":::%@",total);
                ////
                
                
                sqlite3_finalize(statement);
            }
                NSLog(@"nocart::%@",noCart);
            
            sqlite3_close(LoginDB);
        }
    }
    NSLog(@"cart:: %@",cart);
    
    if (sqlite3_open(dbpath, &LoginDB) == SQLITE_OK){
        
        int sum1 = [priceselected intValue] * [quantityType intValue];
        NSString *str = [NSString stringWithFormat:@"%d",[priceselected intValue] * [quantityType intValue]];
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO cart (image,kg,quantity,sum) VALUES (\'%@\', \'%@\', \'%@\', \'%@\')", imageselected,weightselected,quantityType,str];
        const char *insert_stmt = [insertSQL UTF8String];
        NSLog(@"insert %s",insert_stmt);
        
        sqlite3_prepare_v2(LoginDB, insert_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE){
            
            if ([[weightTypeBtn currentTitle] isEqualToString:[NSString stringWithFormat:@"%d",0]] ){
                
               
                
                UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                                  message:@"Please select both weight & Quantity"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil];
                [message show];
                NSLog(@"quantitybtn:%@",[quantityTypeBtn currentTitle]);

            }
            else if (![[weightTypeBtn currentTitle] isEqualToString:[NSString stringWithFormat:@"%d",0]] && [[quantityTypeBtn currentTitle] isEqualToString:[NSString stringWithFormat:@"%d",0]]){
                
                
                
                UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                                  message:@"Please select both weight & Quantity"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil];
                [message show];
            }
            
            else{
                NSLog(@"quantitybtn:%@",[quantityTypeBtn currentTitle]);

              
                    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
                              message:@"Added to cart"
                             delegate:nil
                    cancelButtonTitle:@"OK"
                    otherButtonTitles:nil];
                [message show];
                cart = [[NSMutableDictionary alloc] init];
                [cart setObject:imageselected forKey:@"product"];
                [cart setObject:weightselected forKey:@"weight"];
                [cart setObject:quantityType forKey:@"quantity"];
                [cart setObject:str forKey:@"price"];
                ///
                [noCart addObject:cart];
                
                for (int i=1; i<= count1; i++){
                    NSLog(@"total: %@",total);
                }
                sum=sum+sum1;
                NSLog(@"totalsum: %d",sum);
            }
        }
        else {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                              message:@"Couldn't Add to cart"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
    }
}



@end
