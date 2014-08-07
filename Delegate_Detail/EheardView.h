//
//  EheardView.h
//  Delegate_Detail
//
//  Created by wuyutian on 14-6-20.
//  Copyright (c) 2014年 wuyutian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EheardView : UIView

@property (nonatomic , strong) UIScrollView *myScroll;


- (id)initWithFrame:(CGRect)frame ImagesList:(NSArray *)list;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end
