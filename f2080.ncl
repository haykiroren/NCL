;----------------------------------------------------------------------
; This script creates a color contour plot of temperature on a
; NEMO grid.
;
; This script is identical to nemo_1.ncl, except additional
; options are set to color fill the contours, and turn off contour
; lines and labels.
;
; The NEMO grid is curvilinear, which means you have two-dimensional
; lat/lon arrays of the same size as the data array.
;----------------------------------------------------------------------
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
begin
filename0 = "./rcp26/ENSF2DJF.nc4"
f0 = addfile (filename0, " r ")
v0 = f0->tas
v0@long_name=""
v0@units=""
filename1 = "./rcp45/ENSF2DJF.nc4"
f1 = addfile (filename1, " r ")
v1 = f1->tas
v1@long_name=""
v1@units=""
filename2 = "./rcp85/ENSF2DJF.nc4"
f2 = addfile (filename2, " r ")
v2 = f2->tas
v2@long_name=""
v2@units=""
filename3 = "./rcp26/ENSF2MAM.nc4"
f3 = addfile (filename3, " r ")
v3 = f3->tas
v3@long_name=""
v3@units=""
filename4 = "./rcp45/ENSF2MAM.nc4"
f4 = addfile (filename4, " r ")
v4 = f4->tas
v4@long_name=""
v4@units=""
filename5 = "./rcp85/ENSF2MAM.nc4"
f5 = addfile (filename5, " r ")
v5 = f5->tas
v5@long_name=""
v5@units=""
filename6 = "./rcp26/ENSF2JJA.nc4"
f6 = addfile (filename6, " r ")
v6 = f6->tas
v6@long_name=""
v6@units=""
filename7 = "./rcp45/ENSF2JJA.nc4"
f7 = addfile (filename7, " r ")
v7 = f7->tas
v7@long_name=""
v7@units=""
filename8 = "./rcp85/ENSF2JJA.nc4"
f8 = addfile (filename8, " r ")
v8 = f8->tas
v8@long_name=""
v8@units=""
filename9 = "./rcp26/ENSF2SON.nc4"
f9 = addfile (filename9, " r ")
v9 = f9->tas
v9@long_name=""
v9@units=""
filename10 = "./rcp45/ENSF2SON.nc4"
f10 = addfile (filename10, " r ")
v10 = f10->tas
v10@long_name=""
v10@units=""
filename11 = "./rcp85/ENSF2SON.nc4"
f11 = addfile (filename11, " r ")
v11 = f11->tas
v11@long_name=""
v11@units=""
wks = gsn_open_wks("ps","AF-2080")
  lat2d    = f1->lat             ; (y,x)
  lon2d    = f1->lon             ; (y,x)
  nt       = 0                      ; time index to plot
  nd       = 0                      ; depth index to plot
dims = dimsizes(lon2d)
gsn_define_colormap(wks,"gui_default")         ; choose colormap
minlat  =  min(lat2d)
minlon  =  min(lon2d)                             ;-- retrieve maximum latitude value
maxlat  =  max(lat2d)                             ;-- retrieve minimum longitude value
maxlon  =  max(lon2d) 
plot = new(12,graphic)
  res                 = True

  res@gsnMaximize     = True

  res@cnFillOn        = True          ; Turn on contour fill


 res@cnLinesOn            = False                ; Fill contours
  res@lbLabelBarOn         = False        
 res@gsnMaximize           =  True  
res@mpLimitMode = "Corners" ; method to zoom
res@mpLeftCornerLatF = minlat
res@mpLeftCornerLonF = minlon
res@mpRightCornerLatF = maxlat
res@mpRightCornerLonF = maxlon
  res@sfXArray        = lon2d
  res@sfYArray        = lat2d

  res@gsnAddCyclic    = False      ; Data not global, don't add lon cyclic pt
   res@mpOutlineBoundarySets       = "National"   ; turn on country boundaries
   res@mpGeophysicalLineColor      = "Black"
   res@mpGeophysicalLineThicknessF      = 0.6
    res@mpNationalLineColor      = "Black"
   res@mpNationalLineThicknessF      = 0.6
   res@mpPerimOn                     =True
   res@mpPerimLineColor            = "Red"
  res@gsnDraw              = False               ; Do not draw plot
  res@gsnFrame             = False               ; Do not advance frome




  res@tiMainString             = "Constant"
  res@cnLineLabelBackgroundColor = "Transparent"       ; white bckgrnd around label
  res@cnLineDashSegLenF          = 1          ; assist in controlling concentration
  res@cnLineLabelInterval        = 1      
 res@cnLevelSelectionMode = "ManualLevels"  ; manual levels
 res@cnMinLevelValF       =  0
 res@cnMaxLevelValF       =  7
 res@cnLevelSpacingF      =  0.1 
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "DJF (WINTER) / RCP2.6"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(0) = gsn_csm_contour_map_ce(wks,v0(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "DJF (WINTER) / RCP4.5"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(1) = gsn_csm_contour_map_ce(wks,v1(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "DJF (WINTER) / RCP8.5"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(2) = gsn_csm_contour_map_ce(wks,v2(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "MAM (SPRING) / RCP2.6"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(3) = gsn_csm_contour_map_ce(wks,v3(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "MAM (SPRING) / RCP4.5"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(4) = gsn_csm_contour_map_ce(wks,v4(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "MAM (SPRING) / RCP8.5"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(5) = gsn_csm_contour_map_ce(wks,v5(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "JJA (SUMMER) / RCP2.6"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(6) = gsn_csm_contour_map_ce(wks,v6(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "JJA (SUMMER) / RCP4.5"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(7) = gsn_csm_contour_map_ce(wks,v7(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "JJA (SUMMER) / RCP8.5"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(8) = gsn_csm_contour_map_ce(wks,v8(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "SON (AUTUMN) / RCP2.6"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(9) = gsn_csm_contour_map_ce(wks,v9(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "SON (AUTUMN) / RCP4.5"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(10) = gsn_csm_contour_map_ce(wks,v10(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "SON (AUTUMN) / RCP8.5"
res@gsnCenterString  = " 2066-2095 - 1976-2005" 
plot(11) = gsn_csm_contour_map_ce(wks,v11(nt,:,:), res)

   res@tiMainFontHeightF=0.009
   res@tiMainFontAspectF     = 1
   res@tiMainFontThicknessF  = 0.5
   res@tiMainFontHeightF     = 0.017
  resPanel                 = True                 ; panel mods desired
  resPanel@gsnPanelLabelBar= True                 ; label bar on panel
 resPanel@gsnPaperOrientation = "auto"          
  resPanel@gsnMaximize         = True 
   resPanel@lbBoxLinesOn     = False             ; turn off box lines
  resPanel@lbLabelAutoStride = True
  resPanel@gsnPanelFigureStringsFontHeightF     = 0.005
  resPanel@gsnPanelFigureStrings= (/"a)","b)","c)","d)","e)","f)","g)","h)","i)","j)","k)","l)","m)","n)","o)","p)"/) ; add strings to panel
res@txFontHeightF     = 0.036
  gsn_panel(wks,plot,(/4,3/),resPanel)            ; draw: 2-down , 2-across
 txres               = True
  txres@txFontHeightF = 0.0015

 
end
