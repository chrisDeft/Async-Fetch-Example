//
//  ViewController.h
//  Async Fetch Example
//
//  Created by Chris Adamson on 30/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCViewModel.h"
#import "ObjCTableViewCell.h"

@interface ObjCViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSDateFormatter *stringToDateFormatter;
@property (strong, nonatomic) NSDateFormatter *dateToStringFormatter;

@property (strong, nonatomic) ObjCViewModel *viewModel;

@end

