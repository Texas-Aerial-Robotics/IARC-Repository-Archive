// drawing.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <opencv2/opencv.hpp>

#define w 400

using namespace cv;
using namespace std;


void MyArrow(Mat img);
void MyEillipse(Mat img, double angle);
void MyFilledCircle(Mat img, Point center);
void MyPolygon(Mat img);
void MyLine(Mat img, Point start, Point end);


int main()
{
	//window names
	char arrow_window[] = "Drawing 1: Arrow";
	char dick_window[] = "Drawing 2: Dick";
	//create empty black images
	Mat imgArrow = Mat::zeros(w, w, CV_8UC3);
	Mat imgDick = Mat::zeros(w, w, CV_8UC3);


	//
	//// draw arrow
	MyArrow(imgArrow);

	//draw dick
	////
	MyEillipse(imgDick, 90);
	MyFilledCircle(imgDick, Point( 3*w/5 , 3*w /4));
	MyFilledCircle(imgDick, Point(2* w / 5, 3 * w / 4));
	//show drawings
	imshow(arrow_window, imgArrow);
	moveWindow(arrow_window, 0, 200);
	imshow(dick_window, imgDick);
	moveWindow(dick_window, w, 200);

	waitKey(0);
	return(0);



    return 0;
}

void MyEillipse(Mat img, double angle)
{
	int thickness = -1;
	int lineType = 8;
	ellipse(img, Point(w / 2.0, w / 2.0), Size(w / 4.0, w / 16.0), angle, 0, 360, Scalar(255, 0, 0), thickness, lineType);

}
void MyFilledCircle(Mat img, Point position)
{
	int thickness = -1;
	int lineType = 8;

	circle(img, position, w / 12.0, Scalar(255, 0, 0), thickness, lineType);
}
void MyPolygon(Mat img)
{
	int lineType = 8;

	/** Create some points */
	Point rook_points[1][20];
	rook_points[0][0] = Point(w / 4.0, 7 * w / 8.0);
	rook_points[0][1] = Point(3 * w / 4.0, 7 * w / 8.0);
	rook_points[0][2] = Point(3 * w / 4.0, 13 * w / 16.0);
	rook_points[0][3] = Point(11 * w / 16.0, 13 * w / 16.0);
	rook_points[0][4] = Point(19 * w / 32.0, 3 * w / 8.0);
	rook_points[0][5] = Point(3 * w / 4.0, 3 * w / 8.0);
	rook_points[0][6] = Point(3 * w / 4.0, w / 8.0);
	rook_points[0][7] = Point(26 * w / 40.0, w / 8.0);
	rook_points[0][8] = Point(26 * w / 40.0, w / 4.0);
	rook_points[0][9] = Point(22 * w / 40.0, w / 4.0);
	rook_points[0][10] = Point(22 * w / 40.0, w / 8.0);
	rook_points[0][11] = Point(18 * w / 40.0, w / 8.0);
	rook_points[0][12] = Point(18 * w / 40.0, w / 4.0);
	rook_points[0][13] = Point(14 * w / 40.0, w / 4.0);
	rook_points[0][14] = Point(14 * w / 40.0, w / 8.0);
	rook_points[0][15] = Point(w / 4.0, w / 8.0);
	rook_points[0][16] = Point(w / 4.0, 3 * w / 8.0);
	rook_points[0][17] = Point(13 * w / 32.0, 3 * w / 8.0);
	rook_points[0][18] = Point(5 * w / 16.0, 13 * w / 16.0);
	rook_points[0][19] = Point(w / 4.0, 13 * w / 16.0);

	const Point* ppt[1] = { rook_points[0] };
	int npt[] = { 20 };

	fillPoly(img, ppt, npt, 1, Scalar(255, 255, 255), lineType);
}
void MyLine(Mat img, Point start, Point end)
{
	int thickness = 2;
	int lineType = 8;
	line(img, start, end, Scalar(255, 0, 0), thickness, lineType);

}
void MyArrow(Mat img)
{
	MyLine(img , Point(w / 10.0, w / 2.0), Point(9.0 * w / 10.0, w / 2.0));
	MyLine(img, Point(3 * w / 5, 3 * w / 5), Point(9.0 * w / 10.0, w / 2.0));
	MyLine(img, Point(3 * w / 5, 2 * w / 5), Point(9.0 * w / 10.0, w / 2.0));
}

