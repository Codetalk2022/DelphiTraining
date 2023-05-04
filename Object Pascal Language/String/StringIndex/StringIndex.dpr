program StringIndex;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils; // TStringHelper.Chars 프로퍼티가 이 유닛 안에 있음

const
  SAMPLE_TEXT = '반가워';

resourcestring
  Condition =
    'S1 := ''반가워''; 인 경우 ';
  Question1 =
    'S1.Chars[1]의 값은?' + sLineBreak;
  Comment1 =
    '델파이에는 각종 Helper 들이 잘 되어 있는데,' + sLineBreak +
    'Chars[] 프로퍼티는 델파이에 들어 있는 String용 Helper 중 하나이다.' + sLineBreak +
    '(읽기 전용 프로퍼티 이며, Syatem.SysUtil 유닛 안에 있음)' + sLineBreak +
    '델파이의 String용 Helper는 "모두 일관성있게 무조건" Index가 0부터 시작한다.' + sLineBreak +
    '따라서 Index가 1이면 앞에서 두번째 문자를 가리킨다.' + sLineBreak +
    '(이처럼, Helper를 사용하면 문자열을 "일관성 있게" 다룰 수 있어서 좋다)' + sLineBreak;
  Question2 =
    'S1[1]의 값은?' + sLineBreak;
  Comment2 =
    '(String 안에서 특정 위치에 있는 문자를 다루는 Helper인 Chars[]를 사용하는 대신)' + sLineBreak +
    '전통적인 방식, 즉 String 변수 바로 뒤에 [Index]를 붙여도 특정 위치에 있는 문자를 가리킬 수 있다.' + sLineBreak +
    '단, 이 방식은, Index가 1일 때 가리키는 문자가 문자열에서 첫번째 문자일 수도 있고, 두번째 문자일 수도 있다.' + sLineBreak +
    '그 기준은 컴파일러 설정을 어떻게 해 놓았는가를 따른다.' + sLineBreak +
    '해당 컴파일러 지시자는 {$ZEROBASEDSTRINGS ON/OFF} 이다.' + sLineBreak +
    '(델파이는 String 인덱스가 전통적으로 1부터 시작한다.' + sLineBreak +
    '이를 기준으로 작성한 코드를 계속 사용하려면 이 옵션을 OFF로 지정하도록 한다.' + sLineBreak +
    '그렇지 않고, 문자열의 인덱스가 0부터 시작하게 하려면 이 옵션을 ON으로 지정한다.' + sLineBreak +
    '2023년 5월 현재 델파이 컴파일러의 기본 설정은 {$ZEROBASEDSTRINGS OFF}이다)'+ sLineBreak;

procedure PrintLineSeparator;
begin
  WriteLn ('---------------------------');
end;

procedure AskToGoNext;
begin
  WriteLn ('***** 계속 진행하려면 [ENTER]키를 누르세요');
  PrintLineSeparator;
  ReadLn;
end;

procedure AskToExit;
begin
  WriteLn ('***** 모두 진행했습니다. 창을 닫으려면,  [ENTER]키를 누르세요');
  ReadLn;
end;

begin
  var S1 := SAMPLE_TEXT;
  //----------------------------------------------------------------------------
  WriteLn(Condition + Question1);
  AskToGoNext;

  Write(Condition + Question1);
  WriteLn(s1.Chars[1]);
  WriteLn;

  WriteLn('[해설]' + sLineBreak + Comment1);
  AskToGoNext;
  //----------------------------------------------------------------------------
  WriteLn(Condition + Question2);
  AskToGoNext;

  WriteLn;

  {$ZEROBASEDSTRINGS OFF}
  Write('{$ZEROBASEDSTRINGS OFF}로 설정하면, ' + Condition + Question2);
  WriteLn(s1[1]);

  {$ZEROBASEDSTRINGS ON}
  Write('{$ZEROBASEDSTRINGS ON}로 설정하면, ' + Condition + Question2);
  WriteLn(s1[1]);
  {$ZEROBASEDSTRINGS OFF}  // 델파이 default 설정과 동일하도록 되돌려 놓자.
  WriteLn;

  WriteLn('[해설]' + sLineBreak + Comment2);
  //----------------------------------------------------------------------------
  AskToExit;
end.
