//
//  UIImageView+GeometryConversion.m
//
//  Created by Dominique d'Argent on 18.04.12.
//  Copyright (c) 2012. All rights reserved.
//

#import "UIImageView+GeometryConversion.h"

@implementation UIImageView (GeometryConversion)

- (CGPoint)convertPointFromImage:(CGPoint)imagePoint {
    CGPoint viewPoint = imagePoint;
    
    CGSize imageSize = self.image.size;
    CGSize viewSize  = self.bounds.size;
    
    CGFloat ratioX = viewSize.width / imageSize.width;
    CGFloat ratioY = viewSize.height / imageSize.height;
    
    UIViewContentMode contentMode = self.contentMode;
    
    switch (contentMode) {
        case UIViewContentModeScaleToFill:
        case UIViewContentModeRedraw:
        {
            viewPoint.x *= ratioX;
            viewPoint.y *= ratioY;
            break;
        }
            
        case UIViewContentModeScaleAspectFit:
        case UIViewContentModeScaleAspectFill:
        {
            CGFloat scale;
            
            if (contentMode == UIViewContentModeScaleAspectFit) {
                scale = MIN(ratioX, ratioY);
            }
            else /*if (contentMode == UIViewContentModeScaleAspectFill)*/ {
                scale = MAX(ratioX, ratioY);
            }
            
            viewPoint.x *= scale;
            viewPoint.y *= scale;
            
            viewPoint.x += (viewSize.width  - imageSize.width  * scale) / 2.0f;
            viewPoint.y += (viewSize.height - imageSize.height * scale) / 2.0f;
            
            break;
        }
            
        case UIViewContentModeCenter:
        {
            viewPoint.x += viewSize.width / 2.0  - imageSize.width  / 2.0f;
            viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0f;
            
            break;
        }
            
        case UIViewContentModeTop:
        {
            viewPoint.x += viewSize.width / 2.0 - imageSize.width / 2.0f;
            
            break;
        }
            
        case UIViewContentModeBottom:
        {
            viewPoint.x += viewSize.width / 2.0 - imageSize.width / 2.0f;
            viewPoint.y += viewSize.height - imageSize.height;
            
            break;
        }
            
        case UIViewContentModeLeft:
        {
            viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0f;
            
            break;
        }
            
        case UIViewContentModeRight:
        {
            viewPoint.x += viewSize.width - imageSize.width;
            viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0f;
            
            break;
        }
            
        case UIViewContentModeTopRight:
        {
            viewPoint.x += viewSize.width - imageSize.width;
            
            break;
        }
            
            
        case UIViewContentModeBottomLeft:
        {
            viewPoint.y += viewSize.height - imageSize.height;
            
            break;
        }
            
            
        case UIViewContentModeBottomRight:
        {
            viewPoint.x += viewSize.width  - imageSize.width;
            viewPoint.y += viewSize.height - imageSize.height;
            
            break;
        }
            
        case UIViewContentModeTopLeft:
        default:
        {
            break;
        }
    }
    
    return viewPoint;
}

- (CGRect)convertRectFromImage:(CGRect)imageRect {
    CGPoint imageTopLeft     = imageRect.origin;
    CGPoint imageBottomRight = CGPointMake(CGRectGetMaxX(imageRect),
                                          CGRectGetMaxY(imageRect));
    
    CGPoint viewTopLeft     = [self convertPointFromImage:imageTopLeft];
    CGPoint viewBottomRight = [self convertPointFromImage:imageBottomRight];
    
    CGRect viewRect;
    viewRect.origin = viewTopLeft;
    viewRect.size   = CGSizeMake(ABS(viewBottomRight.x - viewTopLeft.x),
                                 ABS(viewBottomRight.y - viewTopLeft.y));
    
    return viewRect;
}

@end
