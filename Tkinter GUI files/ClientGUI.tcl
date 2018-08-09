#############################################################################
# Generated by PAGE version 4.14
# in conjunction with Tcl version 8.6
set vTcl(timestamp) ""


if {!$vTcl(borrow)} {

set vTcl(actual_gui_bg) #d9d9d9
set vTcl(actual_gui_fg) #000000
set vTcl(actual_gui_menu_bg) #d9d9d9
set vTcl(actual_gui_menu_fg) #000000
set vTcl(complement_color) #d9d9d9
set vTcl(analog_color_p) #d9d9d9
set vTcl(analog_color_m) #d9d9d9
set vTcl(active_fg) #000000
set vTcl(actual_gui_menu_active_bg)  #d8d8d8
set vTcl(active_menu_fg) #000000
}

#############################################################################
# vTcl Code to Load User Fonts

vTcl:font:add_font \
    "-family {Abadi MT Condensed Extra Bold} -size 20 -weight bold -slant roman -underline 0 -overstrike 0" \
    user \
    vTcl:font10
vTcl:font:add_font \
    "-family {Segoe UI} -size 10 -weight normal -slant roman -underline 0 -overstrike 0" \
    user \
    vTcl:font9
#################################
#LIBRARY PROCEDURES
#


if {[info exists vTcl(sourcing)]} {

proc vTcl:project:info {} {
    set base .top37
    global vTcl
    set base $vTcl(btop)
    if {$base == ""} {
        set base .top37
    }
    namespace eval ::widgets::$base {
        set dflt,origin 0
        set runvisible 1
    }
    set site_3_0 $base.fra38
    set site_3_0 $base.fra52
    set site_3_0 $base.fra57
    set site_3_0 $base.fra71
    namespace eval ::widgets_bindings {
        set tagslist _TopLevel
    }
    namespace eval ::vTcl::modules::main {
        set procs {
        }
        set compounds {
        }
        set projectType single
    }
}
}

#################################
# GENERATED GUI PROCEDURES
#

proc vTclWindow.top37 {base} {
    if {$base == ""} {
        set base .top37
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl::widgets::core::toplevel::createCmd $top -class Toplevel \
        -background {#d9d9d9} -highlightbackground {#d9d9d9} \
        -highlightcolor black 
    wm focusmodel $top passive
    wm geometry $top 891x800+57+75
    update
    # set in toplevel.wgt.
    global vTcl
    global img_list
    set vTcl(save,dflt,origin) 0
    wm maxsize $top 1440 855
    wm minsize $top 120 15
    wm overrideredirect $top 0
    wm resizable $top 1 1
    wm deiconify $top
    wm title $top "Fish traning GUI - Client"
    vTcl:DefineAlias "$top" "MainGUI" vTcl:Toplevel:WidgetProc "" 1
    frame $top.fra38 \
        -borderwidth 2 -relief groove -background {#d9d9d9} -height 131 \
        -highlightbackground {#d9d9d9} -highlightcolor black -width 864 
    vTcl:DefineAlias "$top.fra38" "frmTraining" vTcl:WidgetProc "MainGUI" 1
    set site_3_0 $top.fra38
    button $site_3_0.but39 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onRunTraining \
        -disabledforeground {#a3a3a3} -foreground {#000000} \
        -highlightbackground {#d9d9d9} -highlightcolor black -pady 0 \
        -text {Run traning} 
    vTcl:DefineAlias "$site_3_0.but39" "btnRunTraining" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab46 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Training day} 
    vTcl:DefineAlias "$site_3_0.lab46" "Label2" vTcl:WidgetProc "MainGUI" 1
    radiobutton $site_3_0.rad48 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -justify left -text Feed -variable FeedVar 
    vTcl:DefineAlias "$site_3_0.rad48" "radF1" vTcl:WidgetProc "MainGUI" 1
    radiobutton $site_3_0.rad49 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -justify left -text {No feed} -variable FeedVar 
    vTcl:DefineAlias "$site_3_0.rad49" "radN1" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab50 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Fish no.} 
    vTcl:DefineAlias "$site_3_0.lab50" "Label1" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex79 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -height 32 -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 \
        -width 218 -wrap word 
    .top37.fra38.tex79 configure -font font9
    .top37.fra38.tex79 insert end text
    vTcl:DefineAlias "$site_3_0.tex79" "txtArgs" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab80 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text Arguments 
    vTcl:DefineAlias "$site_3_0.lab80" "Label10" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but38 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onStopTraining \
        -disabledforeground {#a3a3a3} -foreground {#000000} \
        -highlightbackground {#d9d9d9} -highlightcolor black -pady 0 \
        -text {Stop traning} 
    vTcl:DefineAlias "$site_3_0.but38" "btnStopTraning" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex45 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -height 32 -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 -width 90 \
        -wrap word 
    .top37.fra38.tex45 configure -font font9
    .top37.fra38.tex45 insert end text
    vTcl:DefineAlias "$site_3_0.tex45" "txtFishNo1" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex46 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -height 32 -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 -width 82 \
        -wrap word 
    .top37.fra38.tex46 configure -font font9
    .top37.fra38.tex46 insert end text
    vTcl:DefineAlias "$site_3_0.tex46" "txtTrainingDay1" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex42 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -height 32 -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 -width 90 \
        -wrap word 
    .top37.fra38.tex42 configure -font font9
    .top37.fra38.tex42 insert end text
    vTcl:DefineAlias "$site_3_0.tex42" "txtFishNo2" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex43 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -height 32 -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 -width 82 \
        -wrap word 
    .top37.fra38.tex43 configure -font font9
    .top37.fra38.tex43 insert end text
    vTcl:DefineAlias "$site_3_0.tex43" "txtTrainingDay2" vTcl:WidgetProc "MainGUI" 1
    radiobutton $site_3_0.rad44 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -justify left -text Feed -variable {} 
    vTcl:DefineAlias "$site_3_0.rad44" "radF2" vTcl:WidgetProc "MainGUI" 1
    radiobutton $site_3_0.rad45 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -justify left -text {No feed} -variable {} 
    vTcl:DefineAlias "$site_3_0.rad45" "radN2" vTcl:WidgetProc "MainGUI" 1
    place $site_3_0.but39 \
        -in $site_3_0 -x 672 -y 66 -width 90 -relwidth 0 -height 50 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab46 \
        -in $site_3_0 -x 104 -y 8 -width 85 -relwidth 0 -height 24 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.rad48 \
        -in $site_3_0 -x 208 -y 16 -width 80 -relwidth 0 -height 22 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.rad49 \
        -in $site_3_0 -x 208 -y 40 -width 99 -relwidth 0 -height 22 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab50 \
        -in $site_3_0 -x 8 -y 8 -width 57 -height 24 -anchor nw \
        -bordermode ignore 
    place $site_3_0.tex79 \
        -in $site_3_0 -x 448 -y 88 -width 218 -relwidth 0 -height 32 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab80 \
        -in $site_3_0 -x 448 -y 56 -anchor nw -bordermode ignore 
    place $site_3_0.but38 \
        -in $site_3_0 -x 768 -y 66 -width 90 -relwidth 0 -height 50 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.tex45 \
        -in $site_3_0 -x 16 -y 32 -width 90 -relwidth 0 -height 32 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.tex46 \
        -in $site_3_0 -x 120 -y 32 -width 82 -relwidth 0 -height 32 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.tex42 \
        -in $site_3_0 -x 16 -y 72 -width 90 -relwidth 0 -height 32 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.tex43 \
        -in $site_3_0 -x 120 -y 72 -width 82 -relwidth 0 -height 32 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.rad44 \
        -in $site_3_0 -x 208 -y 64 -anchor nw -bordermode ignore 
    place $site_3_0.rad45 \
        -in $site_3_0 -x 208 -y 88 -anchor nw -bordermode ignore 
    button $top.but41 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onExit -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -pady 0 -text Exit 
    vTcl:DefineAlias "$top.but41" "btnExit" vTcl:WidgetProc "MainGUI" 1
    set site_3_0 $top.m43
    menu $site_3_0 \
        -activebackground {#d8d8d8} -activeforeground {#000000} \
        -background {#d9d9d9} -font TkMenuFont -foreground {#000000} \
        -tearoff 0 
    frame $top.fra52 \
        -borderwidth 2 -relief groove -background {#d9d9d9} -height 267 \
        -highlightbackground {#d9d9d9} -highlightcolor black -width 864 
    vTcl:DefineAlias "$top.fra52" "frmStat" vTcl:WidgetProc "MainGUI" 1
    set site_3_0 $top.fra52
    label $site_3_0.lab54 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Fish statistics} 
    vTcl:DefineAlias "$site_3_0.lab54" "Label3" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but55 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onStatClear \
        -disabledforeground {#a3a3a3} -foreground {#000000} \
        -highlightbackground {#d9d9d9} -highlightcolor black -pady 0 \
        -text Clear 
    vTcl:DefineAlias "$site_3_0.but55" "btnStatClear" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but56 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onStatRun \
        -disabledforeground {#a3a3a3} -foreground {#000000} \
        -highlightbackground {#d9d9d9} -highlightcolor black -pady 0 \
        -text Run 
    vTcl:DefineAlias "$site_3_0.but56" "btnStatRun" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab76 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Log folder} 
    vTcl:DefineAlias "$site_3_0.lab76" "Label9" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex77 \
        -background white -font TkTextFont -foreground black -height 168 \
        -highlightbackground {#d9d9d9} -highlightcolor black \
        -insertbackground black -selectbackground {#c4c4c4} \
        -selectforeground black -undo 1 -width 842 -wrap word 
    .top37.fra52.tex77 configure -font TkTextFont
    .top37.fra52.tex77 insert end text
    vTcl:DefineAlias "$site_3_0.tex77" "txtStatLog" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab39 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Days back} 
    vTcl:DefineAlias "$site_3_0.lab39" "Label11" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex40 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 -width 66 \
        -wrap word 
    .top37.fra52.tex40 configure -font font9
    .top37.fra52.tex40 insert end text
    vTcl:DefineAlias "$site_3_0.tex40" "txtStatDaysBack" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab41 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text Arg. 
    vTcl:DefineAlias "$site_3_0.lab41" "Label12" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex42 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 -width 74 \
        -wrap word 
    .top37.fra52.tex42 configure -font font9
    .top37.fra52.tex42 insert end text
    vTcl:DefineAlias "$site_3_0.tex42" "txtStatArgs" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab43 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Run arg.} 
    vTcl:DefineAlias "$site_3_0.lab43" "Label13" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex44 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 \
        -width 378 -wrap word 
    .top37.fra52.tex44 configure -font font9
    .top37.fra52.tex44 insert end text
    vTcl:DefineAlias "$site_3_0.tex44" "txtStatRunArgs" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex46 \
        -background white -font $::vTcl(fonts,vTcl:font9,object) \
        -foreground black -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black -undo 1 \
        -width 442 -wrap word 
    .top37.fra52.tex46 configure -font font9
    .top37.fra52.tex46 insert end text
    vTcl:DefineAlias "$site_3_0.tex46" "txtLogFolder" vTcl:WidgetProc "MainGUI" 1
    place $site_3_0.lab54 \
        -in $site_3_0 -x 8 -y 8 -anchor nw -bordermode ignore 
    place $site_3_0.but55 \
        -in $site_3_0 -x 8 -y 224 -width 62 -relwidth 0 -height 30 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but56 \
        -in $site_3_0 -x 704 -y 216 -width 141 -relwidth 0 -height 38 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab76 \
        -in $site_3_0 -x 312 -y 8 -width 89 -relwidth 0 -height 24 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.tex77 \
        -in $site_3_0 -x 8 -y 40 -width 842 -relwidth 0 -height 168 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab39 \
        -in $site_3_0 -x 80 -y 216 -anchor nw -bordermode ignore 
    place $site_3_0.tex40 \
        -in $site_3_0 -x 160 -y 216 -width 66 -relwidth 0 -height 24 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab41 \
        -in $site_3_0 -x 248 -y 216 -anchor nw -bordermode ignore 
    place $site_3_0.tex42 \
        -in $site_3_0 -x 288 -y 216 -width 74 -relwidth 0 -height 24 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab43 \
        -in $site_3_0 -x 80 -y 240 -anchor nw -bordermode ignore 
    place $site_3_0.tex44 \
        -in $site_3_0 -x 160 -y 240 -width 378 -relwidth 0 -height 24 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.tex46 \
        -in $site_3_0 -x 400 -y 8 -width 442 -relwidth 0 -height 24 \
        -relheight 0 -anchor nw -bordermode ignore 
    frame $top.fra57 \
        -borderwidth 2 -relief groove -background {#d9d9d9} -height 91 \
        -highlightbackground {#d9d9d9} -highlightcolor black -width 864 
    vTcl:DefineAlias "$top.fra57" "frmCom" vTcl:WidgetProc "MainGUI" 1
    set site_3_0 $top.fra57
    label $site_3_0.lab58 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text Communication 
    vTcl:DefineAlias "$site_3_0.lab58" "Label4" vTcl:WidgetProc "MainGUI" 1
    entry $site_3_0.ent59 \
        -background white -disabledforeground {#a3a3a3} -font TkFixedFont \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black 
    vTcl:DefineAlias "$site_3_0.ent59" "txtServerIP" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab60 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Server IP:} 
    vTcl:DefineAlias "$site_3_0.lab60" "Label5" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but61 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onSendtest \
        -disabledforeground {#a3a3a3} -foreground {#000000} \
        -highlightbackground {#d9d9d9} -highlightcolor black -pady 0 \
        -text {Send test} 
    vTcl:DefineAlias "$site_3_0.but61" "btnComSend" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab62 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Motor test} 
    vTcl:DefineAlias "$site_3_0.lab62" "Label6" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but65 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command on1L -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -pady 0 -text {(1) Left} 
    vTcl:DefineAlias "$site_3_0.but65" "btnMotor1L" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but66 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command on1R -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -pady 0 -text {(1) Right} 
    vTcl:DefineAlias "$site_3_0.but66" "btnMotor1R" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but67 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command on2R -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -pady 0 -text {(2) Right} 
    vTcl:DefineAlias "$site_3_0.but67" "btnMotor2R" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but68 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command on2L -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -pady 0 -text {(2) Left} 
    vTcl:DefineAlias "$site_3_0.but68" "btnMotor2L" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab69 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Steps number} 
    vTcl:DefineAlias "$site_3_0.lab69" "Label7" vTcl:WidgetProc "MainGUI" 1
    entry $site_3_0.ent70 \
        -background white -disabledforeground {#a3a3a3} -font TkFixedFont \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black 
    vTcl:DefineAlias "$site_3_0.ent70" "txtStepNum" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but38 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onTankConfig \
        -disabledforeground {#a3a3a3} -foreground {#000000} \
        -highlightbackground {#d9d9d9} -highlightcolor black -pady 0 \
        -text {Tank conf.} 
    vTcl:DefineAlias "$site_3_0.but38" "btnTankConf" vTcl:WidgetProc "MainGUI" 1
    entry $site_3_0.ent38 \
        -background white -disabledforeground {#a3a3a3} -font TkFixedFont \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black 
    vTcl:DefineAlias "$site_3_0.ent38" "txtVelocity" vTcl:WidgetProc "MainGUI" 1
    entry $site_3_0.ent39 \
        -background white -disabledforeground {#a3a3a3} -font TkFixedFont \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -insertbackground black \
        -selectbackground {#c4c4c4} -selectforeground black 
    vTcl:DefineAlias "$site_3_0.ent39" "txtAccl" vTcl:WidgetProc "MainGUI" 1
    checkbutton $site_3_0.che41 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -justify left -text {Red Feeder} \
        -variable chb_Var -wraplength 35 
    vTcl:DefineAlias "$site_3_0.che41" "chb_NewMotor" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but41 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onSetZero \
        -disabledforeground {#a3a3a3} -foreground {#000000} \
        -highlightbackground {#d9d9d9} -highlightcolor black -pady 0 \
        -text {Set ZERO pos.} 
    vTcl:DefineAlias "$site_3_0.but41" "btnSetZero" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab42 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text Vel 
    vTcl:DefineAlias "$site_3_0.lab42" "Label7_3" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab43 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text Accl 
    vTcl:DefineAlias "$site_3_0.lab43" "Label7_4" vTcl:WidgetProc "MainGUI" 1
    place $site_3_0.lab58 \
        -in $site_3_0 -x 8 -y 8 -anchor nw -bordermode ignore 
    place $site_3_0.ent59 \
        -in $site_3_0 -x 24 -y 56 -anchor nw -bordermode ignore 
    place $site_3_0.lab60 \
        -in $site_3_0 -x 24 -y 32 -anchor nw -bordermode ignore 
    place $site_3_0.but61 \
        -in $site_3_0 -x 184 -y 16 -width 103 -relwidth 0 -height 62 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab62 \
        -in $site_3_0 -x 540 -y 20 -width 61 -height 21 -anchor nw \
        -bordermode ignore 
    place $site_3_0.but65 \
        -in $site_3_0 -x 630 -y 10 -width 57 -relwidth 0 -height 38 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but66 \
        -in $site_3_0 -x 630 -y 50 -width 57 -relwidth 0 -height 38 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but67 \
        -in $site_3_0 -x 690 -y 50 -width 57 -relwidth 0 -height 38 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but68 \
        -in $site_3_0 -x 690 -y 10 -width 57 -relwidth 0 -height 38 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab69 \
        -in $site_3_0 -x 550 -y 40 -width 79 -height 21 -anchor nw \
        -bordermode ignore 
    place $site_3_0.ent70 \
        -in $site_3_0 -x 540 -y 60 -width 80 -relwidth 0 -height 27 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but38 \
        -in $site_3_0 -x 296 -y 16 -width 103 -relwidth 0 -height 62 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.ent38 \
        -in $site_3_0 -x 440 -y 30 -width 80 -height 27 -anchor nw \
        -bordermode ignore 
    place $site_3_0.ent39 \
        -in $site_3_0 -x 440 -y 60 -width 80 -height 27 -anchor nw \
        -bordermode ignore 
    place $site_3_0.che41 \
        -in $site_3_0 -x 770 -y 10 -width 71 -relwidth 0 -height 35 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but41 \
        -in $site_3_0 -x 770 -y 50 -width 87 -relwidth 0 -height 38 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab42 \
        -in $site_3_0 -x 399 -y 35 -width 39 -relwidth 0 -height 21 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab43 \
        -in $site_3_0 -x 400 -y 60 -width 39 -height 21 -anchor nw \
        -bordermode ignore 
    frame $top.fra71 \
        -borderwidth 2 -relief groove -background {#d9d9d9} -height 235 \
        -highlightbackground {#d9d9d9} -highlightcolor black -width 861 
    vTcl:DefineAlias "$top.fra71" "frmLog" vTcl:WidgetProc "MainGUI" 1
    set site_3_0 $top.fra71
    label $site_3_0.lab73 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text Log 
    vTcl:DefineAlias "$site_3_0.lab73" "Label8" vTcl:WidgetProc "MainGUI" 1
    text $site_3_0.tex78 \
        -background white -font TkTextFont -foreground black -height 176 \
        -highlightbackground {#d9d9d9} -highlightcolor black \
        -insertbackground black -selectbackground {#c4c4c4} \
        -selectforeground black -undo 1 -width 842 -wrap word 
    .top37.fra71.tex78 configure -font TkTextFont
    .top37.fra71.tex78 insert end text
    vTcl:DefineAlias "$site_3_0.tex78" "txtMainLog" vTcl:WidgetProc "MainGUI" 1
    button $site_3_0.but38 \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -background {#d9d9d9} -command onLogClear \
        -disabledforeground {#a3a3a3} -foreground {#000000} \
        -highlightbackground {#d9d9d9} -highlightcolor black -pady 0 \
        -text Clear 
    vTcl:DefineAlias "$site_3_0.but38" "frmLogClear" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab38 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -foreground {#000000} -highlightbackground {#d9d9d9} \
        -highlightcolor black -text {Time runing:} 
    vTcl:DefineAlias "$site_3_0.lab38" "Label14" vTcl:WidgetProc "MainGUI" 1
    label $site_3_0.lab39 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -disabledforeground {#a3a3a3} \
        -font $::vTcl(fonts,vTcl:font10,object) -foreground {#0000fe} \
        -highlightbackground {#d9d9d9} -highlightcolor black -text 00:00 
    vTcl:DefineAlias "$site_3_0.lab39" "Label15" vTcl:WidgetProc "MainGUI" 1
    place $site_3_0.lab73 \
        -in $site_3_0 -x 8 -y 8 -anchor nw -bordermode ignore 
    place $site_3_0.tex78 \
        -in $site_3_0 -x 8 -y 32 -width 842 -relwidth 0 -height 176 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.but38 \
        -in $site_3_0 -x 8 -y 208 -width 70 -relwidth 0 -height 22 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab38 \
        -in $site_3_0 -x 112 -y 8 -anchor nw -bordermode ignore 
    place $site_3_0.lab39 \
        -in $site_3_0 -x 208 -y 8 -width 121 -relwidth 0 -height 24 \
        -relheight 0 -anchor nw -bordermode ignore 
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.fra38 \
        -in $top -x 12 -y 376 -width 864 -relwidth 0 -height 131 -relheight 0 \
        -anchor nw -bordermode ignore 
    place $top.but41 \
        -in $top -x 696 -y 752 -width 177 -relwidth 0 -height 40 -relheight 0 \
        -anchor nw -bordermode ignore 
    place $top.fra52 \
        -in $top -x 16 -y 8 -width 864 -relwidth 0 -height 267 -relheight 0 \
        -anchor nw -bordermode ignore 
    place $top.fra57 \
        -in $top -x 14 -y 280 -width 864 -relwidth 0 -height 91 -relheight 0 \
        -anchor nw -bordermode ignore 
    place $top.fra71 \
        -in $top -x 15 -y 512 -width 861 -relwidth 0 -height 235 -relheight 0 \
        -anchor nw -bordermode ignore 

    vTcl:FireEvent $base <<Ready>>
}

#############################################################################
## Binding tag:  _TopLevel

bind "_TopLevel" <<Create>> {
    if {![info exists _topcount]} {set _topcount 0}; incr _topcount
}
bind "_TopLevel" <<DeleteWindow>> {
    if {[set ::%W::_modal]} {
                vTcl:Toplevel:WidgetProc %W endmodal
            } else {
                destroy %W; if {$_topcount == 0} {exit}
            }
}
bind "_TopLevel" <Destroy> {
    if {[winfo toplevel %W] == "%W"} {incr _topcount -1}
}

set btop ""
if {$vTcl(borrow)} {
    set btop .bor[expr int([expr rand() * 100])]
    while {[lsearch $btop $vTcl(tops)] != -1} {
        set btop .bor[expr int([expr rand() * 100])]
    }
}
set vTcl(btop) $btop
Window show .
Window show .top37 $btop
if {$vTcl(borrow)} {
    $btop configure -background plum
}

