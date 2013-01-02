//
//  GroceriesViewController.m
//  D2D
//
//  Created by Shankar Dabbiru on 18/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "GroceriesViewController.h"

@interface GroceriesViewController ()

@end

@implementation GroceriesViewController

@synthesize EdiblesDataList;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    EdiblesDataList= [[NSMutableArray alloc] initWithObjects:@"COOKING OIL",
                      @"RICE", @"FLOUR/SEMOLINA",@"MASALAS",@"PULSES/SEEDS",@"SALT",@"OTHERS",@"SPICES/HERBS",@"DRY FRUITS",@"FRYUMS",@"PICKLES",@"BASMATI RICE",@"GHEE & VANASPATHI",@"ORGANIC",nil];
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
    // Return the number of sections.
    return 1;
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
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
-(IBAction)homeButtonPressed:(id)sender

{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
