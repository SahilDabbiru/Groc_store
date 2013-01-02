//
//  detailedListViewController.m
//  D2D
//
//  Created by jaya prakash rao polsani on 21/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "detailedListViewController.h"



@interface detailedListViewController ()

- (void)configureView;
@end

@implementation detailedListViewController
@synthesize selectedItem;

#pragma mark - Managing the detail item
//
//- (void)setDetailItem:(id)newDetailItem
//{
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//        
//        // Update the view.
//        [self configureView];
//    }
//}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if ([selectedItem isEqualToString:@"Payment at Doorstep"]) {
        self.detailDescriptionText.text=@"Vokav.com aim is to provide greater flexibility to the customers. We think for our customers and all the offers and promotions are planned to enhance the flexibility and convenience to our customers.\nWhat is it for you, when you pay at doorstep?\n\t 1.No apprehensions about the quality of product purchased online. You can reject the product if you feel that particular product is low on quality.\n\t 2.You have an option of paying Cash or Sodexo on delivery.";

    }
    else if ([selectedItem isEqualToString:@"Weekend Shopping"]) {
        self.detailDescriptionText.text=@"Need to be Updated ";
    }
    else if ([selectedItem isEqualToString:@"Savings Calculator"]) {
        
        /////
       CGRect webFrame = CGRectMake(10.0, 5.0, 300.0, 494.0);
        UIWebView *webView = [[UIWebView alloc] initWithFrame:webFrame];
        [webView setBackgroundColor:[UIColor greenColor]];
        NSString *urlAddress = @"http://www.roseindia.net";
        NSURL *url = [NSURL URLWithString:urlAddress];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        [webView loadRequest:requestObj];
        webView.scalesPageToFit=YES;
        [self.view addSubview:webView];
       
    }
    else if ([selectedItem isEqualToString:@"Refer a Friend"]) {
        [self displayComposerSheet];
    }
    else if ([selectedItem isEqualToString:@"About us"]) {
        self.detailDescriptionText.text=@" Need to be Updated";
    }
    else{
self.detailDescriptionText.text=@"Need to be Updated";
    }
}
//- (void)mailComposeController:(MFMailComposeViewController*)controller
//          didFinishWithResult:(MFMailComposeResult)result
//                        error:(NSError*)error;
//{
//    if (result == MFMailComposeResultSent) {
//        NSLog(@"It's away!");
//       
//    }
//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
//}
 -(void)sendButtonClicked
        {
        Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
            if (mailClass != nil){
                
                // To check whether the current device is configured for sending emails or not
                
                if ([mailClass canSendMail]){    [self displayComposerSheet];  }
                
                else{   [self launchMailAppOnDevice];  }
                
            }
            
            else{  [self launchMailAppOnDevice];}
            
        } // End sendButtonClicked
                               
-(void)displayComposerSheet
        {
            
            MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
            
            picker.mailComposeDelegate = self;
            
            [picker setSubject:@"Reference"];
            
            // Set up recipients
            
            NSArray *toRecipients = [NSArray arrayWithObject:@"first@example.com"];
            
            NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
            
            NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
            
            [picker setToRecipients:toRecipients];
            
            [picker setCcRecipients:ccRecipients];
            
            [picker setBccRecipients:bccRecipients];
            
            // To Attach an image to the email
            
            NSString *path = [[NSBundle mainBundle] pathForResource:@"ads" ofType:@"png"];
            
            NSData *myData = [NSData dataWithContentsOfFile:path];
            
            [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"attachment"];
            
            // Add text to email body
            
            NSString *emailBody = @"I strongly recommend this website www.D2D.com. It's a world class shopping experience & I've always found anything I've ever wanted.\n\n\t\t\tYou can shop online any time and choose a convenient delivery date (including weekends), and groceries would be delivered free of cost. They offer great deals and discounts which you don't find in regular stores.\n\n\t\tYou can also call them on phone (8008833321), and place your order.\n\t\n\t\tThey offer multiple payment options like credit cards, debit cards, Internet banking online and Cash or Sodexo on delivery.\n\t\n\t\tYou can enjoy the world-class retailing and technology on Vokav.com with extra savings..\n\n\n Best Wishes\nD2D.";
            
            [picker setMessageBody:emailBody isHTML:NO];
            
            [self presentViewController:picker animated:YES completion:nil];

        } // End displayComposerSheet
                               
// To Dismisses the email composition interface when users tap on Cancel or Send. Proceeds to update the message field with the result of the operation.
                               
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                    message:@"Unknown Error"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
            // show alert to users about errors associated with the interface
            
            switch (result)
            
            {
                    
                case MFMailComposeResultCancelled:
                    
                    alert.title=@"Successful";
                    alert.message = @"Result: canceled";
                    [alert show];
                    break;
                    
                case MFMailComposeResultSaved:
                
                    alert.title=@"Successful";
                alert.message = @"Result: saved";
                    [alert show];
                    break;
                    
                case MFMailComposeResultSent:
                    
                    alert.title=@"Successful";
                    alert.message = @"Result: sent";
                    [alert show];
                    
                    break;
                    
                case MFMailComposeResultFailed:
                    
                    alert.message = @"Result: failed";
                    [alert show];
                    
                    break;
                    
                default:
                    
                    alert.message = @"Result: not sent";
                    [alert show];
                    
                    break;
                    
            }
            
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
        }
                               
                               // Launches the Mail application on the device.
                               
-(void)launchMailAppOnDevice {
                                   
        NSString *recipients = @"mailto:first@example.com?                   cc=second@example.com,third@example.com&subject=Enter Subject line here!";
    NSString *body = @"&body=This is email body, change text as per your requirements.!";
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
                                   
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                                   
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

                               

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
