#import "QuestionCell.h"
#import "BorderedTextView.h"

static int __padding = 15;
static int __labelWidth = 550;
static int __editBoxHeight = 90;

@interface QuestionCell ()

@property (nonatomic) BorderedTextView* notesView;

+ (CGFloat) notesTopFor:(Question*) question;
+ (CGFloat) notesHeightFor:(Question*) question;

@end

@implementation QuestionCell

//@synthesize isExpanded = _isExpanded;
@synthesize question = _question;
@synthesize notesView = _notesView;

- (BorderedTextView *)notesView {
    if (!_notesView) {
        _notesView = [BorderedTextView new];
        _notesView.text = @"Your notes...";
        [self addSubview:_notesView];
    }
    return _notesView;
}

- (void) setQuestion:(Question *)question {
    _question = question;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    self.notesView.alpha = _question.hasNotes;
    [UIView commitAnimations];    
    
    self.notesView.frame = CGRectMake(__padding, [QuestionCell notesTopFor:question],
                                      __labelWidth, __editBoxHeight);
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    UIFont* labelFont = [UIFont systemFontOfSize:17.0f];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat black[4] = { 0, 0, 0, 1 };
    CGContextSetFillColor(context, black);
    
    [_question.text drawInRect:CGRectMake(15, 15, __labelWidth, 9999) withFont:labelFont];
}

+ (CGFloat)notesTopFor:(Question *)question {
    UIFont* labelFont = [UIFont systemFontOfSize:17.0f];
    
    CGSize labelBounds = CGSizeMake(__labelWidth, 9999);
    
    CGSize actualTextSize = [question.text
                             sizeWithFont:labelFont
                             constrainedToSize:labelBounds
                             lineBreakMode:UILineBreakModeWordWrap];
    
    return 2 * __padding + actualTextSize.height;
}

+ (CGFloat)notesHeightFor:(Question *)question {
    return (__editBoxHeight + __padding) * question.hasNotes;
}

+ (CGFloat)heightRequiredBy:(Question *)question {    
    return [self notesTopFor:question] + [self notesHeightFor:question];
}

@end
