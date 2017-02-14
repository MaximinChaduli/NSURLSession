//
//  ViewController.m
//  NSURLSession
//
//  Created by Admin on 01/02/2017.
//  Copyright © 2017 Maximin Chaduli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: sessionConfiguration delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString: @"http://pageperso.univ-lr.fr/jamal.malki/lpirm-bdmob/upload/5a3f1-sample.jpg"]];
    
    _progressView.progress = 0;
    _url.text = @"http://pageperso.univ-lr.fr/jamal.malki/lpirm-bdmob/upload/5a3f1-sample.jpg";
    [downloadTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    dispatch_async(dispatch_get_main_queue(), ^{[self.imageView setImage:[UIImage imageWithData:data]];
       
        _savedLocation.text = location.absoluteString;
        
    });
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
    
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    float progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    NSLog(@"Progress : %f", progress);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        _bytesExpected.text = [NSString stringWithFormat:@"%lld", totalBytesExpectedToWrite];
        NSString *sBytesWritten = [NSString stringWithFormat:@"%lld", totalBytesWritten];
        int progression = progress * 100;
        _bytesWritten.text = [NSString stringWithFormat:@"%@%s%d%s",sBytesWritten, " (",progression, " %)"];
        _progressView.progress = progress;
        
    });
    
}

@end
