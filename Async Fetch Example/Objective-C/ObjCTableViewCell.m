//
//  ObjCTableViewCell.m
//  Async Fetch Example
//
//  Created by Chris Adamson on 29/09/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import "ObjCTableViewCell.h"

@implementation ObjCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
     
     [self.dateLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:20]];
    [self.userLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:20]];
    [self.messageLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:14]];
    
    // Initialization code
}

@end
