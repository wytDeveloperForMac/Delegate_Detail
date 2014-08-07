//
//  EheardView.m
//  Delegate_Detail
//
//  Created by wuyutian on 14-6-20.
//  Copyright (c) 2014年 wuyutian. All rights reserved.
//

#import "EheardView.h"
#import "UIImageView+WebCache.h"

@implementation EheardView


- (id)initWithFrame:(CGRect)frame ImagesList:(NSArray *)list{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        UIScrollView *imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(frame.origin.x, -20, frame.size.width, frame.size.height+20)];
        self.myScroll = imageScrollView;
        self.myScroll.showsHorizontalScrollIndicator = NO;
        self.myScroll.tag = 6666;
        self.myScroll.backgroundColor = [UIColor redColor];
        [self addSubview:self.myScroll];
        [self.myScroll setContentSize:CGSizeMake(frame.size.width * list.count, 30)];
        self.myScroll.pagingEnabled = YES;
        
        
        for (int i = 0; i < list.count; i++) {
            UIImageView *bigImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*i, 0, frame.size.width, imageScrollView.frame.size.height)];
            [bigImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [list objectAtIndex:i]]] placeholderImage:nil];
            bigImageView.userInteractionEnabled = YES;
            bigImageView.contentMode = UIViewContentModeScaleAspectFill;
            [self.myScroll addSubview:bigImageView];
        }
        
    }
    return self;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    float newConentOffSet = scrollView.contentOffset.y;
  //  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - newConentOffSet, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

@end
