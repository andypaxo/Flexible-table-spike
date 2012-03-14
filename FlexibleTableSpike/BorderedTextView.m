#import "BorderedTextView.h"

@implementation BorderedTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15.0f];
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(textChanged:)
         name:UITextViewTextDidChangeNotification
         object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification {
    [self setNeedsDisplay];
    // Hack to make text visible
    self.contentOffset = CGPointMake(0, 1);
    self.contentOffset = CGPointMake(0, 0);
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat gray[4] = { 0.5, 0.5, 0.5, 1 };
    CGContextSetStrokeColor(context, gray);
    CGContextSetFillColor(context, gray);
    
    CGContextStrokeRect(context, CGRectInset(self.bounds, .5, .5));
    
    if (self.text.length == 0) {
        CGContextSetFillColor(context, gray);
        [@"Your notes..." drawInRect:CGRectInset(self.bounds, 8, 8) withFont:[UIFont systemFontOfSize:15.0f]];
    }
    
    [super drawRect:rect];
}

@end
