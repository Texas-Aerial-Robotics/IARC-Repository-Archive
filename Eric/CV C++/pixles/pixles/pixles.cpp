// pixles.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "opencv2\opencv.hpp"
#include <stdint.h>
using namespace cv;
using namespace std;

int main()
{
	Mat img1 = imread("C:\\Users\\Eric\\Documents\\GitHub\\Mycode\\Visual Studio 2015\\Projects\\pixles\\longhorn.jpeg", CV_LOAD_IMAGE_COLOR);
	Mat img2 = imread("C:\\Users\\Eric\\Documents\\GitHub\\Mycode\\Visual Studio 2015\\Projects\\pixles\\longhorn.jpeg", CV_LOAD_IMAGE_COLOR);
	
	for (int r = 0; r < img2.rows; r++)
	{
		for (int c = 0; c < img2.cols; c++)
		{
			img2.at<cv::Vec3b>(r, c)[2] = img2.at<cv::Vec3b>(r, c)[2] *0;
			img2.at<cv::Vec3b>(r, c)[1] = img2.at<cv::Vec3b>(r, c)[1] * 0;
		}
	}
	
	imshow("image1", img1);
	imshow("image2", img2);
	waitKey(0);

    return 0;
}

