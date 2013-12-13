//
//  LUIGalleryViewController.h
//  GalleryViewExam
//
//  Created by Lui on 2013. 12. 13..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LUIGalleryViewCell.h"

@interface LUIGalleryViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end
