//
//  ObjCViewModel.m
//  Async Fetch Example
//
//  Created by Chris Adamson on 31/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

#import "ObjCViewModel.h"

@implementation ObjCViewModel

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _results = @[];
    }
    return self;
}

- (void)performRequest
{
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/repos/apple/swift/commits?per_page=100"];
    NSURLSessionDataTask *fetchData = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@",error.description);
        }
        else
        {
            if (response)
            {
                _responseData = [[NSMutableData alloc] init];
                
                if (data)
                {
                    [_responseData appendData:data];
                    
                    [self parseResponseData];
                    
                }
            }
        }
    }];
    
    [fetchData resume];
}

- (void)parseResponseData
{
    NSError *error = nil;
    
    NSArray *parseResponse = [NSJSONSerialization JSONObjectWithData:_responseData options:0 error:&error];
    
    if (error)
    {
        NSLog(@"%@",error.description);
    }
    
    NSMutableArray *tempResults = [@[] mutableCopy];
    
    for (NSDictionary *dict in parseResponse)
    {
        
        ObjCModel *commit = [[ObjCModel alloc] initWithData:dict];
        [tempResults addObject:commit];
    }
    
    _results = tempResults;
    
    if (_modelUpdated) {
        
        _modelUpdated(self);
    }
    
}


@end
