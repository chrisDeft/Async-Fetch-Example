//
//  ObjCViewController.m
//  Async Fetch Example
//
//  Created by Chris Adamson on 30/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import "ObjCViewController.h"

@interface ObjCViewController ()

@end

@implementation ObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Objective-C";
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _stringToDateFormatter = [[NSDateFormatter alloc] init];
    _stringToDateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    _dateToStringFormatter = [[NSDateFormatter alloc] init];
    _dateToStringFormatter.dateStyle = NSDateFormatterMediumStyle;
    _dateToStringFormatter.timeStyle = NSDateFormatterShortStyle;
    
    _tableView.refreshControl = [[UIRefreshControl alloc] init];
    [_tableView.refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    
    _viewModel = [[ObjCViewModel alloc] init];
    
    __weak typeof(self) weakSelf = self;
    
    [_viewModel setModelUpdated:^(void) {
        
        dispatch_async(dispatch_get_main_queue(), ^{

            __strong typeof(self) strongSelf = weakSelf;

            [strongSelf.tableView.refreshControl endRefreshing];
            [strongSelf.tableView reloadData];
        });
    }];
    
    [_viewModel performRequest];
    
}


- (void)handleRefresh:(id)sender
{
    [_viewModel performRequest];
}

#pragma mark UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _viewModel.results.count;
}

- (ObjCTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     ObjCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dataCell"];
    
    ObjCModel *commit = [_viewModel.results objectAtIndex:indexPath.row];
    
    NSDate *commitDate = [_stringToDateFormatter dateFromString:commit.date];
    
    cell.dateLabel.text = [_dateToStringFormatter stringFromDate:commitDate];
    cell.userLabel.text = commit.user;
    cell.messageLabel.text = commit.message;
    
    return cell;
}

@end
