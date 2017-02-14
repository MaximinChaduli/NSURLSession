//
//  ViewController.h
//  NSURLSession
//
//  Created by Admin on 01/02/2017.
//  Copyright © 2017 Maximin Chaduli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *url;
@property (weak, nonatomic) IBOutlet UILabel *bytesExpected;
@property (weak, nonatomic) IBOutlet UILabel *bytesWritten;
@property (weak, nonatomic) IBOutlet UILabel *savedLocation;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

