//
//  ObjCViewModel.h
//  Async Fetch Example
//
//  Created by Chris Adamson on 31/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjCModel.h"

@interface ObjCViewModel : NSObject

@property (nonatomic, copy) void (^modelUpdated)(void);

@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSArray *results;

- (void)performRequest;

@end
