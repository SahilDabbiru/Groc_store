//
//  CartViewController.m
//  D2D
//
//  Created by jaya prakash rao polsani on 27/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "CartViewController.h"
#import "CartCell.h"
#import "TotalCell.h"

@interface CartViewController ()
{
}
@property(nonatomic,readwrite) NSInteger *rowSelected;
@end

@implementation CartViewController
@synthesize aCart,ccount,deld;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

   
    deld=[NSMutableArray new];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   // [self.tableView registerClass:[CartCell class] forCellReuseIdentifier:@"CartCell"];
    for (int i=0; i<aCart.count; i++) {
        NSDictionary *dic=[aCart objectAtIndex:i];
        [deld addObject:[dic objectForKey:@"price"]];
    }
    for (int i=0; i<deld.count; i++) {
        _total=_total+[[deld objectAtIndex:i] intValue];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{    // Return the number of sections.
    return 2;
        
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section==0) {
        return aCart.count;
    }

    else{
        if (deld.count>0) {
            return 1;
        }
        else
        {
            CGRect labelFrame = CGRectMake( 10, 40, 100, 30 );
            UILabel* label = [[UILabel alloc] initWithFrame: labelFrame];
            [label setText: @"No Products"];
            [label setTextColor: [UIColor orangeColor]];
            [self.view addSubview: label];
            return 0;
        }
            
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
    CartCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CartCell"];
    if(cell == nil) {
        cell = [[CartCell alloc] initWithStyle:
                      UITableViewCellStyleDefault reuseIdentifier:@"CartCell"];
        }
    
    cell.delBtn.tag=indexPath.row;
    // Configure the cell...
    
        NSDictionary *dic=[aCart objectAtIndex:indexPath.row];
        NSLog(@"dic--%@",dic);
       // [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        cell.productLabel.text=[dic objectForKey:@"product"];
        cell.weightLabel.text=[dic objectForKey:@"weight"];
        cell.quantityLabel.text=[dic objectForKey:@"quantity"];
        cell.priceLabel.text=[dic objectForKey:@"price"];
        NSLog(@"deld%@",deld);
   
        return cell;
    }
    
    else{
        TotalCell *cell =[tableView dequeueReusableCellWithIdentifier:@"TotalCell"];
        if(cell == nil) {
            cell = [[TotalCell alloc] initWithStyle:
                    UITableViewCellStyleDefault reuseIdentifier:@"TotalCell"];
        }
        int sum = _total+25;
        cell.totalLabel.text=[NSString stringWithFormat:@"%d",sum];
        return cell;
    }
  
   
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [aCart removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }
}
-(IBAction)delBtn:(id)sender
{
    
        [aCart removeObjectAtIndex:[sender tag]];
        [self.tableView reloadData];
    int delPrice=[[deld objectAtIndex:[sender tag]] intValue];
    NSLog(@"deletedprice:%d",delPrice);
    _total=_total-delPrice;
    NSLog(@"total11:::%d",_total);
    [deld removeObjectAtIndex:[sender tag]];
    NSLog(@"deld1212%@",deld);
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 72;
    }
    else
        return 72;
}

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

@end
