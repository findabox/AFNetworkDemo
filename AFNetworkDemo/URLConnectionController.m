//
//  URLConnectionController.m
//  AFNetworkDemo
//
//  Created by ChenZS on 16/7/19.
//  Copyright © 2016年 findabox. All rights reserved.
//

#import "URLConnectionController.h"

@interface URLConnectionController () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, readwrite, strong) NSURLRequest *request;

@end

@implementation URLConnectionController

- (id)initWithRequest:(NSURLRequest *)request {
    if (self = [super init]) {
        _request = request;
    }
    return self;
}

- (void)start {
    NSURLConnection *content = [[NSURLConnection alloc]initWithRequest:self.request delegate:self];
    [content start];
}

#pragma mark NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error; {
    
}
- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection; {
    return NO;
}
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge; {
    
}

#pragma mark NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response; {
    NSInteger size = response.expectedContentLength;
    NSLog(@"GET expectedContentLength: %ld", size);
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    if(httpResponse && [httpResponse respondsToSelector:@selector(allHeaderFields)]){
        
        NSDictionary *httpResponseHeaderFields = [httpResponse allHeaderFields];
        
        long mFileSize = [[httpResponseHeaderFields objectForKey:@"Content-Length"] longLongValue];
        NSLog(@"GET Content-Length: %ld", mFileSize);
        
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data; {
    UIImage *image = [UIImage imageWithData:data];
}

@end
