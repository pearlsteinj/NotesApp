//
//  JLPTableViewController.m
//  Notes
//
//  Created by Josh Pearlstein on 3/9/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "JLPTableViewController.h"
#import "JLPDetailViewController.h"
#define kJLPCellIdentifier @"My Cell Identifier"
@interface JLPTableViewController ()
@end

@implementation JLPTableViewController
@synthesize notes;
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
    notes = [[NSMutableArray alloc]init];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kJLPCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kJLPCellIdentifier];
    }
    
    cell.textLabel.text = [self.notes[indexPath.row] title];
    return cell;
}

#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"tableSelect"]){
        NSString *title = [self.notes[[self.tableView indexPathForSelectedRow].row] title];
        [segue.destinationViewController setTitleText:title];
        NSString *note = [self.notes[[self.tableView indexPathForSelectedRow].row] note];
        [segue.destinationViewController setNoteText:note];
        CLLocation *location = [self.notes[[self.tableView indexPathForSelectedRow].row] location];
        [segue.destinationViewController setLocation:location];
        [self.notes removeObjectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
    else if([segue.identifier isEqualToString:@"newNote"]){
        JLPDetailViewController *controller =(JLPDetailViewController *)segue.destinationViewController;
        [controller setTitleText:@"Insert Title"];
        [controller setNoteText:@"Type your note here..."];
        [controller setLocationToSet:nil];
    }
}


-(void)addNote:(JLPNotes *)note {
    [notes insertObject:note atIndex:0];
}

@end