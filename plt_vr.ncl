
begin
;-----------------------
a = addfile("./RCKT20130623_132919.nc","r")
print(a)
dz = short2flt(a->DZ)
printVarSummary(dz)
print(max(dz(0,0,:,:)))
print(min(dz(0,0,:,:)))
vr = short2flt(a->VR)
;vr = a->VR
printVarSummary(vr)
;vr=vr-32767*2   ;65534
vr = where(vr.gt.32767,vr-32767*2,vr)
print(max(vr(0,0,:,:)))
print(min(vr(0,0,:,:)))
;print(vr(0,0,100:150,250:260))
print(vr(0,0,0,0))

wks  = gsn_open_wks("X11","conwomap")   ; send graphics to PNG file

res                     = True          ; plot mods desired

res@cnFillOn            = True          ; turn on color
res@cnFillPalette       = "gui_default" ; set color map
res@cnLevelSelectionMode = "ManualLevels"
res@cnMaxLevelValF =  10
res@cnMinLevelValF = -10
res@cnLevelSpacingF =  2

res@vpWidthF            = 0.5           ; change aspect ratio of plot
res@vpHeightF           = 0.3

res@gsnMaximize         = True          ; maximize plot size

plot = gsn_csm_contour(wks,vr(0,0,:,:),res)       ; contour the variable

;test branch

;----------------------
end
