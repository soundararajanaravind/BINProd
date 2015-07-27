//
//  DataHandler.h
//  BINProd
//
//  Created by Aravind Soundararajan on 27/07/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


@protocol DataHandlerDelegate <NSObject>

@required

-(void)failedTransaction;

@end


@interface DataHandler : NSObject <UIAlertViewDelegate>

@property __weak id<DataHandlerDelegate> delegate;

-(NSMutableDictionary*)fetchData:(NSString*)URLEndpoint;



@end
