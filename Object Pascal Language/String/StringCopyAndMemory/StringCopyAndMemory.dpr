program StringCopyAndMemory;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

// Format �Լ��� �� ���� �ȿ� ����

const
  SAMPLE_TEXT = '�ݰ���';

resourcestring
  Question1 =
    'S2 := S1 ó�� ' + sLineBreak +
    'String ������ �� �ٸ� ������ ����(�Ҵ�)�ϸ� ��� �ɱ�?' +  sLineBreak;
  Comment1 =
    '�� �������� ���� ������ ������ �޸� �ּҰ� ����.' +  sLineBreak +
    '(String Ÿ���� ���� ���� Heap�� ��� ����, String �������� ' +
    '���� �����Ͱ� �ڸ����� Heap�� �޸� ��� �ּҸ� ���� �����̴�)' +   sLineBreak +
    'String ������ �ٸ� String ������ ��´ٰ� �ؼ� '+
    'Heap �ȿ��� �����Ͱ� ����Ǿ� �޸� ����� �ϳ� �� ����� ���� �ƴϴ�. ' +  sLineBreak +
    '�� ���, �ش� String �����Ͱ� ��� ���� �޸�(Heap) ����� ���� ���� ������ �����ϰ� �ִµ� ' +
    '�� ���� 1��ŭ �����Ѵ� (�� �̻� ������ �ʴ� String�� ���� ������ 0�� �ȴ�. �׷��� ' +
    '�� String�� �޸𸮿��� �ڵ����� ���ŵǰ� ��ȯ�ȴ�)' + sLineBreak;
  Question2 =
    'S2[1] := ''a'' ó�� ' + sLineBreak +
    '���� String�� ����Ű�� ���� �� �ϳ��� String ���� �����ϸ� ��� �ɱ�?' + sLineBreak;
  Comment2 =
    '���� ������ Heap���� �� String �����͸� ���� �޸� ����� ���� ����� ' +
    '����� String�� ����Ű�� String  �������� �� �ּҰ� ���� ' +
    '(�̶�, ���� �޸� ��Ͽ����� ���� ������ 1�� �پ���).' + sLineBreak;
  Note2 =
    '����: ''a''�� ''�ݰ���'' ��  �� �� �Ǵ� �� ���� ���ڸ� ��ü�Ѵ�. ' +
    '�̴� �����Ϸ� ������ {$ZEROBASEDSTRINGS ON/OFF}�� ���� �����ȴ�.'
    + sLineBreak;

var
  S1, S2, Summary : string;

// Heap�� �ּҿ� ���� ������ �ľ�===============================================
function MemoryInfo (const AStrIdentifier, AStr: string): string;
begin
  Result := AStrIdentifier + ' = ' + AStr + sLineBreak +
    Format('�ּ�: %d | ���� ����: %d',
    [
    Integer(AStr),
    PInteger(Integer(AStr) - 8)^
    ]
    ) + sLineBreak;
end; //=========================================================================

procedure PrintResult;
begin
  WriteLn (MemoryInfo('S1', S1));
  WriteLn (MemoryInfo('S2',S2));
end;

procedure PrintLineSeparator;
begin
  WriteLn ('---------------------------');
end;

procedure AskToGoNext;
begin
  WriteLn ('***** ��� �����Ϸ��� [ENTER]Ű�� ��������');
  PrintLineSeparator;
  ReadLn;
end;

procedure AskToExit;
begin
  WriteLn ('***** ��� �����߽��ϴ�. â�� ��������,  [ENTER]Ű�� ��������');
  ReadLn;
end;

begin
  S1 := SAMPLE_TEXT;     // String.Create(['��','��','��']);
  WriteLn (MemoryInfo('S1', S1));
  AskToGoNext;
  //----------------------------------------------------------------------------
  WriteLn(Question1);
  AskToGoNext;

  S2 := S1;

  PrintResult;
  WriteLn(Comment1);
  AskToGoNext;
  //----------------------------------------------------------------------------
  WriteLn(Question2);
  AskToGoNext;

  {$ZEROBASEDSTRINGS ON}
  S2[1] := 'a';
  {$ZEROBASEDSTRINGS OFF}

  PrintResult;
  WriteLn(Comment2);
  WriteLn(Note2);
  //----------------------------------------------------------------------------
  AskToExit;
end.
