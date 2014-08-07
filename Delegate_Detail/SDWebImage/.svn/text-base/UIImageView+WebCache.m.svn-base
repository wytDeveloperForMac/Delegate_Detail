/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+WebCache.h"

@implementation UIImageView (WebCache)

- (void)setImageWithURL:(NSURL *)url
{
    if(![self viewWithTag:2012]){
        UIActivityIndicatorView *indicator  = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((self.frame.size.width-25)/2, (self.frame.size.height-25)/2, 25, 25)];
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        indicator.tag = 2012;
        [self addSubview:indicator];
        [indicator release];
        
        [indicator startAnimating];
    }
    else
    {
        UIActivityIndicatorView *indicator = (UIActivityIndicatorView*)[self viewWithTag:2012];
        if([indicator respondsToSelector:@selector(startAnimating)]){
            [indicator startAnimating];
        }
    }
    [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self setImageWithURL:url placeholderImage:placeholder options:0];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];

    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];

    self.image = placeholder;

    if (url)
    {
        [manager downloadWithURL:url delegate:self options:options];
    }
}

- (void)cancelCurrentImageLoad
{
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView*)[self viewWithTag:2012];
    if([indicator respondsToSelector:@selector(stopAnimating)]){
        [indicator stopAnimating];
    }
    
    [[SDWebImageManager sharedManager] cancelForDelegate:self];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    self.image = image;
    
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView*)[self viewWithTag:2012];
    if([indicator respondsToSelector:@selector(stopAnimating)]){
        [indicator stopAnimating];
    }
}

@end
