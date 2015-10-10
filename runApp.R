library("EBImage")
library("CRImage")

# Ready images
print("Loading image\n")
#image = readImage("images/bird.jpg")
image = readImage("images/photo1.jpg")
#image = readImage("images/295087.jpg")
#image = readImage("images/42049.jpg")
#image = readImage("images/62096.jpg")
#image = readImage("images/108082.jpg")
display(image)
print("Image loaded\n")

# segmentation
print("Converting image to grayscale\n")
gray = EBImage::channel(image, "gray")
display(gray)

print("Applying otsu threshold\n")
threshold = calculateOtsu(as.vector(gray))
binary = createBinaryImage(gray,threshold=threshold)
display(binary)

print("Cleaning image\n")
kern = makeBrush(5, shape="disc")
cleaned = opening(binary, kern)
cleaned = fillHull(cleaned)
display(cleaned)

print("Calculating distance map\n")
map = distmap(cleaned)
display(normalize(map))

print("Segmenting using watershed algorithm\n")
water = watershed(map)
display(normalize(water))

# identyfy border of each segment
print("Finding segments\n")
v = matrix(nrow=max(water), ncol=6)
for(i in 1:max(water)) {
  range = which(water == i, arr.in=TRUE)
  minRow = min(range[,"row"])
  minCol = min(range[,"col"])
  maxRow = max(range[,"row"])
  maxCol = max(range[,"col"])
  size = (maxCol - minCol) * (maxRow - minRow)
  values = c(i, minRow, maxRow, minCol, maxCol, size)
  v[i,] = values
}

# sort segments from biggest to smallest
print("Sorting segments from biggest to smallest\n")
sorted = v[sort.list(-v[,6]),]

# change segments to rectangles
print("Changing segments into rectangles\n")
for(i in 1:max(water)) {
  water[sorted[i,2]:sorted[i,3], sorted[i,4]:sorted[i,5]] = sorted[i,1]
}

# add rainbow collors
print("Applying colors\n")
colors = rainbow(max(water))
zrainbow = Image(colors[1+water], dim=dim(image))
display(zrainbow)
