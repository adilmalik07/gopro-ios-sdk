//
//  MasterViewController.h
//  GoProControllerExample
//
//  Created by Adil Malik on 10/12/2015.
//  Copyright © 2015 Cape. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end