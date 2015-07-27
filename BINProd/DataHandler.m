//
//  DataHandler.m
//  BINProd
//
//  Created by Aravind Soundararajan on 27/07/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "DataHandler.h"

@implementation DataHandler

@synthesize delegate;


-(NSMutableDictionary*)fetchData:(NSString*)URLEndpoint
{
    if (![AFNetworkReachabilityManager sharedManager].reachable) {
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh-Oh!" message:@"Looks like there might be a network drop. Please come back again to check." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    NSMutableDictionary __block *responseDictionary;
    
    NSString *string = URLEndpoint;
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving BIN details"
                                                            message:[error localizedDescription]
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        
       
        [alertView show];
    }];
    
    // 5
    [operation start];
    [operation waitUntilFinished];
    
    responseDictionary = (NSMutableDictionary*)operation.responseObject;
    NSLog(@"Response in Dictionary %@",responseDictionary);

    return responseDictionary;
   
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
     [self failedTransaction];
}

-(void)failedTransaction
{
    if([self delegate] && [[self delegate] respondsToSelector:@selector(failedTransaction)])
    {
        [[self delegate] failedTransaction];
    }
}

@end
