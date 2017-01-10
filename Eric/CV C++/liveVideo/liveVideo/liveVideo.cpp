// liveVideo.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <opencv2\opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char** argv)
{
	namedWindow("Live", WINDOW_AUTOSIZE);
	namedWindow("Canny", WINDOW_AUTOSIZE);
	VideoCapture cap;

	if (argc == 1)
	{
		cap.open(0);
	}
	if (!cap.isOpened())
	{
		cout << "camera could not be opened" << endl;
		system("pause");
		return -1;
	}
	Mat imgRaw, imgSmooth, imgCanny;
	for (;;)
	{
		cap >> imgRaw;
		imshow("Live", imgRaw);
		GaussianBlur(imgRaw, imgRaw, Size(3, 3), 3, 3);
		Canny(imgRaw, imgCanny, 10, 100, 3, true);
		imshow("Canny", imgCanny);
		if (waitKey(33) == 27) break;

	}
    return 0;
}

