//
//  MainTableViewController.m
//  HighVoltage
//
//  Created by Ross Gottschalk on 7/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "MainTableViewController.h"
#import "ValueTableViewController.h"


@interface MainTableViewController () <UIPopoverPresentationControllerDelegate, ValueTableDelegate>


@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@property (strong, nonatomic) NSMutableArray *visibleValueCells;
@property (strong, nonatomic) NSMutableArray *remainingValueTypes;
@property (strong, nonatomic) NSMutableArray *valueTypes;






@end

@implementation MainTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"High Voltage";
    self.valueTypes = [[NSMutableArray alloc] init];
    [self.valueTypes addObject:@"watts"];
    [self.valueTypes addObject:@"volts"];
    [self.valueTypes addObject:@"amps"];
    [self.valueTypes addObject:@"ohms"];

   
    
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
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ValueTypeCell" forIndexPath:indexPath];
    
    
    // Configure the cell...
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
        valueTableVC.popoverPresentationController.delegate = self;
        valueTableVC.delegate = self;
        int contentHeight = 44.0f * self.valueTypes.count;
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

-(void) valueTypeWasChosen:(NSString *)valueTypeChosen
{
    
}

@end
