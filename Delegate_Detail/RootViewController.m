//
//  RootViewController.m
//  Delegate_Detail
//
//  Created by wuyutian on 14-6-20.
//  Copyright (c) 2014年 wuyutian. All rights reserved.
//

#import "RootViewController.h"
#import "EheardView.h"
#import "UIImageView+WebCache.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate,UIGestureRecognizerDelegate>{
    UIWebView *myWebView;
    UITableView *table ;
    UIView *view;
    UIScrollView *sc;
    CGFloat tableY;
}
@property (nonatomic ,strong) EheardView *headView;
@end


@implementation RootViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
}


- (void)viewDidLoad{
    [super viewDidLoad];
   
    UIScrollView *myScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    myScroll.contentSize = CGSizeMake(320,568 );
    myScroll.scrollEnabled = YES;
    myScroll.delegate = self;
    myScroll.backgroundColor = [UIColor brownColor];
   self.view = myScroll;
    
    
    EheardView *hard = [[EheardView alloc] initWithFrame:CGRectMake(0, 0, 320, 200) ImagesList:@[@"http://www.qiyestore.com/upload/494/product/0mlL6lU836.JPEG?v=1362043124000",@"http://www.qiyestore.com/upload/494/product/5163A8l280.JPEG?v=1362043124000",@"http://www.qiyestore.com/upload/494/product/7e9Z252ZB8.JPEG?v=1362043125000",@"http://www.qiyestore.com/upload/494/product/E88l9O5nRm.JPEG?v=1362043125000",@"http://www.qiyestore.com/upload/494/product/0469iDY01g.JPEG?v=1362043125000"]];
    self.headView = hard;
    [self.view addSubview:hard];
    
    
    self.title  =  @"test";
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 180, 320, 400) style:UITableViewStylePlain];
    tableY = 200.f;
    table.backgroundColor = [UIColor whiteColor];
    table.backgroundView = nil;
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
 
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = @"2321";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.userInteractionEnabled = YES;
        cell.selected = YES;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@"--%d",indexPath.row];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    float newConentOffSet = scrollView.contentOffset.y;
    float maxY = -(64 + newConentOffSet);
    
    NSLog(@"newContentoffset ====  %f",maxY);
   // if (newConentOffSet < -64.f) {
        table.frame = CGRectMake(table.frame.origin.x, table.frame.origin.y + maxY/20, CGRectGetWidth(table.frame), CGRectGetHeight(table.frame));
    //}
   /* else{
         table.frame = CGRectMake(table.frame.origin.x, table.frame.origin.y - 2, CGRectGetWidth(table.frame), CGRectGetHeight(table.frame));
        if (newConentOffSet>=64.f) {
            table.frame = CGRectMake(table.frame.origin.x, 180, CGRectGetWidth(table.frame), CGRectGetHeight(table.frame));
        }
       // table.frame = CGRectMake(table.frame.origin.x, 180, CGRectGetWidth(table.frame), CGRectGetHeight(table.frame));
    }
    else if (newConentOffSet >= -64.f){
    
                       
    }else{
        table.frame = CGRectMake(table.frame.origin.x, table.frame.origin.y - 2, CGRectGetWidth(table.frame), CGRectGetHeight(table.frame));
    }*/
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  
}




@end
