#import "BorderedTextView.h"

@implementation BorderedTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15.0f];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat black[4] = { 0, 0, 0, 1 };
    CGContextSetFillColor(context, black);
    
    CGContextStrokeRect(context, [self bounds]);
}

@end
