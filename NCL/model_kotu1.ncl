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
;---Open file and read temperature, lat, lon arrays.
  filename1 = "model1.nc"
  f1        = addfile (filename1, "r")
 filename2 = "model2.nc"
  f2        = addfile (filename2, "r")
  filename3 = "model3.nc"
  f3        = addfile (filename3, "r")
 filename4 = "model4.nc"
  f4        = addfile (filename4, "r")
  filename5 = "model5.nc"
  f5        = addfile (filename5, "r")
 filename6 = "model6.nc"
  f6        = addfile (filename6, "r")
  filename7 = "model8.nc"
  f7        = addfile (filename7, "r")
 filename8 = "model9.nc"
  f8        = addfile (filename8, "r")
 filename9 = "model10.nc"
  f9        = addfile (filename9, "r")

  v1        = f1->tas            ; (time_counter, deptht, y, x) 
  v2        = f2->tas            ; (time_counter, deptht, y, x) 
  v3        = f3->tas            ; (time_counter, deptht, y, x) 
  v4        = f4->tas            ; (time_counter, deptht, y, x) 
  v5        = f5->tas            ; (time_counter, deptht, y, x) 
  v6        = f6->tas            ; (time_counter, deptht, y, x) 
  v7        = f7->tas            ; (time_counter, deptht, y, x) 
  v8        = f8->tas            ; (time_counter, deptht, y, x) 
  v9        = f9->tas            ; (time_counter, deptht, y, x)
v1@long_name=""
  v1@units=" "
v2@long_name=""
  v2@units=" "
v3@long_name=""
  v3@units=" "
v4@long_name=""
  v4@units=" "
v5@long_name=""
  v5@units=" "
v6@long_name=""
  v6@units=" "
v7@long_name=""
  v7@units=" "
v8@long_name=""
  v8@units=" "
v9@long_name=""
  v9@units=" "

  lat2d    = f1->lat             ; (y,x)
  lon2d    = f1->lon             ; (y,x)
  nt       = 0                      ; time index to plot
  nd       = 0                      ; depth index to plot
dims = dimsizes(lon2d)
;---Convert "time" coordinate array to different units
;  date = cd_calendar(v&time_counter, -3)   ; YYYYMMDDHH

;----------------------------------------------------------------------
; Plotting section
;----------------------------------------------------------------------
  wks = gsn_open_wks("ps","MODEL-KOTU1")
  gsn_define_colormap(wks,"gui_default")         ; choose colormap

;---Set some resources
  res                 = True

;---Maximize plot in frame
  res@gsnMaximize     = True

  res@cnFillOn        = True          ; Turn on contour fill
;  res@cnFillPalette   = "BlAqGrYeOrReVi200"
 res@cnLevelSelectionMode = "ManualLevels"  ; manual levels
 res@cnMinLevelValF       = 0
 res@cnMaxLevelValF       = 6
 res@cnLevelSpacingF      =  0.25 
  res@cnLineLabelPlacementMode = "Computed"
 res@cnLinesOn            = False                ; Fill contours
 res@cnLineLabelsOn        =False
 res@cnLineLabelDensityF  = 5
 res@cnLineLabelBackgroundColor = "white"
  res@lbLabelBarOn         = False        
   res@gsnSpreadColors = True               ; use full color table
   res@gsnSpreadColorStart = 2 
   res@gsnSpreadColorEnd   = -2 
 res@gsnMaximize           =  True  
;  res@cnLinesOn       = False         ; Turn off contour lines
;  res@cnLevelSpacingF = 0.5           ; Change contour level spacing

;---Zoom in on map
res@mpLimitMode = "Corners" ; method to zoom
res@mpLeftCornerLatF = lat2d(0,0)
res@mpLeftCornerLonF = lon2d(0,0)
res@mpRightCornerLatF = lat2d(dims(0)-1,dims(1)-1)
res@mpRightCornerLonF = lon2d(dims(0)-1,dims(1)-1)  

;---Lat/lon arrays for overlaying on map
  res@sfXArray        = lon2d
  res@sfYArray        = lat2d

  res@gsnAddCyclic    = False      ; Data not global, don't add lon cyclic pt
   res@mpOutlineBoundarySets       = "National"   ; turn on country boundaries
   res@mpGeophysicalLineColor      = "Black"
;   res@mpGeophysicalLineDashPattern      = 1
   res@mpGeophysicalLineThicknessF      = 0.6
    res@mpNationalLineColor      = "Black"
;   res@mpNationalLineDashPattern      = 1
   res@mpNationalLineThicknessF      = 0.6
   res@mpPerimOn                     =True
   res@mpPerimLineColor            = "Red"
  res@gsnDraw              = False               ; Do not draw plot
  res@gsnFrame             = False               ; Do not advance frome



;  res@cnLineLabelDensityF=2
; res@cnLineLabelFontAspectF = 0.95

  res@tiMainString             = "Constant"
  res@cnLineLabelBackgroundColor = "Transparent"       ; white bckgrnd around label
  res@cnLineDashSegLenF          = 1          ; assist in controlling concentration
  res@cnLineLabelInterval        = 1      


  plot = new(9,graphic)                          ; create graphics array
res@tiMainFontHeightF     = 0.023
   res@tiMainString     = " Model 10 -"
;   res@gsnCenterString  = " 1976-2005 "
  plot(0) = gsn_csm_contour_map_ce(wks,v1(nt,:,:), res)  
;  plot(0) = ColorNegDashZeroPosContour(plot(0),"violet","blue","red")
res@tiMainFontHeightF     = 0.023
   res@tiMainString     = " Model 11 -"
;   res@gsnCenterString  = " 1976-2005 "
  plot(1) = gsn_csm_contour_map_ce(wks,v2(nt,:,:), res)
;  plot(1) = ColorNegDashZeroPosContour(plot(1),"violet","blue","red")
res@tiMainFontHeightF     = 0.023
  res@tiMainString     = " Model 12 -"
;  res@gsnCenterString  = " 1976-2005 "
  plot(2) = gsn_csm_contour_map_ce(wks,v3(nt,:,:), res)
;  plot(2) = ColorNegDashZeroPosContour(plot(2),"violet","blue","red")
res@tiMainFontHeightF     = 0.023
  res@tiMainString     = " Model 13 -"
;  res@gsnCenterString  = " 1976-2005 "
  plot(3) = gsn_csm_contour_map_ce(wks,v4(nt,:,:), res)

res@tiMainFontHeightF     = 0.023
   res@tiMainString     = " Model 14 -"
;   res@gsnCenterString  = " 1976-2005 "
  plot(4) = gsn_csm_contour_map_ce(wks,v5(nt,:,:), res)  
;  plot(0) = ColorNegDashZeroPosContour(plot(0),"violet","blue","red")
res@tiMainFontHeightF     = 0.023
   res@tiMainString     = " Model 15 -"
;   res@gsnCenterString  = " 1976-2005 "
  plot(5) = gsn_csm_contour_map_ce(wks,v6(nt,:,:), res)
;  plot(1) = ColorNegDashZeroPosContour(plot(1),"violet","blue","red")
res@tiMainFontHeightF     = 0.023
  res@tiMainString     = " Model 16 -"
;  res@gsnCenterString  = " 1976-2005 "
  plot(6) = gsn_csm_contour_map_ce(wks,v7(nt,:,:), res)
;  plot(2) = ColorNegDashZeroPosContour(plot(2),"violet","blue","red")
res@tiMainFontHeightF     = 0.023
  res@tiMainString     = " Model 17 -"
;  res@gsnCenterString  = " 1976-2005 "
  plot(7) = gsn_csm_contour_map_ce(wks,v8(nt,:,:), res)
res@tiMainFontHeightF     = 0.023
  res@tiMainString     = " Model 18 -"
;  res@gsnCenterString  = " 1976-2005 "
  plot(8) = gsn_csm_contour_map_ce(wks,v9(nt,:,:), res)



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
  resPanel@gsnPanelFigureStrings= (/"a)","b)","c)","d)","e)","f)","g)","h)","i)"/) ; add strings to panel
res@txFontHeightF     = 0.036
  gsn_panel(wks,plot,(/3,3/),resPanel)            ; draw: 2-down , 2-across
 txres               = True
  txres@txFontHeightF = 0.0015

 
end
