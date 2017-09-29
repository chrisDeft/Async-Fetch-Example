//
//  ObjCTableViewCell.h
//  Async Fetch Example
//
//  Created by Chris Adamson on 29/09/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjCTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;


@end
