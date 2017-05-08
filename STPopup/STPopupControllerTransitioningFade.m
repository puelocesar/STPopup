//
//  STPopupControllerTransitioningFade.m
//  STPopup
//
//  Created by Kevin Lin on 18/8/16.
//  Copyright © 2016 Sth4Me. All rights reserved.
//

#import "STPopupControllerTransitioningFade.h"

@implementation STPopupControllerTransitioningFade

- (NSTimeInterval)popupControllerTransitionDuration:(STPopupControllerTransitioningContext *)context
{
    return context.action == STPopupControllerTransitioningActionPresent ? 0.25 : 0.2;
}

- (void)popupControllerAnimateTransition:(STPopupControllerTransitioningContext *)context completion:(void (^)())completion
{
    UIView *containerView = context.containerView;
    if (context.action == STPopupControllerTransitioningActionPresent) {
        containerView.alpha = 0;
        containerView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        [UIView animateWithDuration:[self popupControllerTransitionDuration:context] delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.9 options:UIViewAnimationOptionCurveEaseOut animations:^{
            containerView.alpha = 1;
            containerView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            completion();
        }];
    }
    else {
        [UIView animateWithDuration:[self popupControllerTransitionDuration:context] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            containerView.alpha = 0;
        } completion:^(BOOL finished) {
            containerView.alpha = 1;
            completion();
        }];
    }
}

@end
