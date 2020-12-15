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
filename0 = "selTAS_1976-2005DJF.nc"
f0 = addfile (filename0, " r ")
v0 = f0->tg
v0@long_name=""
v0@units=""
filename1 = "selTAS_1976-2005MAM.nc"
f1 = addfile (filename1, " r ")
v1 = f1->tg
v1@long_name=""
v1@units=""
filename2 = "selTAS_1976-2005JJA.nc"
f2 = addfile (filename2, " r ")
v2 = f2->tg
v2@long_name=""
v2@units=""
filename3 = "selTAS_1976-2005SON.nc"
f3 = addfile (filename3, " r ")
v3 = f3->tg
v3@long_name=""
v3@units=""
  lat2d    = f1->Actual_latitude             ; (y,x)
  lon2d    = f1->Actual_longitude            ; (y,x)
  nt       = 1                      ; time index to plot
  nd       = 0                      ; depth index to plot
dims = dimsizes(lon2d)
wks = gsn_open_wks("ps","EU-OBS-SEAS")
gsn_define_colormap(wks,"gui_default")         ; choose colormap
;---Set some resources
  res                 = True

;---Maximize plot in frame
  res@gsnMaximize     = True

  res@cnFillOn        = True          ; Turn on contour fill
;  res@cnFillPalette   = "BlAqGrYeOrReVi200"
res@cnMinLevelValF = -25

res@cnMaxLevelValF   = 30

res@cnLevelSpacingF = 1


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
plot = new(4,graphic)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "EU-OBS"
res@gsnCenterString  = " DJF 1976-2005" 
plot(0) = gsn_csm_contour_map_ce(wks,v0(0,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "EU-OBS"
res@gsnCenterString  = " MAM 1976-2005" 
plot(1) = gsn_csm_contour_map_ce(wks,v1(0,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "EU-OBS"
res@gsnCenterString  = " JJA 1976-2005" 
plot(2) = gsn_csm_contour_map_ce(wks,v2(0,:,:), res)
res@tiMainFontHeightF     = 0.023
res@tiMainString     = "EU-OBS"
res@gsnCenterString  = " SON 1976-2005" 
plot(3) = gsn_csm_contour_map_ce(wks,v3(0,:,:), res)
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
  resPanel@gsnPanelFigureStrings= (/"a)","b)","c)","d)","e)","f)","g)","h)","i)","j)","k)"/) ; add strings to panel
res@txFontHeightF     = 0.036
  gsn_panel(wks,plot,(/2,2/),resPanel)            ; draw: 2-down , 2-across
 txres               = True
  txres@txFontHeightF = 0.0015

 
end
