### R code from vignette source 'EBImage-introduction.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: style
###################################################
BiocStyle::latex()


###################################################
### code chunk number 2: library
###################################################
library("EBImage")


###################################################
### code chunk number 3: display-hack
###################################################
display = function(...) if (interactive()) EBImage::display(...)


###################################################
### code chunk number 4: readImage1
###################################################
f = system.file("images", "sample.png", package="EBImage")
img = readImage(f)


###################################################
### code chunk number 5: display
###################################################
display(img)


###################################################
### code chunk number 6: readImage2
###################################################
imgc = readImage(system.file("images", "sample-color.png", package="EBImage"))
display(imgc)
nuc = readImage(system.file('images', 'nuclei.tif', package='EBImage'))
display(nuc)


###################################################
### code chunk number 7: readImage2h
###################################################
writeImage(nuc, 'nuc.jpeg', quality=85)


###################################################
### code chunk number 8: writeImage
###################################################
writeImage(img,  'img.jpeg', quality=85)
writeImage(imgc, 'imgc.jpeg', quality=85)


###################################################
### code chunk number 9: print
###################################################
print(img)


###################################################
### code chunk number 10: math1
###################################################
img1 = img+0.5
img2 = 3*img
img3 = (0.2+img)^3


###################################################
### code chunk number 11: math1h
###################################################
writeImage(img1, 'img1.jpeg', quality=85)
writeImage(img2, 'img2.jpeg', quality=85)
writeImage(img3, 'img3.jpeg', quality=85)


###################################################
### code chunk number 12: math2
###################################################
img4 = img[299:376, 224:301]
img5 = img>0.5
img6 = t(img)
print(median(img))


###################################################
### code chunk number 13: math2h
###################################################
writeImage(img4, 'img4.jpeg', quality=85)
writeImage(img5, 'img5.png')
writeImage(img6, 'img6.jpeg', quality=85)


###################################################
### code chunk number 14: combine
###################################################
imgcomb = combine(img, img*2, img*3, img*4)
display(imgcomb)


###################################################
### code chunk number 15: combineh
###################################################
writeImage(imgcomb, 'imgcomb.jpeg', quality=85)


###################################################
### code chunk number 16: spatial
###################################################
img7 = rotate(img, 30)
img8 = translate(img, c(40, 70))
img9 = flip(img)


###################################################
### code chunk number 17: spatialh
###################################################
writeImage(img7, 'img7.jpeg', quality=85)
writeImage(img8, 'img8.jpeg', quality=85)
writeImage(img9, 'img9.jpeg', quality=85)


###################################################
### code chunk number 18: print
###################################################
print(imgc)


###################################################
### code chunk number 19: colorMode
###################################################
colorMode(imgc) = Grayscale
display(imgc)


###################################################
### code chunk number 20: colorModeh
###################################################
writeImage(imgc, 'imgc.jpeg', quality=85)


###################################################
### code chunk number 21: colorMode2
###################################################
colorMode(imgc) = Color


###################################################
### code chunk number 22: channel
###################################################
imgk = channel(img, 'rgb')
imgk[236:276, 106:146, 1] = 1
imgk[236:276, 156:196, 2] = 1
imgk[236:276, 206:246, 3] = 1
imgb = rgbImage(red=img, green=flip(img), blue=flop(img))


###################################################
### code chunk number 23: channelh
###################################################
writeImage(imgk, 'imgk.jpeg', quality=85)
writeImage(imgb, 'imgb.jpeg', quality=85)


###################################################
### code chunk number 24: filter
###################################################
flo = makeBrush(21, shape='disc', step=FALSE)^2
flo = flo/sum(flo)
imgflo = filter2(imgc, flo)

fhi =  matrix(1, nc=3, nr=3)
fhi[2,2] = -8
imgfhi = filter2(imgc, fhi)


###################################################
### code chunk number 25: filterh
###################################################
writeImage(imgflo, 'imgflo.jpeg', quality=85)
writeImage(imgfhi, 'imgfhi.jpeg', quality=85)


###################################################
### code chunk number 26: morpho
###################################################
ei = readImage(system.file('images', 'shapes.png', package='EBImage'))
ei = ei[110:512,1:130]
display(ei)

kern = makeBrush(5, shape='diamond')
eierode = erode(ei, kern)
eidilat = dilate(ei, kern)


###################################################
### code chunk number 27: morphoh
###################################################
writeImage(ei, 'ei.png')
writeImage(kern, 'kern.png')
writeImage(eierode, 'eierode.png')
writeImage(eidilat, 'eidilat.png')


###################################################
### code chunk number 28: segmentation
###################################################
eilabel = bwlabel(ei)
cat('Number of objects=', max(eilabel),'\n')

nuct = nuc[,,1]>0.2
nuclabel = bwlabel(nuct)
cat('Number of nuclei=', max(nuclabel),'\n')


###################################################
### code chunk number 29: segmentationh
###################################################
writeImage(eilabel/max(eilabel), 'eilabel.png')
writeImage(nuclabel/max(nuclabel), 'nuclabel.png')


###################################################
### code chunk number 30: segmentation2
###################################################
nuct2 =  thresh(nuc[,,1], w=10, h=10, offset=0.05)
kern = makeBrush(5, shape='disc')
nuct2 = dilate(erode(nuct2, kern), kern)
nuclabel2 = bwlabel(nuct2)
cat('Number of nuclei=', max(nuclabel2),'\n')


###################################################
### code chunk number 31: segmentation2h
###################################################
writeImage(nuclabel2/max(nuclabel2), 'nuclabel2.png')


###################################################
### code chunk number 32: manip
###################################################
nucgray = channel(nuc[,,1], 'rgb')
nuch1 = paintObjects(nuclabel2, nucgray, col='#ff00ff')
nuclabel3 = fillHull(nuclabel2)
nuch2 = paintObjects(nuclabel3, nucgray, col='#ff00ff')


###################################################
### code chunk number 33: maniph
###################################################
writeImage(nuch1, 'nuch1.jpeg', quality=85)
writeImage(nuch2, 'nuch2.jpeg', quality=85)


###################################################
### code chunk number 34: manip2
###################################################
xy = computeFeatures.moment(nuclabel3)[, c("m.cx", "m.cy")]
xy[1:4,]


###################################################
### code chunk number 35: cs1
###################################################
nuc = readImage(system.file('images', 'nuclei.tif', package='EBImage'))
cel = readImage(system.file('images', 'cells.tif', package='EBImage'))
img = rgbImage(green=1.5*cel, blue=nuc)


###################################################
### code chunk number 36: cs1h
###################################################
writeImage(cel, 'cel.jpeg', quality=85)
writeImage(img, 'img.jpeg', quality=85)


###################################################
### code chunk number 37: cs2
###################################################
nmask = thresh(nuc, w=10, h=10, offset=0.05)
nmask = opening(nmask, makeBrush(5, shape='disc'))
nmask = fillHull(nmask)
nmask = bwlabel(nmask)


###################################################
### code chunk number 38: cs2h
###################################################
writeImage(nmask/max(nmask), 'nmask.png')


###################################################
### code chunk number 39: cs3
###################################################
ctmask = opening(cel>0.1, makeBrush(5, shape='disc'))
cmask = propagate(cel, seeds=nmask, mask=ctmask)


###################################################
### code chunk number 40: cs3h
###################################################
writeImage(cmask/max(cmask), 'cmask.png')


###################################################
### code chunk number 41: cs4
###################################################
res = paintObjects(cmask, img, col='#ff00ff')
res = paintObjects(nmask, res, col='#ffff00')


###################################################
### code chunk number 42: cs4h
###################################################
writeImage(res, 'res.jpeg', quality=85)


