program StringCopyAndMemory;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

// Format 함수가 이 유닛 안에 있음

const
  SAMPLE_TEXT = '반가워';

resourcestring
  Question1 =
    'SampleString2 := SampleString1 처럼 ' + sLineBreak +
    'String 변수를 또 다른 변수에 복사(할당)하면 어떻게 될까?' +  sLineBreak;
  Comment1 =
    '새 변수에는 기존 변수와 동일한 메모리 주소가 들어간다.' +  sLineBreak +
    '(String 타입은 실제 값이 Heap에 들어 가고, String 변수에는 ' +
    '실제 데이터가 자리잡은 Heap의 메모리 블록 주소만 담기기 때문이다)' +   sLineBreak +
    'String 변수를 다른 String 변수에 담는다고 해서 '+
    'Heap 안에서 데이터가 복사되어 메모리 블록이 하나 더 생기는 것이 아니다. ' +  sLineBreak +
    '그 대신, 해당 String 데이터가 담긴 실제 메모리(Heap) 블록은 참조 갯수 정보도 관리하고 있는데 ' +
    '이 값이 1만큼 증가한다 (더 이상 사용되지 않는 String은 참조 갯수가 0이 된다. 그러면 ' +
    '그 String은 메모리에서 자동으로 제거되고 반환된다)' + sLineBreak;
  Question2 =
    'SampleString2[1] := ''a'' 처럼 ' + sLineBreak +
    '같은 String을 가리키던 변수 중 하나가 String 값을 변경하면 어떻게 될까?' + sLineBreak;
  Comment2 =
    '변경 시점에 Heap에는 새 String 데이터를 담은 메모리 블록이 새로 생기고 ' +
    '변경된 String을 가리키는 String  변수에는 새 주소가 들어간다 ' +
    '(이때, 기존 메모리 블록에서는 참조 갯수가 1개 줄어든다).' + sLineBreak;
  Note2 =
    '참고: ''a''는 ''반가워'' 중  맨 앞 또는 그 뒤의 문자를 대체한다. ' +
    '이는 컴파일러 지시자 {$ZEROBASEDSTRINGS ON/OFF}에 따라 결정된다.'
    + sLineBreak;

var
  SampleString1, SampleString2, Summary : string;

// Heap의 주소와 참조 갯수을 파악===============================================
function MemoryInfo (const AStrIdentifier, AStr: string): string;
begin
  Result := AStrIdentifier + ' = ' + AStr + sLineBreak +
    Format('주소: %d | 참조 갯수: %d',
    [
    Integer(AStr),
    PInteger(Integer(AStr) - 8)^
    ]
    ) + sLineBreak;
end; //=========================================================================

procedure PrintResult;
begin
  WriteLn (MemoryInfo('SampleString1', SampleString1));
  WriteLn (MemoryInfo('SampleString2',SampleString2));
end;

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
  SampleString1 := SAMPLE_TEXT;     // String.Create(['반','가','워']);
  WriteLn (MemoryInfo('SampleString1', SampleString1));
  AskToGoNext;
  //----------------------------------------------------------------------------
  WriteLn(Question1);
  AskToGoNext;

  SampleString2 := SampleString1;

  PrintResult;
  WriteLn(Comment1);
  AskToGoNext;
  //----------------------------------------------------------------------------
  WriteLn(Question2);
  AskToGoNext;

  {$ZEROBASEDSTRINGS ON}
  SampleString2[1] := 'a';
  {$ZEROBASEDSTRINGS OFF}

  PrintResult;
  WriteLn(Comment2);
  WriteLn(Note2);
  //----------------------------------------------------------------------------
  AskToExit;
end.
