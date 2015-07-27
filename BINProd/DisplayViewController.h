//
//  DisplayViewController.h
//  BINProd
//
//  Created by Aravind Soundararajan on 27/07/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DataHandler.h"



@interface DisplayViewController : UIViewController<DataHandlerDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong) NSString *bankIdentifierNumber;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andBINIdentifier:(NSString*)BINIdentifer;

@end
