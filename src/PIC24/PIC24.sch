VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Clk
        SIGNAL New_PC(5:0)
        SIGNAL PC(5:0)
        SIGNAL PC(5:1)
        SIGNAL Branch
        SIGNAL Instr(23:0)
        SIGNAL Instr(18:15)
        SIGNAL Instr(14:11)
        SIGNAL RegBase
        SIGNAL RegDest
        SIGNAL Instr(3:0)
        SIGNAL Instr(10:7)
        SIGNAL XLXN_54(3:0)
        SIGNAL WrReg(3:0)
        SIGNAL RegWr
        SIGNAL RdData2(15:0)
        SIGNAL Instr(8:4)
        SIGNAL ALUOP(2:0)
        SIGNAL WrData(15:0)
        SIGNAL C
        SIGNAL N
        SIGNAL OV
        SIGNAL Z
        SIGNAL Instr(18:16)
        SIGNAL INW0(15:0)
        SIGNAL INW1(15:0)
        SIGNAL OUTW0(15:0)
        SIGNAL MemWr
        SIGNAL C_EN
        SIGNAL N_EN
        SIGNAL OV_EN
        SIGNAL Z_EN
        SIGNAL Mem2Reg
        SIGNAL MemOut(15:0)
        SIGNAL ALUOut(15:0)
        SIGNAL RdData1(15:0)
        SIGNAL Instr(23:19)
        SIGNAL Instr(15:12)
        SIGNAL Instr(4:0)
        SIGNAL PreviousCarry
        PORT Input Clk
        PORT Input INW0(15:0)
        PORT Input INW1(15:0)
        PORT Output OUTW0(15:0)
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2020 12 29 14 55 29
            RECTANGLE N 368 -204 432 -180 
            LINE N 368 -192 432 -192 
            LINE N 64 0 0 0 
            LINE N 64 -128 0 -128 
            LINE N 64 -64 0 -64 
            LINE N 64 -192 0 -192 
            RECTANGLE N 0 292 64 316 
            LINE N 64 304 0 304 
            RECTANGLE N 0 228 64 252 
            LINE N 64 240 0 240 
            RECTANGLE N 0 100 64 124 
            LINE N 64 112 0 112 
            RECTANGLE N 64 -220 368 416 
            LINE N 64 176 0 176 
            LINE N 432 368 368 368 
        END BLOCKDEF
        BEGIN BLOCKDEF ProgCnt
            TIMESTAMP 2020 11 18 19 36 48
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32x24
            TIMESTAMP 2020 12 30 23 2 33
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX_B
            TIMESTAMP 2020 11 18 19 37 28
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX_D
            TIMESTAMP 2021 1 12 0 24 28
            RECTANGLE N 64 -192 320 0 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            LINE N 64 -48 0 -48 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF File_Regs
            TIMESTAMP 2020 11 23 19 27 32
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 64 -432 0 -432 
            LINE N 64 -368 0 -368 
            RECTANGLE N 64 -464 384 4 
            RECTANGLE N 384 -444 448 -420 
            LINE N 384 -432 448 -432 
            RECTANGLE N 384 -380 448 -356 
            LINE N 384 -368 448 -368 
            RECTANGLE N 0 -284 64 -260 
            LINE N 64 -272 0 -272 
            RECTANGLE N 0 -220 64 -196 
            LINE N 64 -208 0 -208 
        END BLOCKDEF
        BEGIN BLOCKDEF ALU
            TIMESTAMP 2021 1 12 0 0 8
            LINE N 64 416 0 416 
            RECTANGLE N 0 276 64 300 
            LINE N 64 288 0 288 
            RECTANGLE N 0 340 64 364 
            LINE N 64 352 0 352 
            LINE N 64 32 0 32 
            LINE N 64 96 0 96 
            LINE N 64 160 0 160 
            LINE N 64 224 0 224 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -220 64 -196 
            LINE N 64 -208 0 -208 
            RECTANGLE N 0 -60 64 -36 
            LINE N 64 -48 0 -48 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 0 -156 64 -132 
            LINE N 64 -144 0 -144 
            RECTANGLE N 64 -320 320 448 
        END BLOCKDEF
        BEGIN BLOCKDEF DataMem
            TIMESTAMP 2020 11 18 19 38 58
            RECTANGLE N 64 -384 368 0 
            LINE N 64 -352 0 -352 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 368 -364 432 -340 
            LINE N 368 -352 432 -352 
            RECTANGLE N 368 -44 432 -20 
            LINE N 368 -32 432 -32 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V16
            TIMESTAMP 2021 1 12 0 8 47
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            RECTANGLE N 0 -60 64 -36 
            LINE N 64 -48 0 -48 
            RECTANGLE N 0 -124 64 -100 
            LINE N 64 -112 0 -112 
        END BLOCKDEF
        BEGIN BLOCKDEF ctrl
            TIMESTAMP 2021 1 12 0 11 6
            RECTANGLE N 64 -704 320 0 
            RECTANGLE N 0 -684 64 -660 
            LINE N 64 -672 0 -672 
            LINE N 320 -672 384 -672 
            LINE N 320 -608 384 -608 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCK U_PC ProgCnt
            PIN Clk Clk
            PIN New_PC(5:0) New_PC(5:0)
            PIN PC(5:0) PC(5:0)
        END BLOCK
        BEGIN BLOCK U_New_PC PC_Update
            PIN N N
            PIN OV OV
            PIN Z Z
            PIN C C
            PIN Offset(4:0) Instr(4:0)
            PIN BranchType(2:0) Instr(18:16)
            PIN PC(5:0) PC(5:0)
            PIN New_PC(5:0) New_PC(5:0)
            PIN Branch Branch
            PIN CarryOUT PreviousCarry
        END BLOCK
        BEGIN BLOCK U_ROM ROM32x24
            PIN Addr(4:0) PC(5:1)
            PIN Data(23:0) Instr(23:0)
        END BLOCK
        BEGIN BLOCK U_MUX_RegB MUX_B
            PIN Sel RegBase
            PIN I0(3:0) Instr(14:11)
            PIN I1(3:0) Instr(18:15)
            PIN Y(3:0) XLXN_54(3:0)
        END BLOCK
        BEGIN BLOCK U_MUX_RegD MUX_D
            PIN Sel RegDest
            PIN I0(3:0) Instr(3:0)
            PIN I1(3:0) Instr(10:7)
            PIN Y(3:0) WrReg(3:0)
        END BLOCK
        BEGIN BLOCK U_Regs File_Regs
            PIN Clk Clk
            PIN WrEn RegWr
            PIN RdRegB(3:0) XLXN_54(3:0)
            PIN RdRegD(3:0) Instr(3:0)
            PIN WrReg(3:0) WrReg(3:0)
            PIN WrData(15:0) WrData(15:0)
            PIN RdDataB(15:0) RdData1(15:0)
            PIN RdDataS(15:0) RdData2(15:0)
        END BLOCK
        BEGIN BLOCK U_ALU ALU
            PIN Clk Clk
            PIN C_EN C_EN
            PIN N_EN N_EN
            PIN OV_EN OV_EN
            PIN Z_EN Z_EN
            PIN CarryIN PreviousCarry
            PIN RdData1(15:0) RdData1(15:0)
            PIN RdData2(15:0) RdData2(15:0)
            PIN BTG_lit4(3:0) Instr(15:12)
            PIN SUBB_lit5(4:0) Instr(4:0)
            PIN ALUOP(2:0) ALUOP(2:0)
            PIN C C
            PIN N N
            PIN OV OV
            PIN Z Z
            PIN Y(15:0) ALUOut(15:0)
        END BLOCK
        BEGIN BLOCK U_DataMem DataMem
            PIN Clk Clk
            PIN Wr MemWr
            PIN INW0(15:0) INW0(15:0)
            PIN INW1(15:0) INW1(15:0)
            PIN Addr(4:0) Instr(8:4)
            PIN DataIn(15:0) RdData2(15:0)
            PIN OUTW0(15:0) OUTW0(15:0)
            PIN DataOut(15:0) MemOut(15:0)
        END BLOCK
        BEGIN BLOCK U_MUX2V16 MUX2V16
            PIN Sel Mem2Reg
            PIN I0(15:0) ALUOut(15:0)
            PIN I1(15:0) MemOut(15:0)
            PIN Y(15:0) WrData(15:0)
        END BLOCK
        BEGIN BLOCK U_CTRL ctrl
            PIN OP(4:0) Instr(23:19)
            PIN MemWr MemWr
            PIN Mem2Reg Mem2Reg
            PIN RegWr RegWr
            PIN RegDest RegDest
            PIN RegBase RegBase
            PIN Branch Branch
            PIN C_EN C_EN
            PIN Z_EN Z_EN
            PIN OV_EN OV_EN
            PIN N_EN N_EN
            PIN ALUOP(2:0) ALUOP(2:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        BEGIN BRANCH Clk
            WIRE 256 1072 288 1072
        END BRANCH
        BEGIN BRANCH PC(5:0)
            WIRE 672 848 736 848
            WIRE 736 848 736 912
            WIRE 736 912 736 1072
            WIRE 736 1072 736 1152
            WIRE 736 1152 736 1216
            WIRE 672 1072 736 1072
            BEGIN DISPLAY 736 912 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PC(5:1)
            WIRE 832 1152 848 1152
            WIRE 848 1152 912 1152
            BEGIN DISPLAY 848 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 736 1152 832 1152
        BEGIN BRANCH Branch
            WIRE 672 720 768 720
            WIRE 768 720 880 720
            BEGIN DISPLAY 768 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ROM 912 1184 R0
            BEGIN DISPLAY 128 40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BUSTAP 1344 784 1248 784
        BUSTAP 1344 976 1440 976
        BEGIN BRANCH Instr(18:15)
            WIRE 1440 976 1504 976
            WIRE 1504 976 1600 976
            BEGIN DISPLAY 1504 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 1040 1440 1040
        BEGIN BRANCH Instr(14:11)
            WIRE 1440 1040 1504 1040
            WIRE 1504 1040 1600 1040
            BEGIN DISPLAY 1504 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 1472 912 1536 912
            WIRE 1536 912 1600 912
            BEGIN DISPLAY 1536 912 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 1472 1488 1552 1488
            WIRE 1552 1488 1632 1488
            BEGIN DISPLAY 1552 1488 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 1184 1440 1184
        BEGIN INSTANCE U_MUX_RegB 1600 1072 R0
            BEGIN DISPLAY 128 24 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN INSTANCE U_MUX_RegD 1632 1536 R0
            BEGIN DISPLAY 96 24 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Instr(3:0)
            WIRE 1440 1184 1456 1184
            WIRE 1456 1184 1456 1440
            WIRE 1456 1440 1632 1440
            WIRE 1456 1184 1568 1184
            WIRE 1568 1184 1648 1184
            WIRE 1648 1136 2240 1136
            WIRE 1648 1136 1648 1184
            BEGIN DISPLAY 1568 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 1376 1440 1376
        BEGIN BRANCH Instr(10:7)
            WIRE 1440 1376 1552 1376
            WIRE 1552 1376 1632 1376
            BEGIN DISPLAY 1552 1376 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_54(3:0)
            WIRE 1984 1040 2000 1040
            WIRE 2000 1040 2000 1072
            WIRE 2000 1072 2240 1072
        END BRANCH
        BEGIN BRANCH WrReg(3:0)
            WIRE 2016 1376 2048 1376
            WIRE 2048 1248 2048 1376
            WIRE 2048 1248 2144 1248
            WIRE 2144 1248 2240 1248
            BEGIN DISPLAY 2144 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 2176 912 2240 912
            BEGIN DISPLAY 2176 912 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2128 976 2192 976
            WIRE 2192 976 2240 976
            BEGIN DISPLAY 2192 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_Regs 2240 1344 R0
            BEGIN DISPLAY 176 40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH RdData1(15:0)
            WIRE 2688 912 2832 912
            WIRE 2832 912 3056 912
            BEGIN DISPLAY 2832 912 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 256 1072 Clk R180 28
        BEGIN BRANCH Instr(23:0)
            WIRE 1296 1152 1344 1152
            WIRE 1344 1152 1344 1184
            WIRE 1344 1184 1344 1376
            WIRE 1344 1376 1344 1600
            WIRE 1344 1600 1344 1792
            WIRE 1344 1792 1344 2000
            WIRE 1344 2000 1344 2128
            WIRE 1344 768 1344 784
            WIRE 1344 784 1344 976
            WIRE 1344 976 1344 1040
            WIRE 1344 1040 1344 1152
            BEGIN DISPLAY 1344 2000 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 1600 1440 1600
        BEGIN BRANCH Instr(8:4)
            WIRE 1440 1600 1440 1648
            WIRE 1440 1648 1536 1648
            WIRE 1536 1648 3648 1648
            WIRE 3648 1088 3936 1088
            WIRE 3648 1088 3648 1648
            BEGIN DISPLAY 1536 1648 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 2896 1072 2976 1072
            WIRE 2976 1072 3056 1072
            BEGIN DISPLAY 2976 1072 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrData(15:0)
            WIRE 2208 1312 2240 1312
            WIRE 2208 1312 2208 1616
            WIRE 2208 1616 2816 1616
            WIRE 2816 1616 4992 1616
            WIRE 4960 1104 4992 1104
            WIRE 4992 1104 4992 1616
            BEGIN DISPLAY 2816 1616 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH New_PC(5:0)
            WIRE 144 352 144 720
            WIRE 144 720 144 1136
            WIRE 144 1136 288 1136
            WIRE 144 352 240 352
            BEGIN DISPLAY 144 720 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_New_PC 672 544 M0
            BEGIN DISPLAY -128 -344 ATTR InstName
                ALIGNMENT RIGHT
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Z
            WIRE 672 352 752 352
            WIRE 752 352 800 352
            BEGIN DISPLAY 752 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N
            WIRE 672 480 736 480
            WIRE 736 480 800 480
            BEGIN DISPLAY 736 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 672 544 736 544
            WIRE 736 544 800 544
            BEGIN DISPLAY 736 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV
            WIRE 672 416 752 416
            WIRE 752 416 800 416
            BEGIN DISPLAY 752 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_PC 288 1168 R0
            BEGIN DISPLAY 112 24 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Instr(18:16)
            WIRE 672 656 736 656
            WIRE 736 656 880 656
            BEGIN DISPLAY 736 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ALU 3056 1120 R0
            BEGIN DISPLAY 128 472 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Clk
            WIRE 3008 832 3056 832
            BEGIN DISPLAY 3008 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_DataMem 3936 1184 R0
            BEGIN DISPLAY 128 24 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH INW0(15:0)
            WIRE 3904 896 3936 896
        END BRANCH
        BEGIN BRANCH INW1(15:0)
            WIRE 3904 960 3936 960
        END BRANCH
        BEGIN BRANCH OUTW0(15:0)
            WIRE 4368 832 4400 832
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 3792 1024 3856 1024
            WIRE 3856 1024 3936 1024
            BEGIN DISPLAY 3856 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 3808 832 3936 832
            BEGIN DISPLAY 3808 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C_EN
            WIRE 2928 1152 2992 1152
            WIRE 2992 1152 3056 1152
            BEGIN DISPLAY 2992 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N_EN
            WIRE 2928 1216 2992 1216
            WIRE 2992 1216 3056 1216
            BEGIN DISPLAY 2992 1216 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV_EN
            WIRE 2928 1280 2992 1280
            WIRE 2992 1280 3056 1280
            BEGIN DISPLAY 2992 1280 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z_EN
            WIRE 2928 1344 2992 1344
            WIRE 2992 1344 3056 1344
            BEGIN DISPLAY 2992 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 4448 1104 4512 1104
            WIRE 4512 1104 4576 1104
            BEGIN DISPLAY 4512 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemOut(15:0)
            WIRE 4368 1152 4480 1152
            WIRE 4480 1152 4576 1152
            BEGIN DISPLAY 4480 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOut(15:0)
            WIRE 3440 1088 3488 1088
            WIRE 3488 1088 3488 1248
            WIRE 3488 1248 4384 1248
            WIRE 4384 1248 4528 1248
            WIRE 4528 1216 4576 1216
            WIRE 4528 1216 4528 1248
            BEGIN DISPLAY 4384 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 3440 832 3488 832
            WIRE 3488 832 3552 832
            BEGIN DISPLAY 3488 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N
            WIRE 3440 896 3488 896
            WIRE 3488 896 3552 896
            BEGIN DISPLAY 3488 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV
            WIRE 3440 960 3488 960
            WIRE 3488 960 3552 960
            BEGIN DISPLAY 3488 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z
            WIRE 3440 1024 3488 1024
            WIRE 3488 1024 3552 1024
            BEGIN DISPLAY 3488 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 3904 896 INW0(15:0) R180 28
        IOMARKER 3904 960 INW1(15:0) R180 28
        IOMARKER 4400 832 OUTW0(15:0) R0 28
        BEGIN BRANCH RdData2(15:0)
            WIRE 2688 976 2864 976
            WIRE 2864 976 3056 976
            BEGIN DISPLAY 2864 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdData2(15:0)
            WIRE 3744 1152 3824 1152
            WIRE 3824 1152 3936 1152
            BEGIN DISPLAY 3824 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 1792 1440 1792
        BEGIN BRANCH RegBase
            WIRE 1968 2048 2016 2048
            WIRE 2016 2048 2144 2048
            BEGIN DISPLAY 2016 2048 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Z_EN
            WIRE 1968 2240 2016 2240
            WIRE 2016 2240 2144 2240
            BEGIN DISPLAY 2016 2240 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 1968 2432 2048 2432
            WIRE 2048 2432 2144 2432
            BEGIN DISPLAY 2048 2432 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(15:12)
            WIRE 2912 1408 2976 1408
            WIRE 2976 1408 3056 1408
            BEGIN DISPLAY 2976 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 672 784 928 784
            WIRE 928 784 1248 784
            BEGIN DISPLAY 928 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 2912 1472 2992 1472
            WIRE 2992 1472 3056 1472
            BEGIN DISPLAY 2992 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_MUX2V16 4576 1264 R0
            BEGIN DISPLAY 128 24 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH C_EN
            WIRE 1968 2176 2032 2176
            WIRE 2032 2176 2144 2176
            BEGIN DISPLAY 2032 2176 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 1968 1856 2048 1856
            WIRE 2048 1856 2144 1856
            BEGIN DISPLAY 2048 1856 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N_EN
            WIRE 1968 2368 2048 2368
            WIRE 2048 2368 2144 2368
            BEGIN DISPLAY 2048 2368 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV_EN
            WIRE 1968 2304 2048 2304
            WIRE 2048 2304 2144 2304
            BEGIN DISPLAY 2048 2304 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch
            WIRE 1968 2112 2032 2112
            WIRE 2032 2112 2144 2112
            BEGIN DISPLAY 2032 2112 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 1968 1984 2016 1984
            WIRE 2016 1984 2144 1984
            BEGIN DISPLAY 2016 1984 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 1968 1920 2016 1920
            WIRE 2016 1920 2144 1920
            BEGIN DISPLAY 2016 1920 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 1968 1792 2048 1792
            WIRE 2048 1792 2128 1792
            BEGIN DISPLAY 2048 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(23:19)
            WIRE 1440 1792 1472 1792
            WIRE 1472 1792 1584 1792
            BEGIN DISPLAY 1472 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_CTRL 1584 2464 R0
            BEGIN DISPLAY 144 24 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH PreviousCarry
            WIRE 160 912 208 912
            WIRE 208 912 240 912
            BEGIN DISPLAY 208 912 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PreviousCarry
            WIRE 2912 1536 2992 1536
            WIRE 2992 1536 3056 1536
            BEGIN DISPLAY 2992 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
