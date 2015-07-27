//
//  ViewController.m
//  BINProd
//
//  Created by Aravind Soundararajan on 27/07/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize inputTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    inputTextField.delegate = self;
    self.navigationController.navigationBarHidden = YES;
    inputTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)]];
    
    
}

- (BOOL) textField: (UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString: (NSString *)string {
    //return yes or no after comparing the characters
    
    // allow backspace
    if (!string.length)
    {
        return YES;
    }
    
    if (theTextField.text.length > 6 ) {
        return NO;
    }
    
    
    // allow digit 0 to 9
    if ([string intValue]>=0)
    {
        return YES;
    }
    
    return NO;
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField) {
        
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (IBAction)didSubmit:(id)sender {
    
    DisplayViewController *displayViewController = [[DisplayViewController alloc] initWithNibName:@"DisplayViewController" bundle:nil andBINIdentifier:inputTextField.text];
    
    
    [self.navigationController pushViewController:displayViewController animated:YES];
    
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
