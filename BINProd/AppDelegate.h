//
//  AppDelegate.h
//  BINProd
//
//  Created by Aravind Soundararajan on 27/07/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AFNetworking.h"
#import "DataHandler.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) DataHandler *dataHandler;

@end

