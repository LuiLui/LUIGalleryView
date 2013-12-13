//
//  LUIGalleryViewCell.m
//  GalleryViewExam
//
//  Created by Lui on 2013. 12. 13..
//  Copyright (c) 2013년 Lui. All rights reserved.
//

#define MIN_SCALE 0.5
#define MAX_SCALE 2


#import "LUIGalleryViewCell.h"

@implementation LUIGalleryViewCell
@synthesize cellImageView;
@synthesize lscale;



#pragma mark Cell Settings
-(void)cellSettings{
    // Initialization code
    self.lscale = 1.0;
    
    //Pinch
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(didReceivePinchGesture:)];
    [self addGestureRecognizer:pinchGesture];

    //Pan
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didReceivePadGesture:)];
    [self addGestureRecognizer:panGesture];
    
    self.userInteractionEnabled = YES;
    cellImageView.contentMode = UIViewContentModeScaleAspectFit;
}



#pragma mark Gesture Action
- (void)didReceivePinchGesture:(UIPinchGestureRecognizer*)gesture{

    //START
    if (gesture.state == UIGestureRecognizerStateBegan) {
        gesture.scale = cellImageView.transform.a;
    }
    
    float scale;
    
    if (gesture.scale < MIN_SCALE) {
        scale = MIN_SCALE - (MIN_SCALE - gesture.scale)/4;
    }else if (gesture.scale > MAX_SCALE) {
        scale = MAX_SCALE - (MAX_SCALE - gesture.scale)/4;
    }else {
        scale = gesture.scale;
    }
    
    cellImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //END
    if (gesture.state == UIGestureRecognizerStateEnded) {
        if (gesture.scale < MIN_SCALE) {
            scale = MIN_SCALE;
        }
        
        if (gesture.scale > MAX_SCALE) {
            scale = MAX_SCALE;
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            cellImageView.transform = CGAffineTransformMakeScale(scale, scale);
        }];
}
}

//    if (gesture.state == UIGestureRecognizerStateBegan){
//        NSLog(@"시작");
//        scale = 1.0;
//
//    }else if (gesture.state == UIGestureRecognizerStateChanged){
//
//        scale = gesture.scale;
//
//        if (scale<0.5) {
//            self.userInteractionEnabled = NO;
//            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                cellImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//            } completion:^(BOOL finished) {
//                self.userInteractionEnabled = YES;
//            }];
//        }else if (scale >= 0.5 && scale < 2){
//            cellImageView.frame = CGRectMake(cellImageView.frame.origin.x, cellImageView.frame.origin.y, cellImageView.frame.size.width*scale, cellImageView.frame.size.height*scale);
//            cellImageView.center = self.center;
//
//        }else{
//
//        }
//
//
//        //self.cellImageView.scale = scaleStart * gesture.scale;
//
//    }else if (gesture.state == UIGestureRecognizerStateEnded){
//
//        scale = gesture.scale;
//
//        if (scale < 1) {
//            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                cellImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//            } completion:^(BOOL finished) {
//            }];
//        }
//    }


- (void)didReceivePadGesture:(UIPanGestureRecognizer*)gesture{
    
}


@end



























