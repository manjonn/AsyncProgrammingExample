//
//  ViewController.m
//  NSOperationsExample
//
//  Created by Manjula Jonnalagadda on 7/23/15.
//  Copyright (c) 2015 Manjula Jonnalagadda. All rights reserved.
//

#import "ViewController.h"
#import "FactorialOperation.h"

@interface ViewController ()<FactorialOperationDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self executeOperation];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSInteger factorial=1;
        for (int i=1; i<=10; i++) {
            factorial =factorial*i;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.label.text=[NSString stringWithFormat:@"%ld",factorial];
           
        });
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)executeOperation{
    FactorialOperation *operation=[[FactorialOperation alloc]initWithInt:10];
    operation.delegate=self;
    NSOperationQueue *queue=[NSOperationQueue new];
    queue.maxConcurrentOperationCount=5;
    [queue addOperation:operation];
}

-(void)factorialIs:(NSInteger)integer{
    self.label.text=[NSString stringWithFormat:@"%ld",integer];
}

@end
