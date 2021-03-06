(G-CODE GENERATED BY FLATCAM v8.994 - www.flatcam.org - Version Date: 2020/11/7)

(Name: Gerber_Drill_PTH.DRL_cnc)
(Type: G-code from Geometry)
(Units: MM)

(Created on Friday, 05 March 2021 at 15:05)

(This preprocessor is used with a motion controller loaded with GRBL firmware.)
(It is configured to be compatible with almost any version of GRBL firmware.)


(TOOLS DIAMETER: )
(Tool: 1 -> Dia: 0.712)
(Tool: 2 -> Dia: 0.8)
(Tool: 3 -> Dia: 0.9)
(Tool: 4 -> Dia: 0.915)
(Tool: 5 -> Dia: 1.0)
(Tool: 6 -> Dia: 1.25)
(Tool: 7 -> Dia: 1.4)

(FEEDRATE Z: )
(Tool: 1 -> Feedrate: 40.0)
(Tool: 2 -> Feedrate: 40.0)
(Tool: 3 -> Feedrate: 40.0)
(Tool: 4 -> Feedrate: 40.0)
(Tool: 5 -> Feedrate: 40.0)
(Tool: 6 -> Feedrate: 40.0)
(Tool: 7 -> Feedrate: 40.0)

(FEEDRATE RAPIDS: )
(Tool: 1 -> Feedrate Rapids: 1500)
(Tool: 2 -> Feedrate Rapids: 1500)
(Tool: 3 -> Feedrate Rapids: 1500)
(Tool: 4 -> Feedrate Rapids: 1500)
(Tool: 5 -> Feedrate Rapids: 1500)
(Tool: 6 -> Feedrate Rapids: 1500)
(Tool: 7 -> Feedrate Rapids: 1500)

(Z_CUT: )
(Tool: 1 -> Z_Cut: -1.8)
(Tool: 2 -> Z_Cut: -1.8)
(Tool: 3 -> Z_Cut: -1.8)
(Tool: 4 -> Z_Cut: -1.8)
(Tool: 5 -> Z_Cut: -1.8)
(Tool: 6 -> Z_Cut: -1.8)
(Tool: 7 -> Z_Cut: -1.8)

(Tools Offset: )
(Tool: 5 -> Offset Z: 0.0)
(Tool: 4 -> Offset Z: 0.0)
(Tool: 3 -> Offset Z: 0.0)
(Tool: 6 -> Offset Z: 0.0)
(Tool: 1 -> Offset Z: 0.0)
(Tool: 2 -> Offset Z: 0.0)
(Tool: 7 -> Offset Z: 0.0)

(Z_MOVE: )
(Tool: 1 -> Z_Move: 2)
(Tool: 2 -> Z_Move: 2)
(Tool: 3 -> Z_Move: 2)
(Tool: 4 -> Z_Move: 2)
(Tool: 5 -> Z_Move: 2)
(Tool: 6 -> Z_Move: 2)
(Tool: 7 -> Z_Move: 2)

(Z Toolchange: 2.0 mm)
(X,Y Toolchange: 0.0000, 0.0000 mm)
(Z Start: None mm)
(Z End: 0.5 mm)
(X,Y End: None mm)
(Steps per circle: 64)
(Steps per circle: 64)
(Preprocessor Excellon: GRBL_11_no_M6)

(X range:   15.3019 ...   64.2579  mm)
(Y range:    9.9680 ...   55.8220  mm)

(Spindle Speed: 400 RPM)
G21
G90
G17
G94


G01 F40.00

M5             
G00 Z2.0000
G00 X0.0000 Y0.0000                
T1
(MSG, Change to Tool Dia = 0.7120 ||| Total drills for tool T1 = 58)
M0
G00 Z2.0000
        
G01 F40.00
M03 S400
G00 X61.2679 Y23.2410
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X61.2679 Y23.2410
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X61.2679 Y28.3210
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X58.8549 Y32.3850
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X63.8079 Y32.3850
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X63.8079 Y40.0050
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X58.8549 Y40.0050
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y38.9890
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y36.4490
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y33.9090
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y31.3690
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y28.8290
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y26.2890
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y23.7490
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y21.2090
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y18.6690
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y16.1290
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y13.5890
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y13.5890
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y16.1290
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y18.6690
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y21.2090
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y23.7490
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y26.2890
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y28.8290
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y31.3690
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y33.9090
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y36.4490
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y38.9890
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y41.5290
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y44.0690
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y46.6090
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X38.5349 Y49.1490
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X34.2449 Y49.2760
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X31.8039 Y55.3720
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X24.1839 Y55.3720
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X25.0449 Y49.2760
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X24.8189 Y42.8270
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X28.7559 Y42.1640
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X28.7559 Y34.5440
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X24.8189 Y33.6270
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X20.8819 Y29.4640
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X18.3419 Y31.6230
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X15.8019 Y29.4640
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X18.2149 Y36.4490
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X18.2149 Y40.2590
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X18.0879 Y48.0060
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X18.0879 Y51.8160
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X29.3909 Y28.9050
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X29.3909 Y22.4030
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X17.9609 Y18.2880
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X17.9609 Y14.4780
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X17.9609 Y10.6680
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y41.5290
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y44.0690
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y46.6090
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X53.7749 Y49.1490
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X61.0139 Y47.2280
G01 Z-1.8000
G01 Z0
G00 Z2.0000
G00 X61.0139 Y45.2280
G01 Z-1.8000
G01 Z0
G00 Z2.0000
M05
G00 Z0.50


