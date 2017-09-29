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

@interface ObjCViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ModelUpdatedDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshController;

@property (strong, nonatomic) ObjCViewModel *viewModel;

@end

