//
//  GallryViewController.m
//  GalleryViewExam
//
//  Created by 이종운 on 13. 8. 27..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#import "GallryViewController.h"
#import "DataSource.h"


@implementation GallryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setDataSource:[self data]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark View lifecycle

- (DataSource *)data
{
    if (data) {
        return data;
    }
    
    data = [[DataSource alloc] init];
    return data;
}



@end
