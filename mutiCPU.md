# 《计算机组成原理实验》 多周期CPU  

## 前言  
这是中山大学2018年计算机组成原理实验中多周期CPU的实验报告，仿真与写板的内容暂略，所有源代码（包括写板）已经上传至我的github当中，欢迎大家访问。  
github个人主页: https://starashzero.github.io

## 一.	实验目的 
1.	认识和掌握多周期数据通路图的构成、原理及其设计方法； 
2.	掌握多周期CPU的实现方法，代码实现方法； 
3.	编写一个编译器，将MIPS汇编程序编译为二进制机器码； 
4.	掌握多周期CPU的测试方法; 
5.	掌握多周期CPU的实现方法。 


二.	实验内容实验的具体内容与要求。   
设计一个多周期 CPU，该 CPU 至少能实现以下指令功能操作。指令与格式如下：   
==> 算术运算指令   
1.	add  rd , rs, rt    

000000 | rs(5 位) | rt(5 位) | rd(5 位) | reserved 
-|-|-|-|-|
功能：rd←rs + rt。reserved 为预留部分，即未用，一般填“0”。   
2.	sub  rd , rs , rt  

000001 | rs(5 位) | rt(5 位) | rd(5 位) | reserved   
-|-|-|-|-|
功能：rd←rs - rt。   
3.	addiu  rt , rs ,immediate 

000010 |rs(5 位)|rt(5 位)|immediate(16 位) 
-|-|-|-|
功能：rt←rs + (sign-extend)immediate；immediate 符号扩展再参加“加”运算。 
 
==> 逻辑运算指令   
4.	andi  rt , rs ,immediate   

010000 |rs(5 位)| 	rt(5 位) 	|immediate(16 位)
-|-|-|-| 
功能：rt←rs & (zero-extend)immediate；immediate 做“0”扩展再参加“与”运算。   
5.	and  rd , rs , rt 

010001| 	rs(5 位)| 	rt(5 位)| 	rd(5 位)| 	reserved 
-|-|-|-|-|
功能：rd←rs & rt；逻辑与运算。   
6.	ori  rt , rs ,immediate   

010010 |rs(5 位) |	rt(5 位) |	immediate(16 位) 
-|-|-|-|  

功能：rt←rs | (zero-extend)immediate；immediate 做“0”扩展再参加“或”运算。  
7.	xori  rt , rs , immediate 

010011 |	rs(5 位)| 	rt(5 位)| 	immediate(16 位)
-|-|-|-|-|   

功能：rt←rs (zero-extend)immediate；immediate 做“0”扩展再参加“异或”运算。 
 
==>移位指令   
8.	sll  rd, rt,sa  

011000|	未用|rt(5 位)|rd(5 位)|sa(5 位)|reserved 
-|-|-|-|-|-|
功能：rd<－rt<<(zero-extend)sa，左移 sa 位 ，(zero-extend)sa。 
 
==>比较指令   
9. slti  rt, rs,immediate   带符号数 	

100110| 	rs(5 位) |	rt(5 位) 	|immediate(16 位) 	
-|-|-|-|
功能：if (rs< (sign-extend)immediate)  rt =1 else  rt=0, 具体请看表 2 ALU 运算功能表，带符号。 
 
==> 存储器读/写指令   
10.	slt  rd, rs, rt          带符号 
100111 |	rs(5 位)| 	rt(5 位) |	rd(5 位)| 	reserved 
-|-|-|-|-|
功能：if (rs<rt)  rd =1 else  rd=0, 具体请看表 2 ALU 运算功能表，带符号。  
11. sw  rt ,immediate(rs) 写存储器 

110000 |	rs(5 位)| 	rt(5 位) 	|immediate(16 位) 
-|-|-|-|
功能：memory[rs+ (sign-extend)immediate]←rt；immediate 符号扩展再相加。即将rt寄存器的内容保存到rs寄存器内容和立即数符号扩展后的数相加作为地址的内存单元中。   
12. lw  rt , immediate(rs) 读存储器 

110001 |	rs(5 位)| 	rt(5 位) 	|immediate(16 位)
-|-|-|-| 
功能：rt ← memory[rs + (sign-extend)immediate]；immediate 符号扩展再相加。 
即读取 rs 寄存器内容和立即数符号扩展后的数相加作为地址的内存单元中的数，然后
保存到 rt 寄存器中。 
 
 ==> 分支指令   
13.	beq  rs,rt,immediate      

110100 |	rs(5 位) |	rt(5 位) 	|immediate(16 位)
-|-|-|-| 
功能：if(rs=rt) pc←pc + 4 + (sign-extend)immediate <<2  else pc ←pc + 4   
特别说明：immediate 是从 PC+4 地址开始和转移到的指令之间指令条数。immediate 符号扩展之后左移 2 位再相加。为什么要左移 2 位？由于跳转到的指令地址肯定是 4 的倍数（每条指令占 4 个字节），最低两位是“00”，因此将 immediate 放进指令码中的时候，是右移了 2 位的，也就是以上说的“指令之间指令条数”。   
14.	bne  rs,rt,immediate      

110101| 	rs(5 位) |	rt(5 位) 	|immediate(16 位) 
-|-|-|-|
功能：if(rs!=rt) pc←pc + 4 + (sign-extend)immediate <<2  else pc ←pc + 4   
特别说明：与 beq 不同点是，不等时转移，相等时顺序执行。   
15.	bltz  rs,immediate     

110110| 	rs(5 位) |	00000 	|immediate(16 位) 
-|-|-|-|
功能：if(rs<$zero) pc←pc + 4 + (sign-extend)immediate <<2  else pc ←pc + 4。 
 
==>跳转指令   
16. j  addr     

|111000 	|addr[27:2]
-|-| 
功能：pc <－{(pc+4)[31:28],addr[27:2],2'b00}，无条件跳转。   
说明：由于 MIPS32 的指令代码长度占 4 个字节，所以指令地址二进制数最低 2 位均为 0，将指令地址放进指令代码中时，可省掉！这样，除了最高 6 位操作码外，还有 26 位可用于存放地址，事实上，可存放 28 位地址，剩下最高 4 位由 pc+4 最高 4 位拼接上。   
17. jr  rs     
111001 	|rs(5 位) 	|未用 |	未用 |	reserved 
-|-|-|-|-|
功能：pc <－ rs，跳转。   
==>调用子程序指令   
18. jal  addr     			
111010 	|		addr[27:2] 	
-|-|
功能：调用子程序，pc <－ {(pc+4)[31:28],addr[27:2],2'b00}；$31<－pc+4，返回地址设置；子程序返回，需用指令 jr $31。跳转地址的形成同 j addr 指令。 
 			

==> 停机指令   
19. halt  

111111 |	00000000000000000000000000(26 位) 
-|-|
功能：停机；不改变 PC 的值，PC 保持不变。 

## 三.	实验原理 
简述实验原理和方法，必须有数据通路图及相关图。   
多周期 CPU 指的是将整个 CPU 的执行过程分成几个阶段，每个阶段用一个时钟去完成，然后开始下一条指令的执行，而每种指令执行时所用的时钟数不尽相同，这就是所谓的多周期 CPU。CPU 在处理指令时，一般需要经过以下几个阶段： 
1.	取指令(IF)：根据程序计数器 pc 中的指令地址，从存储器中取出一条指令，同时， pc 根据指令字长度自动递增产生下一条指令所需要的指令地址，但遇到“地址转移”指令时，则控制器把“转移地址”送入 pc，当然得到的“地址”需要做些变换才送入 pc。 
2.	指令译码(ID)：对取指令操作中得到的指令进行分析并译码，确定这条指令需要完成的操作，从而产生相应的操作控制信号，用于驱动执行状态中的各种操作。 
3.	指令执行(EXE)：根据指令译码得到的操作控制信号，具体地执行指令动作，然后转移到结果写回状态。 
4.	存储器访问(MEM)：所有需要访问存储器的操作都将在这个步骤中执行，该步骤给出存储器的数据地址，把数据写入到存储器中数据地址所指定的存储单元或者从存储器中得到数据地址单元中的数据。 
5.	结果写回(WB)：指令执行的结果或者访问存储器中得到的数据写回相应的目的寄存器中。 

实验中就按照这五个阶段进行设计，这样一条指令的执行最长需要五个(小)时钟周期才能完成，但具体情况怎样？要根据该条指令的情况而定，有些指令不需要五个时钟周期的，
![](picture\muti-1.PNG)
 
MIPS 指令的三种格式： 
![](picture\muti-2.jpg)
  其中， op：为操作码；   
rs：为第 1 个源操作数寄存器，寄存器地址（编号）是 00000~11111，00~1F；  
rt：为第 2 个源操作数寄存器，或目的操作数寄存器，寄存器地址（同上）；  
rd：为目的操作数寄存器，寄存器地址（同上）；   
sa：为位移量（shift amt），移位指令用于指定移多少位；funct：为功能码，在寄存器类型指令中（R 类型）用来指定指令的功能；   
immediate：为 16 位立即数，用作无符号的逻辑操作数、有符号的算术操作数、数据加载（Load）/数据保存（Store）指令的数据地址字节偏移量和分支指令中相对程序计数器（PC）的有符号偏移量；    
address：为地址。 
![](picture\muti-3.jpg)
图 2 多周期 CPU 状态转移图   
状态的转移有的是无条件的，例如从 sIF 状态转移到 sID 就是无条件的；有些是有条件的，例如 sEXE 状态之后不止一个状态，到底转向哪个状态由该指令功能，即指令操作码决定。每个状态代表一个时钟周期。 
![](picture\muti-4.jpg)
图 3 多周期 CPU 控制部件的原理结构图   
图 3 是多周期 CPU 控制部件的电路结构，三个 D 触发器用于保存当前状态，是时序逻辑电路，RST 用于初始化状态“000“，另外两个部分都是组合逻辑电路，一个用于产生下一个阶段的状态，另一个用于产生每个阶段的控制信号。从图上可看出，下个状态取决于指令操作码和当前状态；而每个阶段的控制信号取决于指令操作码、当前状态和反映运算结果的状态 zero 标志和符号 sign 标志。 
![](picture\muti-5.jpg)  
图 4  多周期 CPU 数据通路和控制线路图 
 
图4是一个简单的基本上能够在多周期CPU上完成所要求设计的指令功能的数据通路和必要的控制线路图。其中指令和数据各存储在不同存储器中，即有指令存储器和数据存储器。访问存储器时，先给出内存地址，然后由读或写信号控制操作。对于寄存器组，给出寄存器地址（编号），读操作时不需要时钟信号，输出端就直接输出相应数据；而在写操作时，在 WE 使能信号为 1 时，在时钟边沿触发将数据写入寄存器。图中控制信号功能如表 1 所示，表 2 是 ALU 运算功能表。   
特别提示，图上增加 IR 指令寄存器，目的是使指令代码保持稳定，pc 写使能控制信号PCWre，是确保 pc 适时修改，原因都是和多周期工作的 CPU 有关。ADR、BDR、ALUoutDR、DBDR 四个寄存器不需要写使能信号，其作用是切分数据通路，将大组合逻辑切分为若干个小组合逻辑，大延迟变为多个分段小延迟。   
表 1 控制信号作用   
控制信号名 |	状态“0” |	状态“1”
-|-|-| 
RST |	对于 PC，初始化 PC 为程序首地址 |	对于 PC，PC 接收下一条指令地址 
PCWre |	PC 不更改，相关指令：halt，另外，除‘000’状态之外，其余状态慎改 PC 的值。| 	PC 更改，相关指令：除指令 halt 外，另外，在‘000’状态时，修改 PC 的值合适。 
ALUSrcA |	来自寄存器堆 data1 输出，相关指令：add、sub、addiu、and、andi、 ori、xori、slt、slti、sw、lw、beq、 bne、bltz |	来自移位数 sa，同时，进行(zero-extend)sa，即 {{27{1'b0},sa}}，相关指令：sll 
ALUSrcB |	来自寄存器堆 data2 输出，相关指令：add、sub、and、slt、sll、|	来自 sign 或 zero 扩展的立即数，相关指令：addiu、andi、ori、xori、slti、beq、bne、bltz 	lw、sw 
DBDataSrc |	来自 ALU 运算结果的输出，相关指令：add、sub、addiu、and、andi、 ori、xori、sll、slt、slti |来自数据存储器（Data MEM）的输出，相关指令：lw 
RegWre |	无写寄存器组寄存器，相关指令： beq、bne、bltz、j、sw、jr、halt 	|寄存器组寄存器写使能，相关指令：add、sub、addiu、and、andi、ori、 xori、sll、slt、slti、lw、jal 
WrRegDSrc |	写入寄存器组寄存器的数据来自pc+4(pc4），相关指令：jal，写$31 |	写入寄存器组寄存器的数据来自 ALU 运算结果或存储器读出的数据，相关指令：add、addiu、sub、and、andi、 ori、xori、sll、slt、slti、lw 
InsMemRW |	写指令存储器 |	读指令存储器(Ins. Data） 
mRD |	存储器输出高阻态 |	读数据存储器，相关指令：lw 
mWR |	无操作| 	写数据存储器，相关指令：sw 
IRWre |	IR(指令寄存器)不更改 |	IR 寄存器写使能。向指令存储器发出读指令代码后，这个信号也接着发出，在时钟上升沿，IR 接收从指令存储器送来的指令代码。与每条指令都相关。 
ExtSel |	(zero-extend)immediate，相关指令：andi、xori、ori； |	(sign-extend)immediate，相关指令： addiu、slti、lw、sw、beq、bne、 bltz； 
 PCSrc[1..0] |	00：pc<－pc+4，相关指令：add、addiu、sub、and、andi、ori、xori、 slt、slti、sll、sw、lw、beq(zero=0)、bne(zero=1)、bltz(sign=0)；<br> 01：pc<－pc+4+(sign-extend)immediate ×4，相关指令：beq(zero=1)、bne(zero=0)、bltz(sign=1)；  10：pc<－rs，相关指令：jr；<br>  11：pc<－{pc[31:28],addr[27:2],2'b00}，相关指令：j、jal； 
RegDst[1..0] |	写寄存器组寄存器的地址，来自：<br> 00：0x1F($31)，相关指令：jal，用于保存返回地址（$31<-pc+4）； <br>01：rt 字段，相关指令：addiu、andi、ori、xori、slti、lw； <br>10：rd 字段，相关指令：add、sub、and、slt、sll； <br>11：未用； 
ALUOp[2..0] 	ALU 8 种运算功能选择(000-111)，看功能表 
相关部件及引脚说明：  
### Instruction Memory：指令存储器 
  1. Iaddr，指令地址输入端口 
  2. DataIn，存储器数据输入端口 
  3. DataOut，存储器数据输出端口 
  4. RW，指令存储器读写控制信号，为 0 写，为 1 读 
### Data Memory：数据存储器 
  1. Daddr，数据地址输入端口 
  2. DataIn，存储器数据输入端口   
  3. DataOut，存储器数据输出端口 
  4. /RD，数据存储器读控制信号，为 0 读 
  5. /WR，数据存储器写控制信号，为 0 写 
### Register File：寄存器组 
  1. Read Reg1，rs 寄存器地址输入端口   Read Reg2，2. rt 寄存器地址输入端口 
  3. Write Reg，将数据写入的寄存器，其地址输入端口（rt、rd） 
  4. Write Data，写入寄存器的数据输入端口 
  5. Read Data1，rs 寄存器数据输出端口   Read Data2，rt 寄存器数据输出端口 
  6. WE，写使能信号，为 1 时，在时钟边沿触发写入 
### IR：  指令寄存器，用于存放正在执行的指令代码 
### ALU： 算术逻辑单元 
  1. result，ALU 运算结果   
  2. zero，运算结果标志，结果为 0，则 zero=1；否则 zero=0 
  3. sign，运算结果标志，结果最高位为 0，则 sign=0，正数；否则，sign=1，负数 
         
表 2 ALU 运算功能表      
ALUOp[2..0] |	功能 |	描述 
-|-|-|
000 |Y = A + B| 	加 
001 | Y = A – B |	减 
010|	Y = B<<A| 	B 左移 A 位 
011 |	Y = A ∨ B |	或 
100 |	Y = A ∧ B |	与 
101 |	Y=（A<B）?1: 0 |	比较 A<B 不带符号 
110 |	Y=(((A<B)&&(A[31] == B[31])) \|\|((A[31]==1&& B[31] == 0))) ? 1:0 |	比较 A<B 带符号 
111 |	Y = A ⊕ B |	异或 
 

## 四.	实验器材 
电脑一台，Xilinx Vivado 软件一套，Basys3板一块。 
 
## 五.	实验过程与结果 
1.	简易MIPS编译器 
实现MIPS首先我将所有的指令按R,I,J型进行分类，方便主程序进行后续的判断和读取 
```c++
vector<string> rIns = {"add","sub","and","slt","sll","jr"};
vector<string> iIns = {"addiu","andi","ori","xori","slti","sw","lw","beq","bne","bltz"};
vector<string> jIns = {"j","jal","halt"};
```  
同时实现一个10进制到二进制的转换函数，方便寄存器号与立即数的读取
```c++
string decToBin(string dec,int length) {
	int a = atoi(dec.c_str());
	char str[33];
	char sign = '0';//符号位
	//负数取正
	if (a < 0) {
		sign = '1';
		a += pow(2, length);
	}
	_itoa(a,str,2);
	string result="";
	//符号位拓展
	for (unsigned int temp = 0;temp < length - strlen(str);temp++) {
		result += sign;
	}
	result += str;
	return result;

}
``` 
然后是指令op向opcode的转换函数  
```c++
string opCode(string op) {
	if (op == "sll")
		op = "011000";
	else if (op == "jr")
		op = "111001";
	else if (op == "add")
		op = "000000";
	else if (op == "sub")
		op = "000001";
	else if (op == "and")
		op = "010000";
	else if (op == "slt")
		op = "100111";
	else if (op == "addiu")
		op = "000010";
	else if (op == "andi")
		op = "010001";
	else if (op == "ori")
		op = "010010";
	else if (op == "xori")
		op = "010011";
	else if (op == "slti")
		op = "100110";
	else if (op == "sw")
		op = "110000";
	else if (op == "lw")
		op = "110001";
	else if (op == "beq")
		op = "110100";
	else if (op == "bne")
		op = "110101";
	else if (op == "bltz")
		op = "110110";
	else if (op == "j")
		op = "111000";
	else if (op == "jal")
		op = "111010";
	else if (op == "halt")
		op = "111111";
	return op;
}

```
  
然后就是主程序，按R,I,J指令分别进行分析，同时对部分特殊指令单独编写代码，按指令类型得到所有的数据后，按8个位进行空格隔开，最后传入文件，一条指令的读取完成。 
```c++
int main() {
	fstream in("./origin.txt", ios::in);
	fstream out("./instructions.txt", ios::out);
	string ins;
	out << "@000" << endl;
	while (getline(in, ins)) {
		string op = "";
		unsigned int target = 0;
		for (target = 0;target < ins.length() && ins[target] != ' ';target++)
			op += ins[target];
		vector<string>::iterator i = find(rIns.begin(), rIns.end(), op);
		string output;
		while (ins[target] == ' ')
			target++;
		if (i != rIns.end()) {
			string rs, rt, rd, reserved, sa;
			reserved = "00000000000";
			if (op == "sll") {
				rs = "00000";
				for (target = target+1;target < ins.length() && ins[target] != ',';target++)
					rd += ins[target];
				rd = decToBin(rd,5);
				for (target = target + 2;target < ins.length() && ins[target] != ',';target++)
					rt += ins[target];
				rt = decToBin(rt,5);
				for (target = target + 1;target < ins.length() && ins[target] != ' ';target++)
					sa += ins[target];
				sa = decToBin(sa,5);
				reserved = sa;
				while (reserved.length() < 11)
					reserved += '0';
			}
			else if(op=="jr")
			{
				for (target = target + 1;target < ins.length() && ins[target] != ' ';target++)
					rs += ins[target];
				rs = decToBin(rs,5);
				rt = "00000";
				rd = "00000";
			}
			else {
				for (target = target + 1;target < ins.length() && ins[target] != ',';target++)
					rd += ins[target];
				rd = decToBin(rd,5);
				for (target = target + 2;target < ins.length() && ins[target] != ',';target++)
					rs += ins[target];
				rs = decToBin(rs,5);
				for (target = target + 2;target < ins.length() && ins[target] != ' ';target++)
					rt += ins[target];
				rt = decToBin(rt,5);
			}
			op = opCode(op);
			output = op + rs + rt + rd + reserved;
		}
		else {
			i = find(iIns.begin(), iIns.end(), op);
			if (i != iIns.end()) {
				string rs, rt, im;
				if (op == "lw" || op == "sw") {
					for (target = target + 1;target < ins.length() && ins[target] != ',';target++)
						rt += ins[target];
					rt = decToBin(rt, 5);
					for (target = target + 1;target < ins.length() && ins[target] != '(';target++)
						im += ins[target];
					im = decToBin(im, 16);
					for (target = target + 2;target < ins.length() && ins[target] != ')';target++)
						rs += ins[target];
					rs = decToBin(rs, 5);
				}
				else {
					if (op != "bltz") {
						for (target = target + 1;target < ins.length() && ins[target] != ',';target++)
							rt += ins[target];
						rt = decToBin(rt, 5);
						for (target = target + 2;target < ins.length() && ins[target] != ',';target++)
							rs += ins[target];
						rs = decToBin(rs, 5);
					}
					else {
						rt = "00000";
						for (target = target + 1;target < ins.length() && ins[target] != ',';target++)
							rs += ins[target];
						rs = decToBin(rs, 5);
					}
					for (target = target + 1;target < ins.length() && ins[target] != ' ';target++)
						im += ins[target];
					im = decToBin(im, 16);
				}
				op = opCode(op);
				output = op + rs + rt + im;
			}
			else {
				string addr;
				if (op == "halt") {
					addr = "00000000000000000000000000";
				}
				else {
					for (target = target + 2;target < ins.length() && ins[target] != ' ';target++)
						addr += ins[target];
					int ta;
					sscanf(addr.c_str(), "%x", &ta);
					addr = to_string(ta);
					addr = decToBin(addr, 26);
				}
				op = opCode(op);
				output = op + addr;
			}
		}
		string::iterator j = output.begin();
		for (int count = 0;count < 32;count++) {
			if (count % 8 == 0 && count) {
				output.insert(j, ' ');
				j++;
			}
			j++;
		}
		out << output << endl;
	}
	in.close();
	out.close();
	return 0;
}
``` 
所有指令读取完毕后程序结束，下面是实验结果。 
![](picture\muti-6.jpg)  
经后续仿真与写板验证，编译成功。   
 2.	仿真说明   
多周期CPU的结构较单周期CPU复杂了不少，不过首先还是按照数据通路将CPU分为PC, controlUnit, DR(ADR,BDR,ALUOUTDR,DBDR等的代码统一)，mux2to1（二选一选择器），mux3to1(三选一选择器),instructionMemory,IR,registerFile,ALU,mux(处理 bltz,bne,beq的ALU结果),dataMemory,signZeroExtend和顶层模块multiCycleCPU。实验思路是将每个时钟上升沿作为上一个状态的结束与下一个状态的开始，主要依靠DR（ADR,BDR等）等模块延迟的作用，不过由于处理不了状态改变与DR直接的冲突，改变当前状态使用的是时钟的下降沿（原打算同样使用上升沿触发），因此虽然我将时钟上升沿作为状态的始终，很多过程依然是无可奈何地只能在半周期解决。不多说了，接下来拆解各模块代码。 
(1.	controlUnit 主要代码：
```verilog
module controlUnit(
    input clk,
    input [5:0] opCode,
    input zero,
    input sign,
    input RST,
    output IRWre,
    output PCWre,
    output ALUSrcA,
    output ALUSrcB,
    output DBDataSrc,
    output RegWre,
    output WrRegDSrc,
    output InsMemRW,
    output mRD,
    output mWR,
    output ExtSel,
    output [1:0] RegDst,
    output [1:0] PCSrc,
    output [2:0] ALUOp
    );
   wire [2:0] state;
   //改变当前状态
   changeState CSt(opCode,RST,clk,state);
   //控制输出信号
   controlSign CSi(state,opCode,zero,sign,IRWre,PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,WrRegDSrc,InsMemRW,mRD,mWR,ExtSel,RegDst,PCSrc,ALUOp);
   
endmodule
``` 
根据功能又将controlUnit分为changeState和controlSign两部分，分别用于改变当前状态以及根据当前状态进行相应信号的改变。 
changeState: 每次时钟下降沿改变当前状态 
```verilog
module changeState(
    input [5:0] opCode,
    input RST,
    input clk,
    output reg[2:0] new_state
    );
    //设置常量，方便下面使用
    parameter [2:0] IF = 3'b000,
    ID = 3'b001, EXE1 = 3'b110,
    EXE2 = 3'b101, EXE3 = 3'b010,
    WB1 = 3'b111, WB2 = 3'b100,
    MEM = 3'b011;
    initial begin
        new_state = IF;
    end
    
    //时钟下降沿刷新状态
    always @(negedge clk or negedge RST) begin
        if ( RST == 0 ) begin
            new_state = IF;
        end
        else begin
            case (new_state)
                IF: new_state <= ID;
                ID: begin
                    if ( opCode == 6'b110100 || opCode == 6'b110101 || opCode == 6'b110110)//beq,bne,bltz
                        new_state <= EXE2;
                    else if ( opCode == 6'b110000 || opCode == 6'b110001)//sw,lw
                        new_state <= EXE3;
                    else if ( opCode == 6'b111000 || opCode == 6'b111001 || opCode == 6'b111010 || opCode == 6'b111111)//j,jal,jr,halt
                        new_state <= IF;
                    else 
                        new_state <= EXE1;
                end
                EXE1: new_state <= WB1;
                EXE2: new_state <= IF;
                EXE3: new_state <= MEM;
                WB1: new_state <= IF;
                WB2: new_state <= IF;
                MEM: begin
                    if ( opCode == 6'b110000)
                        new_state <= IF;
                    else 
                        new_state <= WB2;
                end
            endcase
        end
    end 
endmodule
```
controlUnit: 每次状态改变时，根据当前状态设置信号（最初设计时为了简化，所以只将各状态下的控制信号放在每个状态中改变，例如PCWre，而选择信号则每个状态都进行刷新（因为不会影响运行））。 
```verilog
module controlSign(
    input [2:0] state,
    input [5:0] opCode,
    input zero,
    input sign,
    output reg IRWre,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output reg WrRegDSrc,
    output reg InsMemRW,
    output reg mRD,
    output reg mWR,
    output reg ExtSel,
    output reg [1:0] RegDst,
    output reg [1:0] PCSrc,
    output reg [2:0] ALUOp
    );
    //设置常量
    parameter [2:0] IF = 3'b000,
    ID = 3'b001, EXE1 = 3'b110,
    EXE2 = 3'b101, EXE3 = 3'b010,
    WB1 = 3'b111, WB2 = 3'b100,
    MEM = 3'b011;
    
    //每次状态改变时
    always @(state) begin
        DBDataSrc = (opCode == 6'b110001) ? 1 : 0;
        WrRegDSrc = (opCode == 6'b111010)? 0 : 1;
        ExtSel = (opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011) ? 0 : 1;
        RegDst = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b011100 || opCode == 6'b100111) ? 0 : 1;
        PCSrc[1] = (opCode == 6'b111000 || opCode == 6'b111001 || opCode == 6'b111010) ? 1 : 0;
        PCSrc[0] = ((opCode == 6'b110100 && zero == 1)||(opCode == 6'b110101 && zero == 0)||(opCode == 6'b110110 && sign == 1) || opCode == 6'b111000 || opCode == 6'b111010) ? 1 : 0;
        RegDst[1] = (opCode == 6'b000000 || opCode == 6'b000001 || opCode == 6'b010000 || opCode == 6'b100111 || opCode == 6'b011000) ? 1 : 0;
        RegDst[0] = (opCode == 6'b000010 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b100110 || opCode == 6'b110001) ? 1 : 0;
        
        //EXE
        if (state == EXE1 || state == EXE2 || state == EXE3) begin
            ALUOp[2] = (opCode == 6'b010000 || opCode == 6'b010001 ||opCode == 6'b100110 || opCode==6'b100111 || opCode == 6'b010011) ? 1 : 0;
            ALUOp[1] = (opCode == 6'b011000 || opCode == 6'b010010 || opCode == 6'b100111 || opCode == 6'b010011) ? 1 : 0;
            ALUOp[0] = (opCode == 6'b000001 || opCode == 6'b110100 || opCode == 6'b110101|| opCode == 6'b010010 || opCode == 6'b100110 || opCode == 6'b010011) ? 1 : 0;
            ALUSrcA = (opCode == 6'b011000) ? 1 : 0;
            ALUSrcB = (opCode == 6'b000010 || opCode == 6'b010001 || opCode == 6'b010010 || opCode == 6'b010011 || opCode == 6'b100110 || opCode == 6'b110001 || opCode == 6'b110000) ? 1 : 0; 
        end
        
        //IF
        if (state == IF) begin
            if (opCode != 6'b111111)
                PCWre = 1;
            else PCWre = 0;
        end
        else begin 
            PCWre = 0;
        end      
        
        //ID
        InsMemRW = 1;
        if (state == ID)
            IRWre = 1;
        else IRWre = 0;
        
        //MEM
        if (state == MEM) begin
            mRD = (opCode == 6'b110001) ? 1 : 0;
            mWR = (opCode == 6'b110000) ? 1 : 0;
        end
        else begin
            mRD = 0;
            mWR = 0;
        end
        
        //WB
        if (state == WB1 || state == WB2)
            RegWre = (opCode == 6'b110100 || opCode == 6'b110101 || opCode == 6'b110110 || opCode == 6'b111000 || opCode == 6'b110000 || opCode == 6'b111001 || opCode == 6'b111111)? 0 : 1;
        else if (opCode == 6'b111010 && state == ID) //允许jal指令在ID阶段写寄存器
            RegWre = 1;
        else RegWre = 0;
        
    end
   
endmodule
``` 
  
(2.	PC 
主要代码： 
```verilog
module PC(
    input clk, Reset, PCWre,
    input [1:0] PCSrc,  
    input [31:0] immediate,
    input [31:0] dataFromRF,
    output reg [31:0] newaddress,  
    output reg [31:0] address
    );  
    initial begin
        address = 0;
        newaddress = 4;
    end
    
    always @(posedge clk or negedge Reset)  //设置时钟
    begin  
        if (Reset == 0) begin  
            address <= 0;  
            newaddress <= 4;
        end  
        else if (PCWre) begin
            if (PCSrc == 2'b11) begin  //j,jal指令
                address <= (newaddress[31:28]<<28)+(immediate[27:2]<<2)+2'b00; 
            end
            else if (PCSrc == 2'b01) begin  //beq or bne
                address <= newaddress + (immediate<<2);
            end
            else if (PCSrc == 2'b10) //jr
                address <= dataFromRF;
            else address = address + 4;
            newaddress <= address + 4;
        end  
    end  
endmodule  

```	  
 在IF阶段（PCWre = 1）时，根据PCSrc进行地址转换   
(3.	instructionMemory 
主要代码 
```verilog
module instructionMemory(
    input [31:0] pc,   
    output [31:0] instruction
    );
    
    reg [7:0] mem[0:127];
    reg [31:0] address;
    reg [31:0] instruction;
    initial begin
        $readmemb("E:/Xlink/VivadoProject/multiCycleCPU/instructions.txt", mem); 
    end
    
    always @(pc) begin //读取指令
        address = pc[6:2] << 2; 
        instruction = (mem[address]<<24) + (mem[address+1]<<16) + (mem[address+2]<<8) + mem[address+3];
    end

    
endmodule
```
 当PC改变时(IF阶段)，根据PC读取指令，并送出   
(4.	IR 
主要代码
```verilog
module IR(
    input clk,
    input IRWre,
    input [31:0] instruction,
    output reg[5:0] op,   
    output reg[4:0] rs, rt, rd,  
    output reg[15:0] immediate,
    output reg[5:0] sa
    );
    
    //时钟上升沿时送出数据
    always @(posedge clk) begin
        if (IRWre == 1) begin
            op = instruction[31:26];  
            rs = instruction[25:21];  
            rt = instruction[20:16];  
            rd = instruction[15:11];  
            sa = instruction[10:6];
            immediate = instruction[15:0];
        end
    end
endmodule
``` 
当IRWre=1且时钟上升沿时，进行解码，同时代表ID阶段开始   
(5.	mux2to1 
主要代码： 
```verilog
module mux2to1(
    input [31:0] in1,
    input [31:0] in2,
    input sign,
    output [31:0] out
    );
    //二选一
    assign out = (sign == 0)? in1 : in2;
endmodule
```
对根据选择信号对传入的两个数据进行选择并送出。   
用于registerFile中writeData的输入，ALU中rega,regb的输入，以及DB的输出。  
(6.	mux3to1 
主要代码： 
```verilog
module mux3to1(
    input [4:0] in1,
    input [4:0] in2,
    input [4:0] in3,
    input [1:0] sign,
    output reg[4:0] out
    );
    //三选一
    always @(in1 or in2 or in3 or sign) begin
        case (sign)
            2'b00: out = in1;
            2'b01: out = in2;
            2'b10: out = in3;
        endcase
    end
endmodule
```
对传入的三个数据根据选择信号进行选择并送出。   
用于registerFile中writeReg的输入。   
(7.	registerFile 
主要代码 
```verilog
module registerFile(
    input clk, RegWre,
    input [4:0] writeReg,
    input [31:0] writeData,
    input [4:0] rs, rt,
    output [31:0] Data1, Data2
    ); 
    
    
    reg [31:0] register[0:31];  
    integer i;  
    initial begin  //初始化寄存器
        for (i = 0; i < 32; i = i+1) 
        register[i] <= 0;  
    end  
    
    //读取数据
    assign Data1 = register[rs];
    assign Data2 = register[rt];
    
    always @(negedge clk) begin  //写回寄存器
        if (RegWre && writeReg) register[writeReg] <= writeData;  
    end  

endmodule
```  
ID阶段读取需要的寄存器中的数据，同时在WB(RegWre = 1)阶段写回寄存器。   
(8.	DR
```verilog
module DR(
    input clk,
    input [31:0] in,
    output reg [31:0] out
    );
    //时钟上升沿时将数据送出
    always @(posedge clk) begin
        out = in;
    end
endmodule
``` 
延迟读取与发送，用于划分各状态的始终   
ADR、BDR：时钟上升沿数据送入ALU，代表EXE阶段的开始与ID阶段的结束   
ALUOUTDR：时钟上升沿将数据送入memoryFile,代表MEM阶段的开始与EXE阶段的结束   
DBDR: 时钟上升沿时将数据送入registerFile,代表WB阶段的开始或与EXE或MEM 阶段的结束。   
(9.	ALU 
主要代码： 
```verilog
module ALU(
    input [31:0] rega, 
    input [31:0] regb,
    input [2:0] ALUopcode,
    output reg zero,
    output reg sign,
    output reg [31:0] result
    );

    always @( ALUopcode or rega or regb ) begin
        case (ALUopcode)
        3'b000 : begin //a + b
                    result = rega + regb;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
                end
        3'b001 : begin //a - b 
                    result = rega - regb;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
        end
        3'b010 : begin // b << a
                    result = regb << rega;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
        end
        3'b011 : begin // a | b
                    result = rega | regb;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
        end
        3'b100 : begin // a & b
                    result = rega & regb;
                    zero = (result == 0)? 1 : 0;
                    sign = (result[31] == 0)? 0 : 1;
        end
        3'b101 : begin // a < b
                   result = (rega < regb)?1:0;  
                   zero = (result == 0)? 1 : 0;
                   sign = (result[31] == 0)? 0 : 1;
       end
        3'b110 : begin // blt,bltz
            if(rega < regb && (rega[31] == regb[31]))result = 1;
            else if (rega[31] == 1 && regb[31] == 0) result = 1;
            else result = 0;
            zero = (result == 0)? 1 : 0;
            sign = (result[31] == 0)? 0 : 1;
        end
        3'b111 : begin //xori
            result = rega ^ regb;
            zero = (result == 0)? 1 : 0;
            sign = (result[31] == 0)? 0 : 1;
        end
        default : begin
            result = 32'h00000000;
            $display (" no match");
        end
        endcase
    end
endmodule

``` 
根据ALUopcode，将rega和regb进行运算   
(10.	mux   
主要代码 
```verilog
module mux(
    input [31:0] aluResult,
    input zero,
    input sign,
    input [5:0] opCode,
    output reg[31:0] writeData
    );
    //处理bne,beq,bltz指令
    always @(aluResult or zero or opCode ) begin
        if (opCode == 6'b110101) //bne
            writeData = !zero;
        else if (opCode == 6'b110100)//beq
            writeData = zero;
        else if (opCode == 6'b110110)//bltz
            writeData = sign;
        else
            writeData = aluResult;
    end
endmodule
``` 
处理bne,beq,bltz指令的ALU结果特殊情况   
(10.	dataMemory 
主要代码: 
```verilog
module dataMemory(
    input [31:0] DAddr,
    input [31:0] DataIn,
    input mRD,
    input mWR,
    output reg [31:0] DataOut
    );
       
    integer i;  
    initial begin  
       for (i = 0; i < 128; i = i+1) memory[i] <= 0;  //内存器初始化为0
    end  
    
    reg[7:0] memory[0:127];
    reg[31:0] address;      
    always @(mRD) begin  //读操作
       if (mRD == 1) begin
       address = (DAddr << 2);
       DataOut = (memory[address]<<24)+(memory[address+1]<<16)+(memory[address+2]<<8)+memory[address+3];
       end
    end  
    
    always @(mWR or DAddr or DataIn)   begin  //写操作
       if (mWR == 1) begin
           address = DAddr << 2;
           memory[address] = DataIn[31:24];
           memory[address+1]= DataIn[23:16];
           memory[address+2]=DataIn[15:8];
           memory[address+3]=DataIn[7:0];
       end  
    end  
endmodule
``` 
进行存储器的读写操作(MEM阶段)。   
(11.	signZeroExtend 
主要代码 
```verilog
module signZeroExtend(
    input [15:0] immediate,
    input ExtSel,
    output [31:0] out
    );
    //立即数拓展
    assign out[15:0] = immediate;
    assign out[31:16] = ExtSel? (immediate[15]? 16'hffff : 16'h0000) : 16'h0000;
endmodule
```
进行立即数拓展。   
(12.	multiCycleCPU 主要代码: 
```verilog
module multiCycleCPU(
    input clk, Reset,
    output [31:0] instruction,
    output [31:0] readData1, readData2, DB, curPC,Result ,newPC
    );
    wire[2:0] ALUOp;
    wire[31:0] exImmediate, DMOut, rega,regb,rdout1,rdout2,writeData,aluout,dtout,DAddr;
    wire[15:0] immediate;
    wire[5:0] opCode;
    wire[4:0] rs,rt,rd,writeReg;
    wire[5:0] sa;
    wire[1:0] PCSrc, RegDst;
    wire sign, zero,IRWre,PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre,WrRegDSrc,InsMemRW, mRD, mWR, ExtSel;
    
    controlUnit cu(clk,opCode,zero,sign,Reset,IRWre,PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,WrRegDSrc,InsMemRW,mRD,mWR,ExtSel,RegDst,PCSrc,ALUOp);
    PC pc(clk,Reset,PCWre,PCSrc,exImmediate,readData1,newPC,curPC);
    instructionMemory im(curPC,instruction);
    IR ir(clk,IRWre,instruction,opCode,rs,rt,rd,immediate,sa);
    mux3to1 rg(5'b11111,rt,rd,RegDst,writeReg);
    registerFile rf(clk,RegWre,writeReg,writeData,rs,rt,readData1,readData2);
    DR adr(clk,readData1,rdout1);
    DR bdr(clk,readData2,rdout2);
    DR aluOutDr(clk,aluout,DAddr);
    DR dbdr(clk,DMOut,DB);
    mux2to1 wd(newPC,DB,WrRegDSrc,writeData);
    mux2to1 ra(rdout1,(27'b0<<5)+sa,ALUSrcA,rega);
    mux2to1 rb(rdout2,exImmediate,ALUSrcB,regb);
    mux2to1 da(aluout,dtout,DBDataSrc,DMOut);
    ALU alu(rega,regb,ALUOp,zero,sign,Result);
    mux m(Result,zero,sign,opCode,aluout);
    dataMemory dm(DAddr,rdout2,mRD,mWR,dtout);
    signZeroExtend sze(immediate, ExtSel, exImmediate);
endmodule
```  
顶层模块，根据数据通路进行连接。 
CPU各模块代码完成，接下来进行仿真，使用的instructions文件来自编译器，因此仿真结果也可以验证编译器的正确性。 
 ### 仿真与写板部分暂略，所有源代码已经上传至我的github当中，欢迎访问我的github  
  ### github个人主页 https://starashzero.github.io