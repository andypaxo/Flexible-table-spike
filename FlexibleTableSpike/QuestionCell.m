//
//  QuestionCell.m
//  FlexibleTableSpike
//
//  Created by Andrew Palmowski on 12-03-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionCell.h"
#import "BorderedTextView.h"

#define LABEL_TAG 30
#define EXPANDED_LABEL_TAG 10
#define TEXT_BOX_TAG 20

static int padding = 15;
static int labelWidth = 550;

@interface QuestionCell ()

@property (nonatomic) BorderedTextView* notesView;

@end

@implementation QuestionCell

//@synthesize isExpanded = _isExpanded;
@synthesize question = _question;
@synthesize notesView = _notesView;

- (BorderedTextView *)notesView {
    if (!_notesView) {
        _notesView = [BorderedTextView new];
        _notesView.text = @"Your notes...";
    }
    return _notesView;
}

- (void) setQuestion:(Question *)question {
    _question = question;
    ((UILabel*)[self viewWithTag:LABEL_TAG]).text = question.text;
    [self setNeedsDisplay];
}

//- (void)setIsExpanded:(BOOL)isExpanded {
//    _isExpanded = isExpanded;
//    
//    if (_question != nil) {
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:0.25];
//    }
//    
//    [self viewWithTag:EXPANDED_LABEL_TAG].alpha = isExpanded;
//    [self viewWithTag:TEXT_BOX_TAG].alpha = isExpanded;
//    
//    
//    if (_question != nil) {
//        [UIView commitAnimations];
//    }
//}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIFont* labelFont = [UIFont systemFontOfSize:17.0f];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat black[4] = { 0, 0, 0, 1 };
   
    CGContextSetFillColor(context, black);
    [_question.text drawInRect:CGRectMake(15, 15, labelWidth, 9999) withFont:labelFont];
}

+ (CGFloat)heightRequiredBy:(Question *)question {
    UIFont* labelFont = [UIFont systemFontOfSize:17.0f];
    
    CGSize labelBounds = CGSizeMake(labelWidth, 9999);
    
    CGSize actualTextSize = [question.text
                             sizeWithFont:labelFont
                             constrainedToSize:labelBounds
                             lineBreakMode:UILineBreakModeWordWrap];
    
//    NSLog(@"%dpx required for: %@", (int)actualTextSize.height, question.text);
    
    return
    padding
    + actualTextSize.height
    + padding;
}

@end
