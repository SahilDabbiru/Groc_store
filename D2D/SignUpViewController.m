//
//  SignUpViewController.m
//  D2D
//
//  Created by jaya prakash rao polsani on 13/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "SignUpViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize FirstName_text,LastName_text,Email_text,Password_text,Phone_text, Address_text, status_label;

-(IBAction)signUp:(id)sender
{
    sqlite3_stmt *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    [FirstName_text resignFirstResponder];
    [LastName_text resignFirstResponder];
    [Email_text resignFirstResponder];
    [Password_text resignFirstResponder];
    [Address_text resignFirstResponder];
    [Phone_text resignFirstResponder];
    
    if (sqlite3_open(dbpath, &LoginDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO D2D (FirstName,LastName,Email,Password,Phone,Address) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", FirstName_text.text,LastName_text.text,Email_text.text,Password_text.text,Phone_text.text, Address_text.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(LoginDB, insert_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            if ([FirstName_text.text isEqualToString:@""]||[LastName_text.text isEqualToString:@""]||[Email_text.text isEqualToString:@""]||[Password_text.text isEqualToString:@""]||[Address_text.text isEqualToString:@""]||[Phone_text.text isEqualToString:@""]) {
                
               // status_label.text=@"Please enter details properly";
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
              message:@"Please enter details properly"
             delegate:nil
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil];
                [message show];
                
            }
            else{
                // [insertSQL resignFirstResponder];
                
                //status_label.text = @"Sign up Successful";
                
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
              message:@"Sign up Successful"
             delegate:nil
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil];
                [message show];

                FirstName_text.text = @"";
                LastName_text.text = @"";
                Email_text.text = @"";
                Password_text.text = @"";
                Address_text.text = @"";
                Phone_text.text = @"";
                UITabBarController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
                
                
                [self.navigationController pushViewController:controller animated:YES];
               // status_label.text=@" ";
            }
            
        }
        else {
            //status_label.text = @"Failed to Sign Up";
            
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
              message:@"Sign up Failed"
             delegate:nil
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil];
            [message show];
            FirstName_text.text = @"";
            LastName_text.text = @"";
            Email_text.text = @"";
            Password_text.text = @"";
            Address_text.text = @"";
            Phone_text.text = @"";
            
        }
        sqlite3_finalize(statement);
        sqlite3_close(LoginDB);
    }
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch * touch = [touches anyObject];
//    if(touch.phase == UITouchPhaseBegan) {
//        [self.view endEditing:YES];
//    }
//}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField tag]<2) {
    
    self.view.frame=CGRectMake(0, -40, 320, 548);
    }
    else  if ([textField tag]>=2 && [textField tag]<4) {
        
        self.view.frame=CGRectMake(0, -60, 320, 548);
    }
    else {
        
        self.view.frame=CGRectMake(0, -100, 320, 548);
    }
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView tag]>0) {
        
        self.view.frame=CGRectMake(0, -125, 320, 548);
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, 0, 320, 548);
    [textField resignFirstResponder];
    //status_label.text=@"";
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[Address_text layer] setBorderColor:[[UIColor brownColor] CGColor]];
    [[Address_text layer] setBorderWidth:2.3];
    [[Address_text layer] setCornerRadius:15];
    [Address_text setClipsToBounds: YES];
    
    databasePath = [[NSBundle mainBundle] pathForResource:@"loginjp" ofType:@"sqlite"];
    
}


- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.FirstName_text = nil;
    self.LastName_text = nil;
    self.Email_text = nil;
    self.Password_text = nil;
    self.Address_text = nil;
    self.Phone_text = nil;
   // self.status_label = nil;
}
@end