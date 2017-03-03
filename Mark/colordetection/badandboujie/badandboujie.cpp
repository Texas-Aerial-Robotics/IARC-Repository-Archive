// badandboujie.cpp : Defines the entry point for the console application.

#include "stdafx.h"
#include <sstream>
#include <string>
#include <iostream>

#include "opencv2/core/core.hpp"
#include "Roomba.h"
#include <vector>

using namespace std;
////initial min and max HSV filter values.
////these will be changed using trackbars
//int H_MIN = 0;
//int H_MAX = 256;
//int S_MIN = 0;
//int S_MAX = 256;
//int V_MIN = 0;
//int V_MAX = 256;
//default capture width and height
const int FRAME_WIDTH = 640;
const int FRAME_HEIGHT = 480;
//max number of objects to be detected in frame
const int MAX_NUM_OBJECTS = 50;
//minimum and maximum object area
const int MIN_OBJECT_AREA = 40 * 40;
const int MAX_OBJECT_AREA = FRAME_HEIGHT*FRAME_WIDTH / 1.5;
//names that will appear at the top of each window
const string windowName = "Original Image";
const string windowName1 = "HSV Image";
const string windowName2 = "Thresholded Image";
const string windowName3 = "After Morphological Operations";
const string trackbarWindowName = "Trackbars";

string intToString(int number) {


	std::stringstream ss;
	ss << number;
	return ss.str();
}

void drawObject(vector<Roomba> theRoombas, Mat &frame, int type) {
	if (type == 1) {
		for (int i = 0; i < theRoombas.size(); i++) {

			cv::circle(frame, cv::Point(theRoombas.at(i).getXPos(), theRoombas.at(i).getYPos()), 10, cv::Scalar(0, 0, 255));
			cout << "Red Roomba # " << i << " x Pos   " << theRoombas.at(i).getXPos() << "  Y Pos    " << theRoombas.at(i).getYPos() << endl;
			cv::putText(frame, intToString(theRoombas.at(i).getXPos()) + " , " + intToString(theRoombas.at(i).getYPos()), cv::Point(theRoombas.at(i).getXPos(), theRoombas.at(i).getYPos() + 20), 1, 1, Scalar(0, 255, 0));
		}
	}else {
		for (int i = 0; i < theRoombas.size(); i++) {

			cv::circle(frame, cv::Point(theRoombas.at(i).getXPos(), theRoombas.at(i).getYPos()), 10, cv::Scalar(0, 0, 255));
			cout << "Green Roomba # " << i << " x Pos   " << theRoombas.at(i).getXPos() << "  Y Pos    " << theRoombas.at(i).getYPos() << endl;
			cv::putText(frame, intToString(theRoombas.at(i).getXPos()) + " , " + intToString(theRoombas.at(i).getYPos()), cv::Point(theRoombas.at(i).getXPos(), theRoombas.at(i).getYPos() + 20), 1, 1, Scalar(0, 255, 0));
		}
		

	}
}
void morphOps(Mat &thresh) {

	//create structuring element that will be used to "dilate" and "erode" image.
	//the element chosen here is a 3px by 3px rectangle

	Mat erodeElement = getStructuringElement(MORPH_RECT, Size(3, 3));
	//dilate with larger element so make sure object is nicely visible
	Mat dilateElement = getStructuringElement(MORPH_RECT, Size(8, 8));

	erode(thresh, thresh, erodeElement);
	erode(thresh, thresh, erodeElement);


	dilate(thresh, thresh, dilateElement);
	dilate(thresh, thresh, dilateElement);



}
void trackFilteredObject(Mat threshold, Mat HSV, Mat &cameraFeed, int type) {

	//int x, y;

	//mycode
	//Roomba redone;
	vector<Roomba> redones;

	Mat temp;
	threshold.copyTo(temp);
	//these two vectors needed for output of findContours
	vector< vector<Point> > contours;
	vector<Vec4i> hierarchy;
	//find contours of filtered image using openCV findContours function
	findContours(temp, contours, hierarchy, CV_RETR_CCOMP, CV_CHAIN_APPROX_SIMPLE);
	//use moments method to find our filtered object
	double refArea = 0;
	bool objectFound = false;
	if (hierarchy.size() > 0) {
		int numObjects = hierarchy.size();
		//if number of objects greater than MAX_NUM_OBJECTS we have a noisy filter
		if (numObjects<MAX_NUM_OBJECTS) {
			for (int index = 0; index >= 0; index = hierarchy[index][0]) {

				Moments moment = moments((cv::Mat)contours[index]);
				double area = moment.m00;

				//if the area is less than 20 px by 20px then it is probably just noise
				//if the area is the same as the 3/2 of the image size, probably just a bad filter
				//we only want the object with the largest area so we safe a reference area each
				//iteration and compare it to the area in the next iteration.
				if (area>MIN_OBJECT_AREA) {
					Roomba redone;
				redone.setXPos( moment.m10 / area);
				redone.setYPos( moment.m01 / area);



				redones.push_back(redone);

					objectFound = true;

				}
				else objectFound = false;


			}
			//let user know you found an object
			if (objectFound == true) {
				//draw object location on screen
				drawObject(redones, cameraFeed,type);
			}

		}
		else putText(cameraFeed, "TOO MUCH NOISE! ADJUST FILTER", Point(0, 50), 1, 2, Scalar(0, 0, 255), 2);
	}
}

int main(int argc, char* argv[])
{

	//Matrix to store each frame of the webcam feed
	Mat cameraFeed;
	Mat threshold;
	Mat HSV;

	//video capture object to acquire webcam feed
	VideoCapture capture;
	//open capture object at location zero (default location for webcam)
	capture.open(0);
	//set height and width of capture frame
	capture.set(CV_CAP_PROP_FRAME_WIDTH, FRAME_WIDTH);
	capture.set(CV_CAP_PROP_FRAME_HEIGHT, FRAME_HEIGHT);
	//start an infinite loop where webcam feed is copied to cameraFeed matrix
	//all of our operations will be performed within this loop
	while (1) {
		//store image to matrix
		capture.read(cameraFeed);
		//convert frame from BGR to HSV colorspace
		cvtColor(cameraFeed, HSV, COLOR_BGR2HSV);


		{
			//hardcode colors
			Roomba redone, greenone;
			redone.setHSVmin(Scalar(0, 179, 98));
			redone.setHSVmax(Scalar(18, 255, 252));
			redone.settype(1);
			
			greenone.setHSVmin(Scalar(44,42 , 0));
			greenone.setHSVmax(Scalar(74, 135, 119));
			greenone.settype(2);

			cvtColor(cameraFeed, HSV, COLOR_BGR2HSV);
			inRange(HSV, redone.getHSVmin(), redone.getHSVmax(), threshold);
			morphOps(threshold);
			trackFilteredObject(threshold, HSV, cameraFeed,redone.gettype());

			cvtColor(cameraFeed, HSV, COLOR_BGR2HSV);
			inRange(HSV, greenone.getHSVmin(), greenone.getHSVmax(), threshold);
			morphOps(threshold);
			trackFilteredObject(threshold, HSV, cameraFeed, greenone.gettype());
		}

		//show frames 
		//imshow(windowName2,threshold);

		imshow(windowName, cameraFeed);
		//imshow(windowName1,HSV);


		//delay 30ms so that screen can refresh.
		//image will not appear without this waitKey() command
		waitKey(30);
	}






	return 0;
}
