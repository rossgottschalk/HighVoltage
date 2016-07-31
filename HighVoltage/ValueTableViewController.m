//
//  ValueTableViewController.m
//  HighVoltage
//
//  Created by Ross Gottschalk on 7/29/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ValueTableViewController.h"



@interface ValueTableViewController ()

@property (strong, nonatomic) NSMutableArray *valueTypes;

@end

@implementation ValueTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.valueTypes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"valuePopoverCell" forIndexPath:indexPath];
    NSString *valueTypeNames = self.valueTypes[indexPath.row];
    cell.textLabel.text = valueTypeNames;
    
    
    // Configure the cell...
    
    return cell;
}

#pragma UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//user has selected a row
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    //this deselects the row selected. AKA turns off the highlight
    [self dismissViewControllerAnimated:YES completion:nil];
    //make the popover vc disappear
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
