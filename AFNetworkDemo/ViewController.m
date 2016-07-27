//
//  ViewController.m
//  AFNetworkDemo
//
//  Created by ChenZS on 16/6/1.
//  Copyright © 2016年 findabox. All rights reserved.
//

#import "ViewController.h"
#import "URLConnectionController.h"
#import "URLSessionController.h"
#import "AFNetWorking.h"
#import <UIImageView+AFNetworking.h>

@interface ViewController ()
@property (strong) NSURL *webURL;
@property (strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url = @"http://img.ipc.me/uploads/post/17031/thumb/140x100.jpg";
    self.webURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.webURL
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                         timeoutInterval:30];
    URLConnectionController  *connectionController = [[URLConnectionController alloc]initWithRequest:request];
    [connectionController start];
    
    URLSessionController *sessionController = [[URLSessionController alloc]initWithRequest:request];
    [sessionController start];
    
    [self startAFWithRequest:request];
}

- (void)startAFWithRequest:(NSURLRequest *)request {
    self.imageView = [[UIImageView alloc]init];
    [self.imageView setImageWithURLRequest:request
                placeholderImage:nil
                         success:^(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image) {
                             NSLog(@"success");
                         }
                         failure:^(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error) {
                             NSLog(@"failure");
                         }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
