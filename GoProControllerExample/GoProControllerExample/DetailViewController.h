//
//  DetailViewController.h
//  GoProControllerExample
//
//  Created by Adil Malik on 10/12/2015.
//  Copyright © 2015 Cape. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end