//
//  MainTableViewController.m
//  HighVoltage
//
//  Created by Ross Gottschalk on 7/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "MainTableViewController.h"
#import "ValueTableViewController.h"
#import "CustomTableViewCell.h"


@interface MainTableViewController () <UIPopoverPresentationControllerDelegate, ValueTableDelegate>


@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@property (strong, nonatomic) NSMutableArray *visibleValueCells;
@property (strong, nonatomic) NSMutableArray *remainingValueTypes;
@property (strong, nonatomic) NSDictionary *allValueTypes;






@end

@implementation MainTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"High Voltage";
    self.visibleValueCells = [[NSMutableArray alloc] init];
    self.allValueTypes = @{@"Volts": @"volts (V)", @"Watts": @"watts (W)", @"Amps": @"amps (A)", @"Ohms": @"ohms (Ω)"};
    self.remainingValueTypes = [[self.allValueTypes allKeys] mutableCopy];
   
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Handlers
//- (IBAction)addNewValueTypeButton:(UIBarButtonItem *)sender
//{
    //[self.valueTypes addObject:@"Hi Tyler"];
    //[self.tableView reloadData];
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.visibleValueCells.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ValueTypeCell" forIndexPath:indexPath];
    
    
    
    // Configure the cell...
    
    [cell.ValueText becomeFirstResponder];

    NSString *valueNameKey = self.visibleValueCells [indexPath.row];
    NSString *valueNameValue = [self.allValueTypes objectForKey:valueNameKey];
    
    cell.ValueTypeLabel.text = valueNameKey;
    cell.ValueText.placeholder = valueNameValue;
    
    //cell.textLabel.text = @"Hi Daniel";
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"valueTypePopoverSegue"])
    {
        ValueTableViewController *valueTableVC = [segue destinationViewController];
        valueTableVC.valueTypes = self.remainingValueTypes;
        //this sends "remainingValueTypes over to valueTypes in the valueTableVC
        valueTableVC.popoverPresentationController.delegate = self;
        valueTableVC.delegate = self;
        int contentHeight = 44.0f * self.allValueTypes.count;
        valueTableVC.preferredContentSize = CGSizeMake(200.0f, contentHeight);
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - UIPopoverPresentationController delegate
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

#pragma mark - ValueTableDelegate

-(void) valueTypeWasChosen:(NSString *)valueTypeName
{
    [self.visibleValueCells addObject:valueTypeName];
    [self.remainingValueTypes removeObject:valueTypeName];
    [self.tableView reloadData];
    
    
}

@end
