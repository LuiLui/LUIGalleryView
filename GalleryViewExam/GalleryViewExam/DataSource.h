//
//  DataSource.h
//  GalleryViewExam
//
//  Created by 이종운 on 13. 8. 27..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTPhotoBrowserDataSource.h"

@interface DataSource : NSObject<KTPhotoBrowserDataSource>
{
    NSArray *dataArray;
}
@end
