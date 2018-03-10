//
//  ObjCModel.m
//  Async Fetch Example
//
//  Created by Chris Adamson on 31/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import "ObjCModel.h"

@implementation ObjCModel

- (instancetype)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self)
    {
        
        self.date = [[[data objectForKey:@"commit"] objectForKey:@"author"] objectForKey:@"date"];
        self.user = [[[data objectForKey:@"commit"] objectForKey:@"author"] objectForKey:@"name"];
        self.message = [[data objectForKey:@"commit"] objectForKey:@"message"];
        
    }
    return self;
}

@end
