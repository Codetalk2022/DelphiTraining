program StringIndex;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils; // TStringHelper.Chars ������Ƽ�� �� ���� �ȿ� ����

const
  SAMPLE_TEXT = '�ݰ���';

resourcestring
  Condition =
    'S1 := ''�ݰ���''; �� ��� ';
  Question1 =
    'S1.Chars[1]�� ����?' + sLineBreak;
  Comment1 =
    '�����̿��� ���� Helper ���� �� �Ǿ� �ִµ�,' + sLineBreak +
    'Chars[] ������Ƽ�� �����̿� ��� �ִ� String�� Helper �� �ϳ��̴�.' + sLineBreak +
    '(�б� ���� ������Ƽ �̸�, Syatem.SysUtil ���� �ȿ� ����)' + sLineBreak +
    '�������� String�� Helper�� "��� �ϰ����ְ� ������" Index�� 0���� �����Ѵ�.' + sLineBreak +
    '���� Index�� 1�̸� �տ��� �ι�° ���ڸ� ����Ų��.' + sLineBreak +
    '(��ó��, Helper�� ����ϸ� ���ڿ��� "�ϰ��� �ְ�" �ٷ� �� �־ ����)' + sLineBreak;
  Question2 =
    'S1[1]�� ����?' + sLineBreak;
  Comment2 =
    '(String �ȿ��� Ư�� ��ġ�� �ִ� ���ڸ� �ٷ�� Helper�� Chars[]�� ����ϴ� ���)' + sLineBreak +
    '�������� ���, �� String ���� �ٷ� �ڿ� [Index]�� �ٿ��� Ư�� ��ġ�� �ִ� ���ڸ� ����ų �� �ִ�.' + sLineBreak +
    '��, �� �����, Index�� 1�� �� ����Ű�� ���ڰ� ���ڿ����� ù��° ������ ���� �ְ�, �ι�° ������ ���� �ִ�.' + sLineBreak +
    '�� ������ �����Ϸ� ������ ��� �� ���Ҵ°��� ������.' + sLineBreak +
    '�ش� �����Ϸ� �����ڴ� {$ZEROBASEDSTRINGS ON/OFF} �̴�.' + sLineBreak +
    '(�����̴� String �ε����� ���������� 1���� �����Ѵ�.' + sLineBreak +
    '�̸� �������� �ۼ��� �ڵ带 ��� ����Ϸ��� �� �ɼ��� OFF�� �����ϵ��� �Ѵ�.' + sLineBreak +
    '�׷��� �ʰ�, ���ڿ��� �ε����� 0���� �����ϰ� �Ϸ��� �� �ɼ��� ON���� �����Ѵ�.' + sLineBreak +
    '2023�� 5�� ���� ������ �����Ϸ��� �⺻ ������ {$ZEROBASEDSTRINGS OFF}�̴�)'+ sLineBreak;

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
  var S1 := SAMPLE_TEXT;
  //----------------------------------------------------------------------------
  WriteLn(Condition + Question1);
  AskToGoNext;

  Write(Condition + Question1);
  WriteLn(s1.Chars[1]);
  WriteLn;

  WriteLn('[�ؼ�]' + sLineBreak + Comment1);
  AskToGoNext;
  //----------------------------------------------------------------------------
  WriteLn(Condition + Question2);
  AskToGoNext;

  WriteLn;

  {$ZEROBASEDSTRINGS OFF}
  Write('{$ZEROBASEDSTRINGS OFF}�� �����ϸ�, ' + Condition + Question2);
  WriteLn(s1[1]);

  {$ZEROBASEDSTRINGS ON}
  Write('{$ZEROBASEDSTRINGS ON}�� �����ϸ�, ' + Condition + Question2);
  WriteLn(s1[1]);
  {$ZEROBASEDSTRINGS OFF}  // ������ default ������ �����ϵ��� �ǵ��� ����.
  WriteLn;

  WriteLn('[�ؼ�]' + sLineBreak + Comment2);
  //----------------------------------------------------------------------------
  AskToExit;
end.
