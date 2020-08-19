//Spectral unmixing macro Version alpha 0.2 - 29.04.2020
//created by Bernhard Hochreiter
//bernhard.hochreiter@meduniwien.ac.at

MasterArray=newArray(
	
//to create the Master Array, please name each channel, followed by their resprective relative (0-1) spectrum over all channels.
//To de-activate channels, write "//" in the beginning of their respective line
//If the number of channels is not consistent with the used image, the macro will not work
//Do not delete the commas further down

	"background",0.033,0.198,0.501,0.409,0.531,0.555,0.638,0.032,0.558,0.556,0.461,0.406,0.324,0.318,0.059,0.116,0.182,0.165,0.121,0.096,0.074,0.039,0.003,0.023,0.059,0.027,0.183,0.025,0.012,0.015,0.01,0.008,0.215,0.691,0.975,0.922,1,0.921,0.255,0.367,0.761,0.626,0.492,0.409,0.31,0.244,0.063,0.127,0.168,0.156,0.114,0.091,0.072,0.054,0.043,0.044,0.293,0.333,0.416,0.26,0.184,0.011,0.207,0.17,0.212,0.132,0.082,0.066,0.046,0.07,0.101,0.11,0.127,0.21,0.078,0.079,0.053,0.198,0.063,
	"DAPI",0.008,0.084,0.266,0.434,0.71,0.873,0.842,0.047,0.906,1,0.876,0.779,0.634,0.531,0.038,0.164,0.28,0.235,0.168,0.126,0.089,0.043,0.002,0.021,0.038,0.021,0.025,0.015,0.008,0.008,0.005,0.004,0.001,0.01,0.018,0.01,0.008,0.004,0.005,0.003,0.004,0.003,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0,0,0,0,0.001,0.002,0.003,0.001,0.001,0.001,0.001,0.001,0.002,0.001,0,0,0,0.001,0.001,0.003,0.004,0.004,0.002,0.002,0.001,0.002,0.001,
	"RelA(405)",0.358,0.983,1,0.715,0.537,0.336,0.247,0.006,0.115,0.075,0.034,0.022,0.01,0.011,0.001,0.003,0.003,0.002,0.001,0.001,0.001,0,0,0,0,0,0,0,0,0,0,0,0,0.004,0.007,0.004,0.003,0.002,0.002,0,0.002,0.001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.001,0,0,0,0,0,0,0,
	"p63(488)",0,0,0,0,0,0,0,0,0,0.002,0.001,0.001,0.001,0.001,0,0,0.001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.141,0.738,1,0.831,0.589,0.364,0.039,0.08,0.155,0.102,0.048,0.031,0.017,0.017,0.002,0.006,0.006,0.006,0.003,0.003,0.002,0.001,0.001,0.001,0,0.001,0,0,0,0,0,0,0,0,0,0,0,0,0,0.002,0.002,0.002,0.001,0.001,0.001,0.001,0.001,
	"KI67(546)",0,0,0,0,0,0,0,0,0,0,0,0,0,0.001,0,0.001,0.002,0.001,0.001,0.001,0,0,0,0,0,0,0,0,0,0,0,0,0.003,0.017,0.027,0.015,0.013,0.01,0.01,0.029,0.07,0.045,0.019,0.013,0.009,0.011,0.002,0.004,0.004,0.004,0.003,0.002,0.002,0.001,0.001,0.001,1,0.664,0.49,0.376,0.24,0.007,0.076,0.094,0.072,0.051,0.027,0.02,0.011,0.015,0.012,0.004,0.004,0.004,0.002,0.002,0.001,0.002,0.002,
	"PSMA(594)",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.001,0.003,0.006,0.009,0.009,0.005,0,0.002,0.005,0.003,0.004,0.002,0.001,0.001,0.001,0,0.001,0.013,0.024,0.013,0.01,0.005,0.007,0.003,0.006,0.01,0.015,0.024,0.021,0.019,0.002,0.009,0.011,0.011,0.008,0.006,0.004,0.003,0.002,0.002,0.166,0.565,0.947,1,0.592,0.015,0.239,0.334,0.292,0.232,0.15,0.112,0.063,0.065,0.055,0.018,0.022,0.025,0.012,0.01,0.006,0.009,0.005,
	"MYC(650)",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.002,0.004,0.002,0.002,0.001,0.001,0,0.001,0.001,0,0,0,0,0,0,0.001,0.002,0.001,0.001,0.001,0,0,0,0,0,0,0,0,0,0.009,0.028,0.054,0.051,0.024,0.013,0.007,0.01,0.011,0.562,1,0.987,0.667,0.421,0.249,0.238,0.196,
	
//FolderMode - Measure an entire folder(true) or a single opened image (false)
	true

// DO NOT CHANGE ANYTHING UNDER THIS LINE
//##################################################################################################################################################
);

ImageSelection="combined";
timelimit=100

//read master array and array testing
Array.getStatistics(MasterArray, min, max, mean, stdDev);
if(max>1){exit("MasterArray is not correctly formatted (max>1)")};
if(max<1){exit("MasterArray is not correctly formatted (max<1)")};

NameArray=newArray(0);

for(i=0;i<MasterArray.length-2;i++){
	if(MasterArray[i]>100){
	NameArray=Array.concat(NameArray,MasterArray[i]);
	}
}
nColors=NameArray.length;
FolderMode=MasterArray[MasterArray.length-1];

MasterArray= Array.trim(MasterArray, MasterArray.length-1);
nChannels=MasterArray.length/nColors-1;
NameArray=newArray(nColors);
for(i=0;i<nColors;i++){NameArray[i]=MasterArray[(nChannels+1)*i];}

//macro core

print(time()+"Started spectral unmixing macro. DO NOT touch your computer until finished!");

if(FolderMode==true){
	dir=getDirectory("Choose a Directory");
	waitForUser("Unmixing Macro is now starting. DO NOT touch your computer until finished.");
	files=getFileList(dir);
	n=0;
	
	for(f=0;f<files.length;f++){
		if (indexOf(files[f], ImageSelection) >= 0) {
			n++;
		}
	}
	print(time()+n+" files found");
	
	m=0;
	
	for(f=0;f<files.length;f++){
		if (indexOf(files[f], ImageSelection) >= 0) {
			open(files[f]);
			close("\\Others");
			getDimensions(width, height, channels, slices, frames);
			if(channels*slices*frames==nChannels){
				unmix();
				m++;
				print(time()+files[f]+" processed");
				print(time()+m+" of "+n+" files processed");
				close("*");
			}
			else{
			print(time()+"ERROR: '"+files[f]+"' is not compatible with the MasterArray (wrong channel count).");
			close("*");
			}
		}
	}
	print(time()+"Spectral unmixing macro finished. Thank you.");
	exit("Spectral unmixing macro finished. Thank you.");
}
else{
	getDimensions(width, height, channels, slices, frames);
	if(channels*slices*frames==nChannels){
		close("\\Others");
		waitForUser("Unmixing Macro is now starting. DO NOT touch your computer until finished.");
		unmix();
		print(time()+"Spectral unmixing macro finished. Thank you.");
		exit("Spectral unmixing macro finished. Thank you.");
	}
	else{
		exit("Error: Image is not compatible with MasterArray(wrong channel count).")"
	}
}

//####################################################################################################
function unmix(){

close("\\Others");
getDimensions(width0, height0, channels0, slices0, frames0);
dir=getDirectory("image");
title0=getTitle();
title1=replace(title0, " ", "_");
rename(title1);

//generate spectral identifiers
for(i=0;i<nColors;i++){
	newImage(NameArray[i], "16-bit", 256, 256, nChannels);
	makeRectangle(64, 64, 128, 128);
	run("Add...", "value=4095 stack");
	run("Select None");
	for (j = 0; j < nChannels; j++) {
		setSlice(j+1);
		run("Multiply...", "value="+MasterArray[i*(nChannels+1)+j+1]+" slice");
	}
}

titles = newArray(nImages());
 for (i=1; i<=nImages(); i++) {
 	selectImage(i);
 	titles[i-1] = getTitle();
	}

run("Combine...", "stack1="+titles[1]+" stack2="+titles[2]+" combine");

for (i = 3; i < titles.length; i++) {
run("Combine...", "stack1=[Combined Stacks] stack2="+titles[i]+" combine");
}
run("Combine...", "stack1="+title1+" stack2=[Combined Stacks]");

run("Z Project...", "projection=[Max Intensity]");
run("Concatenate...", "  image1=[MAX_Combined Stacks] image2=[Combined Stacks]");

rename(title0);

//Run unmixing algorithm

getDimensions(width1, height1, channels1, slices1, frames1);
n=round(height1/256);

if(isOpen("Spectral Unmixing")==1){
	selectWindow("Spectral Unmixing");
	run("Close");
}
run("Spectral Unmixing");
selectWindow("Spectral Unmixing");
setLocation(0, 0);

for(i=0;i<n;i++){
	makeRectangle(width1-190, (i*256)+66, 124, 124);
	getStatistics(area, mean, min, max, std, histogram);
	if(mean>1){
		selectWindow("Spectral Unmixing");
		run("IJ Robot", "order=Left_Click x_point=200 y_point=50 delay=0 keypress=[]");
		selectImage(title0);
		wait(100);
	}
}
selectWindow("Spectral Unmixing");
run("IJ Robot", "order=Left_Click x_point=200 y_point=100 delay=0 keypress=[]");

run("IJ Robot", "order=Left_Click x_point=200 y_point=100 delay=0 keypress=[]");
wait(3000);
run("IJ Robot", "order=KeyPress keypress=!");

loop=0;
timer=0;
while(loop==0){
	if(isOpen("Residuals image open-predicted open")==true){
		loop++;		
	}
	wait(1000);
	timer++;
	if(timer>timelimit){exit("unmixing process timed out ("+timelimit+"s)");}
}

selectWindow("Spectral Unmixing");
run("Close");

//crop and save resulting images

selectWindow("Residuals image open-predicted open");
makeRectangle(0, 0, width0, height0);
run("Crop");
titleres=replace(title0, ".tif", "_unmixed_residuals");
saveAs("tiff", dir+titleres);

selectWindow("Stacks of Luciferases");
makeRectangle(0, 0, width0, height0);
run("Crop");
titleunmix=replace(title0, ".tif", "_unmixed");

getDimensions(width, height, channels, slices, frames);
for(i=0;i<channels*slices*frames;i++){
	setSlice(i+1);
	setMetadata("Label", NameArray[i]);	
}
setSlice(1);

saveAs("tiff", dir+titleunmix);
close(title0);

}
//#########################################################################

function time(){
     getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
     if (hour<10) {TimeString = "0";}
     else{TimeString="";}    
     TimeString = TimeString+hour+":";
     if (minute<10) {TimeString = TimeString+"0";}
     TimeString = TimeString+minute+":";
     if (second<10) {TimeString = TimeString+"0";}
     TimeString = TimeString+second+" - ";
     return TimeString;
}