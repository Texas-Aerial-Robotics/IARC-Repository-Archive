// linedetection.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <iostream>
#include <opencv2\highgui\highgui.hpp>
#include <opencv2\imgproc\imgproc.hpp>

using namespace cv;
using namespace std;

int main()
{
	Mat cameraFeed;
	Mat dst, cdst, binary,output;
	VideoCapture capture;
	capture.open(1);

	while (1)
	{
		capture.read(cameraFeed);
		
		cvtColor(cameraFeed, output, CV_BGR2GRAY);
		threshold(output, binary, 170, 255, THRESH_BINARY);
		Canny(binary, dst, 50, 200, 3);
		cvtColor(dst, cdst, CV_GRAY2BGR);


		imshow("Canny Output", dst);
		imshow("Binary output", binary);
		vector<Vec4i> lines;
		HoughLinesP(binary, lines, 1, CV_PI / 180, 30, 50, 20);
		for (size_t i = 0; i < lines.size(); i++)
		{
			Vec4i l = lines[i];
			line(cdst, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0, 0, 255), 3, CV_AA);
		}

		//cout << lines.size() << endl;
		//imshow("source", cameraFeed);
		imshow("detected lines", cdst);

		waitKey(30);
	}
	return 0;
}
