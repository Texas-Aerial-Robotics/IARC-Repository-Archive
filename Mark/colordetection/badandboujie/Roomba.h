#pragma once
#include <string>
#include <opencv/cv.hpp>
#include <opencv2/highgui/highgui.hpp>
using namespace cv;
using namespace std;
class Roomba
{
public:
	Roomba();
	~Roomba();
	
	int getXPos();
	void setXPos(int x);
	int gettype();
	void settype(int x);

	int getYPos();
	void setYPos(int y);



	cv::Scalar getHSVmin();
	cv::Scalar getHSVmax();

	void setHSVmin(Scalar min);
	void setHSVmax(Scalar min);

private:

	int xPos, yPos, type;
	
	cv::Scalar HSVmin, HSVmax;
};

