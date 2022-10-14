include <bit/boardgame_insert_toolkit_lib.2.scad>;

// determines whether lids are output.
g_b_print_lid = true;

// determines whether boxes are output.
g_b_print_box = true; 

// Focus on one box
g_isolated_print_box = ""; 

// Used to visualize how all of the boxes fit together. 
g_b_visualization = f;          
        
// this is the outer wall thickness. 
//Default = 1.5mm
g_wall_thickness = 1.5;

// The tolerance value is extra space put between planes of the lid and box that fit together.
// Increase the tolerance to loosen the fit and decrease it to tighten it.
//
// Note that the tolerance is applied exclusively to the lid.
// So if the lid is too tight or too loose, change this value ( up for looser fit, down for tighter fit ) and 
// you only need to reprint the lid.
// 
// The exception is the stackable box, where the bottom of the box is the lid of the box below,
// in which case the tolerance also affects that box bottom.
//
g_tolerance = 0.15;

// This adjusts the position of the lid detents downward. 
// The larger the value, the bigger the gap between the lid and the box.
g_tolerance_detents_pos = 0.1;

// Scout

box_height = 59;
box_width = 104;
box_deep = 34; 

card_height = 59;
card_width = 97;
card_deep = 14;

start = (box_width-card_width)/2-g_wall_thickness;
token_deep = 20;

t1_height = box_height-(2*g_wall_thickness);
t1_width = 29;
t1_deep = token_deep;

t2_height = box_height-(2*g_wall_thickness);
t2_width = 25;
t2_deep = token_deep;

start_r = 38;
start_deep = 3;

car_height = 39;
car_width = box_width-(2*start)-(4*g_wall_thickness)-t1_width-t2_width;
car_deep = token_deep;

card_hand = 28;

tsq_height = 16;
tsq_width = car_width;
tsq_deep = token_deep;

data =
[
    [   "scout",
        [
            [ BOX_SIZE_XYZ, [box_height, box_width, box_deep] ],     
            [ BOX_NO_LID_B, true],
            [ BOX_COMPONENT,                            
                [
                   [ CMP_COMPARTMENT_SIZE_XYZ,  [ card_height, card_width, card_deep]]
                ],
            ],
            [ BOX_COMPONENT,                            
                [
                   [ CMP_COMPARTMENT_SIZE_XYZ,  [ card_hand, box_width, card_hand/2]],
                   [ CMP_SHAPE, ROUND]
                ],
            ],
            [ BOX_COMPONENT,
                [
                   [ CMP_COMPARTMENT_SIZE_XYZ,  [ t1_height, t1_width, card_deep+t1_deep]],
                   //[ CMP_CUTOUT_SIDES_4B, [f , f, f, t]],
                   [POSITION_XY,               [CENTER,start]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                   [ CMP_COMPARTMENT_SIZE_XYZ,  [ t2_height, t2_width, card_deep+t2_deep]],
                   [POSITION_XY,               [CENTER,start+g_wall_thickness+t1_width]],
                ]
            ],
            /*[ BOX_COMPONENT,
                [
                   [ CMP_COMPARTMENT_SIZE_XYZ,  [ start_r, start_r, card_deep+start_deep]],
                   [POSITION_XY,               [CENTER,start+g_wall_thickness*6+t1_width+start_r/2]],
                   [ CMP_SHAPE, ROUND ],
                   [CMP_SHAPE_VERTICAL_B,                   t],
                ]
            ],*/
            [ BOX_COMPONENT,
                [
                   [ CMP_COMPARTMENT_SIZE_XYZ,  [ car_height, car_width, card_deep+car_deep]],
                   [POSITION_XY,               [0,start+g_wall_thickness*2+t1_width+t2_width]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                   [ CMP_COMPARTMENT_SIZE_XYZ,  [ tsq_height, tsq_width, card_deep+tsq_deep]],
                   [POSITION_XY,                [g_wall_thickness+car_height,start+g_wall_thickness*2+t1_width+t2_width]],
                ]
            ]
        ]
     ]
];


MakeAll();