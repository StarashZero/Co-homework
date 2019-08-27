#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <cstring>
#include <stdlib.h>
#include <cmath>
using namespace std;

vector<string> rIns = {"add","sub","and","slt","sll","jr"};
vector<string> iIns = {"addiu","andi","ori","xori","slti","sw","lw","beq","bne","bltz"};
vector<string> jIns = {"j","jal","halt"};

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