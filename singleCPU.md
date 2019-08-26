# 《计算机组成原理实验》 单周期CPU  

## 前言  
这是中山大学2018年计算机组成原理实验中单周期CPU的实验报告，仿真与写板的内容暂略，所有源代码（包括写板）已经上传至我的github当中，欢迎大家访问。  
github个人主页: https://starashzero.github.io

## 一.	实验目的 
1.	掌握单周期CPU数据通路图的构成、原理及其设计方法； 
2.	掌握单周期CPU的实现方法，代码实现方法； 
3.	认识和掌握指令与CPU的关系； 
4.	掌握测试单周期CPU的方法。

二.	实验内容实验的具体内容与要求。   
设计一个单周期 CPU，该 CPU 至少能实现以下指令功能操作。指令与格式如下：   
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

010010 	rs(5 位) 	rt(5 位) 	immediate(16 位) 
功能：rt←rs | (zero-extend)immediate；immediate 做“0”扩展再参加“或”运算。  
7.	or  rd , rs , rt 

010011 |	rs(5 位)| 	rt(5 位)| 	rd(5 位) |	reserved
-|-|-|-|-|   

功能：rd←rs | rt；逻辑或运算。 
 
==>移位指令   
8.	sll  rd, rt,sa  

011000|	未用|rt(5 位)|rd(5 位)|sa(5 位)|reserved 
-|-|-|-|-|-|
功能：rd<－rt<<(zero-extend)sa，左移 sa 位 ，(zero-extend)sa。 
 
==>比较指令   
9. slti  rt, rs,immediate   带符号数 	

011100| 	rs(5 位) |	rt(5 位) 	|immediate(16 位) 	
-|-|-|-|
功能：if (rs< (sign-extend)immediate)  rt =1 else  rt=0, 具体请看表 2 ALU 运算功能表，带符号。 
 
==> 存储器读/写指令   
10. sw  rt ,immediate(rs) 写存储器 

100110 |	rs(5 位)| 	rt(5 位) 	|immediate(16 位) 
-|-|-|-|
功能：memory[rs+ (sign-extend)immediate]←rt；immediate 符号扩展再相加。即将rt寄存器的内容保存到rs寄存器内容和立即数符号扩展后的数相加作为地址的内存单元中。   
11. lw  rt , immediate(rs) 读存储器 

100111 |	rs(5 位)| 	rt(5 位) 	|immediate(16 位)
-|-|-|-| 
功能：rt ← memory[rs + (sign-extend)immediate]；immediate 符号扩展再相加。 
即读取 rs 寄存器内容和立即数符号扩展后的数相加作为地址的内存单元中的数，然后
保存到 rt 寄存器中。 
 
 ==> 分支指令   
12.	beq  rs,rt,immediate      

110000 |	rs(5 位) |	rt(5 位) 	|immediate(16 位)
-|-|-|-| 
功能：if(rs=rt) pc←pc + 4 + (sign-extend)immediate <<2  else pc ←pc + 4   
特别说明：immediate 是从 PC+4 地址开始和转移到的指令之间指令条数。immediate 符号扩展之后左移 2 位再相加。为什么要左移 2 位？由于跳转到的指令地址肯定是 4 的倍数（每条指令占 4 个字节），最低两位是“00”，因此将 immediate 放进指令码中的时候，是右移了 2 位的，也就是以上说的“指令之间指令条数”。   
13.	bne  rs,rt,immediate      

110001| 	rs(5 位) |	rt(5 位) 	|immediate(16 位) 
-|-|-|-|
功能：if(rs!=rt) pc←pc + 4 + (sign-extend)immediate <<2  else pc ←pc + 4   
特别说明：与 beq 不同点是，不等时转移，相等时顺序执行。   
14.	bltz  rs,immediate     

110010| 	rs(5 位) |	00000 	|immediate(16 位) 
-|-|-|-|
功能：if(rs<$zero) pc←pc + 4 + (sign-extend)immediate <<2  else pc ←pc + 4。 
 
==>跳转指令   
（15）j  addr     

|111000 	|addr[27:2]
-|-| 
功能：pc <－{(pc+4)[31:28],addr[27:2],2'b00}，无条件跳转。   
说明：由于 MIPS32 的指令代码长度占 4 个字节，所以指令地址二进制数最低 2 位均为 0，将指令地址放进指令代码中时，可省掉！这样，除了最高 6 位操作码外，还有 26 位可用于存放地址，事实上，可存放 28 位地址，剩下最高 4 位由 pc+4 最高 4 位拼接上。   
 
==> 停机指令   
（16）halt  

111111 |	00000000000000000000000000(26 位) 
-|-|
功能：停机；不改变 PC 的值，PC 保持不变。 

## 三.	实验原理 
简述实验原理和方法，必须有数据通路图及相关图。   
单周期 CPU 指的是一条指令的执行在一个时钟周期内完成，然后开始下一条指令的执行，即一条指令用一个时钟周期完成。电平从低到高变化的瞬间称为时钟上升沿，两个相邻时钟上升沿之间的时间间隔称为一个时钟周期。时钟周期一般也称振荡周期（如果晶振的输出没有经过分频就直接作为 CPU 的工作时钟，则时钟周期就等于振荡周期。若振荡周期经二分频后形成
时钟脉冲信号作为 CPU 的工作时钟，这样，时钟周期就是振荡周期的两倍。） 
### CPU 在处理指令时，一般需要经过以下几个步骤： 
1.	取指令(IF)：根据程序计数器 PC 中的指令地址，从存储器中取出一条指令，同时，
PC 根据指令字长度自动递增产生下一条指令所需要的指令地址，但遇到“地址转移”指令时，则控制器把“转移地址”送入 PC，当然得到的“地址”需要做些变换才送入 PC。 
2.	指令译码(ID)：对取指令操作中得到的指令进行分析并译码，确定这条指令需要完成的操作，从而产生相应的操作控制信号，用于驱动执行状态中的各种操作。 
3.	指令执行(EXE)：根据指令译码得到的操作控制信号，具体地执行指令动作，然后转移到结果写回状态。 
4.	存储器访问(MEM)：所有需要访问存储器的操作都将在这个步骤中执行，该步骤给出存储器的数据地址，把数据写入到存储器中数据地址所指定的存储单元或者从存储器中得到数据地址单元中的数据。 
5.	结果写回(WB)：指令执行的结果或者访问存储器中得到的数据写回相应的目的寄存器中。 

### 单周期 CPU，是在一个时钟周期内完成这五个阶段的处理。 
![](picture\sing-1.PNG)  
### 图 1  单周期 CPU 指令处理过程 
MIPS 指令的三种格式： 
![](picture\sing-2.jpg)
其中， op：为操作码；  
rs：只读。为第 1 个源操作数寄存器，寄存器地址（编号）是 00000~11111，00~1F； rt：可读可写。为第 2 个源操作数寄存器，或目的操作数寄存器，寄存器地址（同上）； rd：只写。为目的操作数寄存器，寄存器地址（同上）；  
sa：为位移量（shift amt），移位指令用于指定移多少位；  
funct：为功能码，在寄存器类型指令中（R 类型）用来指定指令的功能与操作码配合使用；  
immediate：为 16 位立即数，用作无符号的逻辑操作数、有符号的算术操作数、数据加载（Laod）/数据保存（Store）指令的数据地址字节偏移量和分支指令中相对程序计数器（PC）的有符号偏移量；  
address：为地址。   
### 图 2  单周期 CPU 数据通路和控制线路图  
![](picture\sing-3.jpg)
图2是一个简单的基本上能够在单周期CPU上完成所要求设计的指令功能的数据通路和必要的控制线路图。其中指令和数据各存储在不同存储器中，即有指令存储器和数据存储器。访问存储器时，先给出内存地址，然后由读或写信号控制操作。对于寄存器组，先给出寄存器地址，读操作时不需要时钟信号，输出端就直接输出相应数据；而在写操作时，在 WE 使能信号为 1 时，在时钟边沿触发将数据写入寄存器。图中控制信号作用如表 1 所示，表 2 是 ALU 运算功能表。   
### 表 1 控制信号的作用相关部件及引脚说明： 

控制信号名 |	状态“0” |	状态“1” 
-|-|-|
Reset |	初始化 PC 为 0 |	PC 接收新地址 
PCWre |	PC 不更改，相关指令：halt 	|PC 更改，相关指令：除指令 halt 外 
ALUSrcA |	来自寄存器堆 data1 输出，相关指令：add、sub、addiu、or、and、 andi、ori、slti、beq、bne、bltz、 sw、lw | 来自移位数 sa，同时，进行(zero-extend)sa，即 {{27{1'b0}},sa}，相关指令：sll 
ALUSrcB |	来自寄存器堆 data2 输出，相关指令：add、sub、or、and、beq、bne、bltz |	来自 sign 或 zero 扩展的立即数，相关指令：addi、andi、ori、slti、sw、lw 
DBDataSrc |	来自 ALU 运算结果的输出，相关指令：add、addiu、sub、ori、or、 and、andi、slti、sll |	来自数据存储器（Data MEM）的输出，相关指令：lw 
RegWre |	无写寄存器组寄存器，相关指令： beq、bne、bltz、sw、halt |	寄存器组写使能，相关指令：add、addiu、sub、ori、or、and、andi、slti、sll、lw 
InsMemRW |	写指令存储器 |	读指令存储器(Ins. Data) 
mRD |	输出高阻态 |	读数据存储器，相关指令：lw 
mWR |	无操作 |	写数据存储器，相关指令：sw 
RegDst |	写寄存器组寄存器的地址，来自 rt字段，相关指令：addiu、andi、ori、 slti、lw |	写寄存器组寄存器的地址，来自 rd 字段，相关指令：add、sub、and、or、 sll 
ExtSel |	(zero-extend)immediate（0 扩展），相关指令：andi、ori |	(sign-extend)immediate（符号扩展），相关指令：addiu、slti、sw、lw、 beq、bne、bltz 
PCSrc[1..0]  |	00：pc<－pc+4，相关指令：add、addiu、sub、or、ori、and、andi、 slti、sll、sw、lw、beq(zero=0)、bne(zero=1)、bltz(sign=0)；01：pc<－pc+4+(sign-extend)immediate<<2，相关指令：beq(zero=1)、 bne(zero=0)、bltz(sign=1)； | 10：pc<－{(pc+4)[31:28],addr[27:2],2'b00}，相关指令：j； 11：未用 
ALUOp[2..0] |	ALU 8 种运算功能选择(000-111)，看功能表 |

### Instruction Memory：指令存储器，  
1. Iaddr，指令存储器地址输入端口
2. IDataIn，指令存储器数据输入端口（指令代码输入端口）  
3. IDataOut，指令存储器数据输出端口（指令代码输出端口） 
4. RW，指令存储器读写控制信号，为 0 写，为 1 读 
### Data Memory：数据存储器， 
  1. Daddr，数据存储器地址输入端口   
  2. DataIn，数据存储器数据输入端口 
  3. DataOut，数据存储器数据输出端口 
  4. /RD，数据存储器读控制信号，为 0 读 
  5. /WR，数据存储器写控制信号，为 0 写 
### Register File：寄存器组 
  1. Read Reg1，rs 寄存器地址输入端口   
  2. Read Reg2，rt 寄存器地址输入端口 
  3. Write Reg，将数据写入的寄存器端口，其地址来源 rt 或 rd 字段 
  4. Write Data，写入寄存器的数据输入端口 
  5. Read Data1，rs 寄存器数据输出端口   
  6. Read Data2，rt 寄存器数据输出端口 
  7. WE，写使能信号，为 1 时，在时钟边沿触发写入 
### ALU：  算术逻辑单元 
  1. result，ALU 运算结果   
  2. zero，运算结果标志，结果为 0，则 zero=1；否则 zero=0 
  3. sign，运算结果标志，结果最高位为 0，则 sign=0，正数；否则，sign=1，负数 
 
### 表 2 ALU 运算功能表         

ALUOp[2..0] |	功能 |	描述 
-|-|-|
 000|	Y = A + B |	加 
001|	Y = A – B| 	减 
010|	Y = B<<A| 	B 左移 A 位 
011| 	Y = A ∨ B| 	或 
100|	Y = A ∧ B| 	与 
101 |	Y=（A<B）?1: 0 |	比较 A<B 不带符号 
110 |	Y=(((A<B)&&(A[31] == B[31])) \|\|((A[31]==1&& B[31] == 0)))? 1:0 |	比较 A<B 带符号 
111 |	Y = A ⊕ B |	异或 
 
需要说明的是以上数据通路图是根据要实现的指令功能的要求画出来的，同时，还必须确定 ALU 的运算功能(当然，以上指令没有完全用到提供的 ALU 所有功能，但至少必须能实现以上指令功能操作)。从数据通路图上可以看出控制单元部分需要产生各种控制信号，当然，也有些信号必须要传送给控制单元。从指令功能要求和数据通路图的关系得出以上表 1，这样，从表 1 可以看出各控制信号与相应指令之间的相互关系，根据这种关系就可以得出控制信号与指令之间的关系表（留给学生完成），再根据关系表可以写出各控制信号的逻辑表达式，这样控制单元部分就可实现了。   

五.	实验过程与结果 
1. 仿真说明  首先根据数据通路，用面向对象的思想可将整个CPU程序分成PC，controlUnit，
dataMemory，instructionMemory，registerMemory，signZeroExtend，ALU，mux
（主要用于处理beq和bne的结果）和顶层模块singleCircleCPU几个模块，并且理清各部分的关系，可以看到流程图如下： 
![](picture\sing-4.jpg)

（1.	controlUnit: 
 主要代码： 
```verilog  
module controlUnit(
    input [5:0] opCode,
    input zero,
    input sign,
    output PCWre,
    output ALUSrcA,
    output ALUSrcB,
    output DBDataSrc,
    output RegWre,
    output InsMemRW,
    output mRD,
    output mWR,
    output ExtSel,
    output RegDst,
    output [1:0] PCSrc,
    output [2:0] ALUOp
    );
    assign PCWre = (opCode == 6'b111111) ? 0 : 1;
    assign DBDataSrc = (opCode == 6'b100111) ? 1 : 0;
    assign RegWre = (opCode == 6'b110000 || opCode == 6'b110001 || opCode == 6'b110010 || opCode == 6'b100110 || opCode == 6'b111111) ? 0 : 1;
    assign InsMemRW = 0;
    assign mRD = (opCode == 6'b100111) ? 1 : 0;
    assign mWR = (opCode == 6'b100110) ? 1 : 0;
    assign ExtSel = (opCode == 6'b010000 || opCode == 6'b010010) ? 0 : 1;
    assign RegDst = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b011100 || opCode == 6'b100111) ? 0 : 1;
    assign PCSrc[1] = (opCode == 6'b111000) ? 1 : 0;
    assign PCSrc[0] = ((opCode == 6'b110000 && zero == 1)||(opCode == 6'b110001 && zero == 0)||(opCode == 6'b110010 && sign == 1)) ? 1 : 0;
    assign ALUSrcA = (opCode == 6'b011000) ? 1 : 0;
    assign ALUSrcB = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b011100 || opCode == 6'b100110 || opCode == 6'b100111) ? 1 : 0;
    assign ALUOp[2] = (opCode == 6'b010001 || opCode == 6'b011100 ||opCode == 6'b010000 || opCode==6'b110000 || opCode == 6'b110001) ? 1 : 0;
    assign ALUOp[1] = (opCode == 6'b011000 || opCode == 6'b010011 || opCode == 6'b011100 || opCode == 6'b010010|| opCode==6'b110000 || opCode == 6'b110001) ? 1 : 0;
    assign ALUOp[0] = (opCode == 6'b000001 || opCode == 6'b010011 || opCode == 6'b010010|| opCode==6'b110000 || opCode == 6'b110001) ? 1 : 0;
endmodule  
```
controlUnit的主要用途是接受从instructionMemory中传入的数据，同时给各数据通路端口赋值以达到选择数据输入的目的，代码的实现主要根据控制信号表中不同指令对应的信号，为保证准确性和代码简洁性这里遵循选真不选假，选少不选多的原则。即若信号所影响的所有指令不为全集，则优先判断使信号为真的情况，若为全集，则优先考虑影响指令少的情况。   
（2.	PC：主要代码：   
```verilog
module PC(
    input clk, Reset, PCWre,
    input [1:0] PCSrc,  
    input [31:0] immediate,
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
            if (PCSrc == 2'b10) begin  //j指令
                address <= (newaddress[31:28]<<28)+(immediate[27:2]<<2)+2'b00; 
            end
            else if (PCSrc == 2'b01) begin  //beq or bne
                address <= newaddress + (immediate<<2);
            end
            else address = address + 4;
            newaddress <= address + 4;
        end  
    end  
endmodule  

```
PC的作用主要拥有指向当前指令的地址和下一条指令地址，以及实现地址跳转，根据地址跳转的类型可以将跳转分成三部分，分别为自增4，j指令,beq和bne指令，按照各指令的要求进行跳转即可。   
（3.	instructionMemory 主要代码: 
```verilog
module instructionMemory(
    input [31:0] pc,   
    output [5:0] op,   
    output [4:0] rs, rt, rd,  
    output [15:0] immediate,
    output [5:0] sa,
    output [31:0] instruction
    );
    
    reg [7:0] mem[0:127];
    reg [31:0] address;
    reg [31:0] instruction;
    initial begin
        $readmemb("E:/Xlink/VivadoProject/singleCircleCPU/instructions.txt", mem); 
    end
    
    always @(pc) begin //读取指令
        address = pc[6:2] << 2; 
        instruction = (mem[address]<<24) + (mem[address+1]<<16) + (mem[address+2]<<8) + mem[address+3];
    end
    
    assign op = instruction[31:26];  
    assign rs = instruction[25:21];  
    assign rt = instruction[20:16];  
    assign rd = instruction[15:11];  
    assign sa = instruction[10:6];
    assign immediate = instruction[15:0];

    
endmodule

```
instructionMemory主要用于读取CPU将要执行的指令并进行分析，因此整个部分分为三部分，一读取指令文件，二读取下一条指令，三分析指令的内容。用于CPU测试的指令表如下   

地址 |	汇编程序 |	指令代码 |op（6） |	rs(5) |	rt(5) |	rd(5)/immediate(16) |16 进制数代码 
-|-|-|-|-|-|-|-|
0x00000000 |	addiu  $1,$0,8 |	000010 |	00000 |	00001 |0000 0000 0000 1000 |	= 	08010008 
0x00000004| 	ori  $2,$0,2 	|010010 |	00000 |	00010 	|0000 0000 0000 0010 |	 	48020002 
0x00000008 	|add  $3,$2,$1 |	000000 |	00010 |	00001 	|00011 00000000000 	| 	00411800 
0x0000000C |	sub  $5,$3,$2 |	000001 |	00011 |	00010 	|00101 00000000000 |	 	04622800 
0x00000010 |	and  $4,$5,$2 |	010001 |	00101 |	00010 	|00100 00000000000 	| 	44A22000 
0x00000014 |	or  $8,$4,$2 |	010011 |	00100 |	00010 	|01000 00000000000 	 |	4C824000 
0x00000018 	|sll  $8,$8,1 |	011000 |	00000 | 	01000 	|01000 00001000000 |	 	60084040 
0x0000001C |	bne $8,$1,-2  (≠,转18) |	110001 |	01000 |	00001 |	1111 1111 1111 1110 	| 	C501FFFE 
0x00000020 |	slti  $6,$2,4 |	011100 |	00010 |	00110 	|0000 0000 0000 0100 |	 	70460004 
0x00000024 |	slti  $7,$6,0 |	011100 |	00110 |	00111 	|0000 0000 0000 0000 	| 	70C70000 
0x00000028 |	addiu  $7,$7,8 |	000010 |	00111 |	00111 |	0000 0000 0000 1000 	| 	08E70008 
0x0000002C |	beq $7,$1,-2  (=,转28) |	110000 |	00111 |	00001 |	1111 1111 1111 1110 	| 	C0E1FFFE 
0x00000030 |	sw  $2,4($1) |	100110 |	00001 |	00010 	|0000 0000 0000 0100 	| 	98220004 
0x00000034 |	lw  $9,4($1) |	100111 |	00001 |	01001 	|0000 0000 0000 0100 	| 	9C290004 
0x00000038 |	addiu  $10,$0,-2 |	000010 |	00000 |	01010 |	1111 1111 1111 1110 	| 	080AFFFE 
0x0000003C |	addiu  $10,$10,1 |	000010 |	01010 |	01010 |	0000 0000 0000 0001 |	 	094A0001 
0x00000040 |	bltz $10,-2(<0,转 3C) |	110010 |	01010 	|00000 |	1111 1111 1111 1110 |	 	C940FFFE 
0x00000044 |	andi  $11,$2,2 |	010000 |	00010 |	01011 |	0000 0000 0000 0010 	| 	404B0002 
0x00000048 |	j  0x00000050 |	111000 |	00000   |	00000 |	0000 0000 0011 0010 |	 	E0000050 
0x0000004C |	or  $8,$4,$2 |	010011 |	00100 |	00010 	|1000 0000 0101 0000 |	 	4C828000 
0x00000050 |	halt |	111111 |	00000 |	00000 |	0000000000000000 |	= 	FC000000 
该表中的指令将被用于接下来的仿真与写板。 
 
（4.	registerMemory 主要代码： 
```verilog
module registerFile(
    input clk, RegWre, RegDst, DBDataSrc,
    input [5:0] opCode,
    input [4:0] rs, rt, rd,
    input [10:0] im,
    input [31:0] dataFromALU, dataFromRW,  
    output [31:0] Data1, Data2
    ); 
  
    wire [4:0] writeReg;  
    wire [31:0] writeData;  
    assign writeReg = RegDst? rd : rt;
    assign writeData = DBDataSrc? dataFromRW : dataFromALU; 
    
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
  
registerMemory用于寄存器的读写，代码也比较简单，一是根据controlUnit的数据选择传入的数据，二是寄存器的初始化，然后就是寄存器的读与写，同时寄存器的写回采取时钟下降沿的方式，保证一个周期只写回一次。 
 
（5.	dataMemory 
主要代码：
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
  
dataMemory用于存储器的读写，因为存储器的操作不会引起ALU操作数的改变，因此写
回操作没有像寄存器那样使用时钟，读写时遵从大端方式，通过移位操作进行读写。 
（6.	signZeroExtend: 
主要代码：
```verilog
module signZeroExtend(
    input [15:0] immediate,
    input ExtSel,
    output [31:0] out
    );
    assign out[15:0] = immediate;
    assign out[31:16] = ExtSel? (immediate[15]? 16'hffff : 16'h0000) : 16'h0000;
endmodule
```
  通过判断立即数最高为符号来拓展立即数。 
 
（7.	ALU 
主要代码： 
```verilog
module ALU(
    input [31:0] ReadData1, 
    input [31:0] ReadData2,
    input [31:0] inExt,
    input [5:0] insa,
    input ALUSrcA, ALUSrcB,
    input [2:0] ALUopcode,
    output reg zero,
    output reg sign,
    output reg [31:0] result
    );

    wire [31:0] rega;
    wire [31:0] regb;

    assign rega = ALUSrcA ? insa :ReadData1;
    assign regb = ALUSrcB? inExt : ReadData2;
    always @(inExt or ALUSrcA or ALUSrcB or ALUopcode or rega or regb ) begin
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
        3'b111 : begin //beq,bne
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
ALU主要承担运算任务，根据ALU运算功能表来编写代码，其中beq与bne指令使用异或操作，其他操作分别对应若干相关指令。 
 
（8.	mux: 
```verilog
module mux(
    input [31:0] aluResult,
    input zero,
    input [5:0] opCode,
    output reg[31:0] writeData
    );
    always @(aluResult or zero or opCode ) begin
        if (opCode == 6'b110001) //bne
            writeData = !zero;
        else if(opCode == 6'b110000)//beq
            writeData = zero;
        else
            writeData = aluResult;
    end
endmodule
```  
选择DB总线的数据，主要是将bne与beq的结果从输出ALU运算结果变为输出运算后是否为0。    
（9.	singleCircleCPU: 
主要代码：
```verilog
module singleCircleCPU(
    input clk, Reset,
    output [31:0] instruction,
    output [31:0] rega, regb, writeData, curPC, Result,newPC
);
    wire[2:0] ALUOp;
    wire[31:0] exImmediate, DMOut;
    wire[15:0] immediate;
    wire[5:0] opCode;
    wire[4:0] rs,rt,rd;
    wire[5:0] sa;
    wire[1:0] PCSrc;
    wire sign, zero,PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre,InsMemRW, mRD, mWR, ExtSel, RegDst;

    PC pc(clk, Reset, PCWre, PCSrc, exImmediate,newPC, curPC);
    controlUnit CU(opCode, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, ExtSel, RegDst, PCSrc, ALUOp);
    dataMemory dm(writeData, regb, mRD, mWR, DMOut);
    instructionMemory im(curPC, opCode, rs, rt, rd, immediate, sa,instruction);
    registerFile registerfile(clk, RegWre, RegDst, DBDataSrc, opCode, rs, rt, rd, immediate,  writeData, DMOut, rega, regb);
    signZeroExtend sze(immediate, ExtSel, exImmediate);
    ALU alu(rega, regb, exImmediate, sa, ALUSrcA, ALUSrcB, ALUOp, zero,sign, Result);
    mux m(Result,zero,opCode,writeData);
endmodule
```
  作为顶层模块，包括输入输出接口，以及构建数据通路，将各模块所需要的数据传入模块，到此CPU的代码已经完成，接下来开始仿真。 

  ### 仿真与写板部分暂略，所有源代码已经上传至我的github当中，欢迎访问我的github  
  ### github个人主页 https://starashzero.github.io
