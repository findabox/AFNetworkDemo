//
//  URLSessionController.m
//  AFNetworkDemo
//
//  Created by ChenZS on 16/7/19.
//  Copyright © 2016年 findabox. All rights reserved.
//

#import "URLSessionController.h"

@interface URLSessionController ()

@property (nonatomic, readwrite, strong) NSURLRequest *request;

@end

@implementation URLSessionController

- (id)initWithRequest:(NSURLRequest *)request {
    if (self = [super init]) {
        _request = request;
    }
    return self;
}

- (void)start {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:self.request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *image = [UIImage imageWithData:data];
    }];
    [task resume];
}

@end
