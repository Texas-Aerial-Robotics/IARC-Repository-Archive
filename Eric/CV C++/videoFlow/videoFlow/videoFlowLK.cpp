// videoFlowLK.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <opencv2\opencv.hpp>
#include <iostream>
#pragma warning(disable:4996)

using namespace std;
using namespace cv;

static const int MAX_CORNERS = 1000;

int main()
{
	VideoCapture cap;
	cap.open(0);
	Mat imgA;
	Mat imgB;
	Mat imgC;
	Mat pos = Mat::zeros(1000, 1000, CV_8UC3);
	int counter = 1;
	Point2f flow;
	Point2f flowSum;
	Point2f POS1 = Point2f(500, 500);
	Point2f POS2;
	namedWindow("position");
	resizeWindow("position", 600, 600);
	float cornersFound = 0;
	while (1)
	{
		
		cap >> imgA;
		imgA.copyTo(imgC);
		cvtColor(imgA, imgA, CV_BGR2GRAY);
		Size img_sz = imgA.size();
		int win_size = 10;

		//obtain features to track
		vector<Point2f> cornersA, cornersB;
		const int MAX_CORNERS = 500;
		goodFeaturesToTrack(imgA, cornersA, MAX_CORNERS, 0.01, 5, noArray(), 3, false, 0.04);

		cornersFound = 0;
		if (counter != 1)
		{
			cornerSubPix(imgA, cornersA, Size(win_size, win_size), Size(-1, -1), TermCriteria(TermCriteria::MAX_ITER | TermCriteria::EPS, 20, 0.03));
			vector<uchar> features_found;
			calcOpticalFlowPyrLK(imgA, imgB, cornersA, cornersB, features_found, noArray(), Size(win_size * 2 + 1, win_size * 2 + 1), 5, TermCriteria(TermCriteria::MAX_ITER | TermCriteria::EPS, 20, 0.03));
			
			flowSum = Point2f(1, 1);
			for (int i = 0; i < (int)cornersA.size(); i++)
			{
				if (!features_found[i] == 1)
				{
					continue;
				}
				cornersFound++;
				flowSum = (cornersB[i] - cornersA[i]) + flowSum;
				line(imgC, cornersA[i], cornersB[i], Scalar(0, 255, 0), 2, 8);
			}
			flow.x = flowSum.x / cornersFound;
			flow.y = flowSum.y / cornersFound;
			cout << flow << endl;
			POS2 = POS1 + (flow/5);
			line(pos, POS1, POS2, Scalar(0, 255, 0), 2, 8);
			POS1 = POS2;
			imshow("Image A", imgA);
			imshow("Image B", imgB);
			imshow("flow", imgC);
			imshow("position", pos);
		}
		imgA.copyTo(imgB);
		waitKey(30);
		
		counter++;

	}
	

	return 0;
}

