//
//  JLPTableViewController.h
//  Notes
//
//  Created by Josh Pearlstein on 3/9/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLPNotes.h"
#import <MapKit/MapKit.h>
@interface JLPTableViewController : UITableViewController
@property (nonatomic,retain) NSMutableArray *notes;
-(void)addNote:(JLPNotes *)note;


@end
