//
//  DisplayViewController.m
//  BINProd
//
//  Created by Aravind Soundararajan on 27/07/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "DisplayViewController.h"
#import "DataHandler.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController

AppDelegate *appDelegate;
NSMutableDictionary *responseDictionary;
DataHandler *dataHandler;

@synthesize bankIdentifierNumber;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andBINIdentifier:(NSString*)BINIdentifer{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        bankIdentifierNumber = BINIdentifer;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    dataHandler = appDelegate.dataHandler;
    dataHandler.delegate = self;
    
    [self.activityIndicator startAnimating];
    
    dispatch_async(dispatch_queue_create("Loading Queue", NULL), ^{
        
        [self fetchData:[NSString stringWithFormat:@"http://www.binlist.net/json/%@",bankIdentifierNumber]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
             [self populateUserInterface];
        });
        
    });
    
    
    
}


-(void)fetchData:(NSString*)URLEndpoint
{
    
    responseDictionary = [dataHandler fetchData:URLEndpoint];
   
    
}
- (IBAction)didTapBack:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)populateUserInterface
{
    ((UITextField*)[self.view viewWithTag:8]).text = @"Thanks for your patient waiting";
    [self.activityIndicator stopAnimating];
    //Populating the values
    ((UITextField*)[self.view viewWithTag:1]).text = [responseDictionary objectForKey:@"bin"];
    ((UITextField*)[self.view viewWithTag:2]).text = [responseDictionary objectForKey:@"brand"];
    ((UITextField*)[self.view viewWithTag:3]).text = [responseDictionary objectForKey:@"country_code"];
    ((UITextField*)[self.view viewWithTag:4]).text = [responseDictionary objectForKey:@"country_name"];
    ((UITextField*)[self.view viewWithTag:5]).text = [responseDictionary objectForKey:@"bank"];
    ((UITextField*)[self.view viewWithTag:6]).text = [NSString stringWithFormat:@"%@ %@",[responseDictionary objectForKey:@"latitude"],[responseDictionary objectForKey:@"longitude"]];
    ((UITextField*)[self.view viewWithTag:7]).text = [responseDictionary objectForKey:@"query_time"];
}

-(void)failedTransaction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
