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
    
    _refreshController = [[UIRefreshControl alloc] init];
    [_refreshController addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    
    [_tableView addSubview:_refreshController];
    
    _viewModel = [[ObjCViewModel alloc] init];
    _viewModel.delegate = self;
    
}

- (void)modelDidUpdate
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_refreshController endRefreshing];
        [_tableView reloadData];
    });
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
    
    cell.dateLabel.text = commit.date.description;
    cell.userLabel.text = commit.user;
    cell.messageLabel.text = commit.message;
    
    return cell;
}

@end