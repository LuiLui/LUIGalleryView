//
//  LUIGalleryViewController.m
//  GalleryViewExam
//
//  Created by Lui on 2013. 12. 13..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#define kCellIDPad @"CollectionViewCellPad"
#define kCellIDPhone @"CollectionViewCellPhone"


#import "LUIGalleryViewController.h"


@interface LUIGalleryViewController ()

@property (nonatomic, strong) UICollectionView *galleryView;
@property (nonatomic,assign) CGFloat scale;

@end


@implementation LUIGalleryViewController
@synthesize dataSource;
@synthesize galleryView;
@synthesize scale;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    //galleryView
    //layout
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    galleryView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    galleryView.pagingEnabled = YES;
    galleryView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:galleryView];
    
    
    //Setting CollectionView Cell
    //iPhone
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        UINib* nib = [UINib nibWithNibName:@"LUIGalleryViewCellPhone" bundle:nil];
        [self.galleryView registerNib:nib forCellWithReuseIdentifier:kCellIDPhone];
    //iPad
    }else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        UINib* nib = [UINib nibWithNibName:@"LUIGalleryViewCellPad" bundle:nil];
        [self.galleryView registerNib:nib forCellWithReuseIdentifier:kCellIDPad];
    }
    galleryView.delegate = self;
    galleryView.dataSource = self;
    
    
//    //제스쳐
//    self.scale = 1.0;
//    UIPinchGestureRecognizer *gesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(didReceivePinchGesture:)];
//    [self.galleryView addGestureRecognizer:gesture];
    
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}









#pragma mark View Settings
//초기 1번만 실행..
-(void)viewSetting{
    
}

//로테이션되었을때 상태변경 (Fream)
-(void)viewRotateSetting{
    
}










#pragma mark UICollectionViewDataSource
//Section Count
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//Section Item Count
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dataSource.count;
}

//return Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LUIGalleryViewCell *cell;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        cell = (LUIGalleryViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kCellIDPhone forIndexPath:indexPath];
    }else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        cell = (LUIGalleryViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kCellIDPad forIndexPath:indexPath];
    }
    
    cell.frame  = CGRectMake(collectionView.frame.size.width*indexPath.row, 0, collectionView.frame.size.width, collectionView.frame.size.height);
    cell.cellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[dataSource objectAtIndex:indexPath.row]]];
    [cell cellSettings];
    
	return cell;
}







#pragma mark UICollectionViewLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return collectionView.frame.size;
}


//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(50, 50);
//}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    
//}




@end

















