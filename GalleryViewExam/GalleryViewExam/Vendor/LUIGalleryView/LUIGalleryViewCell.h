//
//  LUIGalleryViewCell.h
//  GalleryViewExam
//
//  Created by Lui on 2013. 12. 13..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LUIGalleryViewCell : UICollectionViewCell

@property (nonatomic, assign) CGFloat lscale;
@property (strong, nonatomic) IBOutlet UIImageView *cellImageView;


-(void)cellSettings;


@end
