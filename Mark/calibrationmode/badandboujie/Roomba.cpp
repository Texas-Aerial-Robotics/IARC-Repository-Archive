#include "stdafx.h"
#include "Roomba.h"


Roomba::Roomba()
{
}


Roomba::~Roomba()
{
}

int Roomba::getXPos(){
	
	
	return Roomba::xPos;

}

void Roomba::setXPos(int x) {

	Roomba::xPos = x;
}
int Roomba::getYPos() {


	return Roomba::yPos;

}

void Roomba::setYPos(int y) {

	Roomba::yPos = y;
}


Scalar Roomba::getHSVmin() {
	return Roomba::HSVmin;
}

Scalar Roomba::getHSVmax() {

	return Roomba::HSVmax;
}
void Roomba::setHSVmin(Scalar min) {
	Roomba::HSVmin = min;
}
void Roomba::setHSVmax(Scalar max) {
	Roomba::HSVmax = max;
}
