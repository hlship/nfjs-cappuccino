/*
 * CalcController.j
 * app
 *
 * Created by Howard M. Lewis Ship on September 7, 2009.
 * Copyright 2009, TWD Consulting All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPTextField.j>
@import <AppKit/CPButton.j>

var
  OperationNone = 0,
  OperationAdd = 1,
  OperationSubtract = 2,
  OperationMultiply = 3,
  OperationDivide = 4;

@implementation CalcController : CPObject
{
  CPPanel _panel;
  CPView _contentView;
  CPTextField _display;  
  CPButton _dot;
  CPString _sign;
  
  float _accum;
  float _register;
  CPString _value; // Displayed
  
  int _operation;
}

- (id)init
{
    self = [super init];
  
    if (self)
    {
      _panel = [[CPPanel alloc] initWithContentRect:CGRectMake(20, 30, 184, 184)
                                   styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask];
      
      _contentView = [_panel contentView];

      [_panel setTitle:"Calculator"];
                                 

      _display = [CPTextField labelWithTitle:""];
      [_display setAlignment:CPRightTextAlignment];
      [_display setFrame:CGRectMake(1, 5, 183, 30)]
      [_display setBezeled:YES];

      [self add:_display];
  
      [self makeButton:"C" atX:0 y:0 action:@selector(clear:)];

      [self makeButton:"/" atX:3 y:0 action:@selector(div:)];
      [self makeButton:"*" atX:3 y:1 action:@selector(mult:)];
      [self makeButton:"-" atX:3 y:2 action:@selector(minus:)];
      [self makeButton:"+" atX:3 y:3 action:@selector(plus:)];

  
      [self makeDigit:7 atX:0 y:1];
      [self makeDigit:8 atX:1 y:1];
      [self makeDigit:9 atX:2 y:1];

      [self makeDigit:4 atX:0 y:2];
      [self makeDigit:5 atX:1 y:2];
      [self makeDigit:6 atX:2 y:2];

      [self makeDigit:1 atX:0 y:3];
      [self makeDigit:2 atX:1 y:3];
      [self makeDigit:3 atX:2 y:3];

      [[self makeDigit:0 atX:0 y:4] setFrameSize:CPSizeMake(85, 24)];
      _dot = [self makeButton:"." atX:2 y:4 action:@selector(dot:)];
      [[self makeButton:"=" atX:3 y:4 action:@selector(compute:)] setDefaultButton:YES];

      [self reset];
  }

  return self;
}

- (void)show
{
  [_panel orderFront:self];
}

- (void)reset
{
  _accum = 0;
  _register = 0;
  _sign = "";
  _value = "";
  _operation = OperationNone;
  
  [_dot setEnabled:YES];
  
  [_display setStringValue:"0"];
}

- (void)digit:(CPButton)source
{
  var digit = [source title];
  
  if (_value == "" && digit == "0") return;
  
  _value = _sign + _value + digit;
  _sign = "";
  
  [_display setStringValue:_value];
}

- (void)clear:(id)source
{
  [self reset];
}

- (void)mult:(id)source
{
  [self startOperation:OperationMultiply]; 
}

- (void)div:(id)source
{
  [self startOperation:OperationDivide];   
}

- (void)minus:(id)source
{
 if (_value == "") {
   _sign = "-";
   return;
 }
 
 [self startOperation:OperationSubtract];
}


- (void)plus:(id)source
{
  [self startOperation:OperationAdd];
}

- (void)dot:(id)source
{
  [_dot setEnabled:NO];
  
  if (_value == "")
    _value = "0.";
  else
   _value += ".";
  
  [_display setStringValue:_value];
}

- (void)compute:(id)source
{
  if (_operation == OperationNone) return;
  
  [self computeAndDisplay];  
  
  _operation = OperationNone;
}

- (void)startOperation:(int)operation
{
  [self computeAndDisplay];
  
  _operation = operation;
}

- (void)computeAndDisplay
{
  if (_value != "")
    _register = Number(_value);
  
  switch (_operation)
  {
    case OperationAdd:
      _accum += _register;
      break;
    case OperationSubtract:
      _accum -= _register;
      break;
    case OperationMultiply:
      _accum *= _register;
      break;  
    case OperationDivide:
      _accum /= _register;
      break;
    case OperationNone:
      _accum = _register;
      break;  
  }
  
  _value = "";
  [_dot setEnabled:YES];
  [_display setFloatValue:_accum];
}

- (void)add:(CPView)subview
{
  [_contentView addSubview:subview];
}

- (CPButton)makeButton:(id)value atX:(int)x y:(int)y action:(SEL)action
{
  var frame = CGRectMake(45 * x + 5, 30 * y + 35, 40, 24);
  var button = [[CPButton alloc] initWithFrame:frame];
    
  [button setTitle:value.toString()];
  
  [button setTarget:self];
  [button setAction:action];
    
  [self add:button];
  
  return button;
}

- (CPButton)makeDigit:(id)value atX:(int)x y:(int)y
{
  return [self makeButton:value atX:x y:y action:@selector(digit:)];
}

@end
