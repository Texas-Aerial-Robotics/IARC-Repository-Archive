// lineDetection.cpp : Defines the entry point for the console application.
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
	Mat dst, cdst;
	VideoCapture capture;
	capture.open(0);

	while (1)
	{
		capture.read(cameraFeed);
		Canny(cameraFeed, dst, 50, 200, 3);
		cvtColor(dst, cdst, CV_GRAY2BGR);

		vector<Vec4i> lines;
		HoughLinesP(dst, lines, 1, CV_PI / 180, 30, 50, 20);
		for (size_t i = 0; i < lines.size(); i++)
		{
			Vec4i l = lines[i];
			line(cdst, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0, 0, 255), 3, CV_AA);
		}

		cout << lines.size() << endl;
		imshow("source", cameraFeed);
		imshow("detected lines", cdst);

		waitKey(30);
	}
    return 0;
}

