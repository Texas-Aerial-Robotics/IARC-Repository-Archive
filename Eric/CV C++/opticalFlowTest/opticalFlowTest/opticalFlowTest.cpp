// opticalFlowTest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"


#include "opencv2\highgui.hpp"
#include "opencv2\imgproc.hpp"
#include "opencv2\objdetect\objdetect.hpp"
#include "opencv2/video/tracking.hpp"
#include <vector>
#include <stdio.h>
#include <Windows.h>
#include <iostream>


using namespace cv;
using namespace std;



int main(int argc, const char** argv)
{

	// add your file name
	VideoCapture cap;
	cap.open(0);

	Mat flow, frame;
	// some faster than mat image container
	UMat  flowUmat, prevgray;

	if (!cap.isOpened())
	{
		cout << "camera could not be opened" << endl;
		system("pause");
		return -1;
	}

	for (;;)
	{
		



			Mat img;
			Mat original;
			cap >> img;
			// capture frame from video file
			cap.retrieve(img, CV_CAP_OPENNI_BGR_IMAGE);
			resize(img, img, Size(640, 480));

			// save original for later
			img.copyTo(original);

			// just make current frame gray
			cvtColor(img, img, COLOR_BGR2GRAY);
			GaussianBlur(img, img, Size(7,7), 2.0, 2.0, 4);


			// For all optical flow you need a sequence of images.. Or at least 2 of them. Previous                           //and current frame
			//if there is no current frame
			// go to this part and fill previous frame
			//else {
			// img.copyTo(prevgray);
			//   }
			// if previous frame is not empty.. There is a picture of previous frame. Do some                                  //optical flow alg. 

			if (prevgray.empty() == false) {

				// calculate optical flow 
				calcOpticalFlowFarneback(prevgray, img, flowUmat, 0.4, 1, 12, 2, 8, 1.2, 0);
				// copy Umat container to standard Mat
				flowUmat.copyTo(flow);
				Point vQuad = (0,0);
				int counter = 0;
				// By y += 5, x += 5 you can specify the grid 
				for (int y = 0; y < original.rows; y += 5) {
					for (int x = 0; x < original.cols; x += 5)
					{
						counter = counter + 1;
						// get the flow from y, x position * 10 for better visibility
						Point flowatxy = flow.at<Point2f>(y, x) * 10;
						vQuad = (vQuad + flowatxy);

						// draw line at flow direction
						line(original, Point(x, y), Point(cvRound(x + flowatxy.x), cvRound(y + flowatxy.y)), Scalar(255, 0, 0));
						// draw initial point
						circle(original, Point(x, y), 1, Scalar(0, 0, 0), -1);


					}

				}
				vQuad = vQuad / counter;
				cout << vQuad << endl;

				// draw the results
				namedWindow("prew", WINDOW_AUTOSIZE);
				imshow("prew", original);

				// fill previous image again
				img.copyTo(prevgray);

			}
			else {

				// fill previous image in case prevgray.empty() == true
				img.copyTo(prevgray);

			}


			int key1 = waitKey(20);

		}
	}
