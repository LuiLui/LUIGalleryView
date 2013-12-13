//
//  GallryViewController.h
//  GalleryViewExam
//
//  Created by 이종운 on 13. 8. 27..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTThumbsViewController.h"

@class DataSource;

@interface GallryViewController : KTThumbsViewController
{
    DataSource *data;
}
@end
