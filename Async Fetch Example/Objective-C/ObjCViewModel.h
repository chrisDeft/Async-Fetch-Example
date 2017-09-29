//
//  ObjCViewModel.h
//  Async Fetch Example
//
//  Created by Chris Adamson on 31/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjCModel.h"

@protocol ModelUpdatedDelegate <NSObject>

- (void)modelDidUpdate;

@end

@interface ObjCViewModel : NSObject

@property (nonatomic, assign) id <ModelUpdatedDelegate> delegate;

@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSArray *results;

- (void)performRequest;

@end
