//
//  DataSource.m
//  GalleryViewExam
//
//  Created by 이종운 on 13. 8. 27..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#import "DataSource.h"

#define FULL_SIZE_INDEX 0
#define THUMBNAIL_INDEX 1

@implementation DataSource

- (id)init {
    self = [super init];
    if (self) {
        // Create a 2-dimensional array. First element of
        // the sub-array is the full size image URL and
        // the second element is the thumbnail URL.
       
        NSMutableArray *imageNameArray = [[NSMutableArray alloc]init];
        for (int i = 1; i<26; i++) {
            if (i<10) {
                [imageNameArray addObject:[NSString stringWithFormat:@"Food-%d.png",i]];
            }
        }
        dataArray = [[NSArray alloc]initWithArray:imageNameArray];
    }
    return self;
}

- (UIImage *)imageWithURLString:(NSString *)string {
    NSURL *url = [NSURL URLWithString:string];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

- (UIImage *)imageString:(NSString *)string {
    
    UIImage *image = [UIImage imageNamed:string];
    return image;
}

#pragma mark -
#pragma mark KTPhotoBrowserDataSource

- (NSInteger)numberOfPhotos {
    NSInteger count = [dataArray count];
    return count;
}

- (UIImage *)imageAtIndex:(NSInteger)index {
    NSArray *imageUrls = [dataArray objectAtIndex:index];
    NSString *url = [imageUrls objectAtIndex:FULL_SIZE_INDEX];
    
    return [self imageString:url];
}

- (UIImage *)thumbImageAtIndex:(NSInteger)index {
    NSArray *imageUrls = [dataArray objectAtIndex:index];
    NSString *url = [imageUrls objectAtIndex:THUMBNAIL_INDEX];
    
    return [self imageString:url];
}


@end
