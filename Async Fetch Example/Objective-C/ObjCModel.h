//
//  ObjCModel.h
//  Async Fetch Example
//
//  Created by Chris Adamson on 31/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjCModel : NSObject

@property (nonatomic, strong) NSString *user;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *message;

- (instancetype)initWithData:(NSDictionary *)data;

@end
