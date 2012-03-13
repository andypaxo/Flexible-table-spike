//
//  QuestionCell.h
//  FlexibleTableSpike
//
//  Created by Andrew Palmowski on 12-03-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface QuestionCell : UITableViewCell

//@property (nonatomic) BOOL isExpanded;
@property (nonatomic) Question* question;

+ (CGFloat) heightRequiredBy: (Question*) question;

@end
