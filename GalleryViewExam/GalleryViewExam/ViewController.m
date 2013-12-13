//
//  ViewController.m
//  GalleryViewExam
//
//  Created by 이종운 on 13. 8. 26..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#define kCellIDPad @"CollectionViewCellPad"
#define kCellIDPhone @"CollectionViewCellPhone"


#import "ViewController.h"
#import "LUIGalleryViewController.h"

@interface ViewController ()
@property (nonatomic,strong) LUIGalleryViewController *galleryViewController;

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation ViewController
@synthesize galleryViewController;
@synthesize data;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
    
    //make Data
    data = [[NSMutableArray alloc]init];
    for (int i = 1; i<21; i++) {
        
        NSString *imageName;
        
        if (i<10) {
            imageName = [NSString stringWithFormat:@"e00%d.jpg",i];
        }else{
            imageName = [NSString stringWithFormat:@"e0%d.jpg",i];
        }
        [data addObject:imageName];
    }
    
    
    galleryViewController = [[LUIGalleryViewController alloc]init];
    galleryViewController.view.frame = self.view.frame;
    galleryViewController.view.backgroundColor = [UIColor yellowColor];
    galleryViewController.dataSource = data;
    [self.view addSubview:galleryViewController.view];


    
}








@end










