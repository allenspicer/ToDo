//
//  DetailViewController.m
//  ToDo
//
//  Created by Allen Spicer on 5/3/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailTextField.text = [[self.detailItem valueForKey:@"timeStamp"] description];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancelButtonTapped:(UIButton*)sender{

//just perform action that configure view does - reload from saved version
self.detailTextField.text = [[self.detailItem valueForKey:@"timeStamp"] description];
}

-(IBAction)saveButtonTapped:(UIButton*)sender{
//push info in text field to our "context"
    NSString * dateString = self.detailTextField.text;
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    NSDate * newDate = [formatter dateFromString:dateString];
 [self.detailItem setValue:newDate forKey:@"timeStamp"];
    self.saveButton.enabled = NO;
    self.cancelButton.enabled = NO;
    
    [self.masterVC detailChangedObject];
    
}

@end
