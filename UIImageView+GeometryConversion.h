//
//  UIImageView+GeometryConversion.h
//
//  Created by Dominique d'Argent on 18.04.12.
//  Copyright (c) 2012. All rights reserved.
//
//  Thomas Sarlandie - 2012:
//  - Added convertPointFromView:viewPoint
//  - Added convertRectFromView:viewPoint
//
//  Contribution released in the public domain.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIImageView (GeometryConversion)

- (CGPoint)convertPointFromImage:(CGPoint)imagePoint;
- (CGRect)convertRectFromImage:(CGRect)imageRect;

- (CGPoint)convertPointFromView:(CGPoint)viewPoint;
- (CGRect)convertRectFromView:(CGRect)viewRect;

@end
