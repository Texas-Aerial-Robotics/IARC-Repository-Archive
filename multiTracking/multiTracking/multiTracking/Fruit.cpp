#include "stdafx.h"
#include "Fruit.h"


Fruit::Fruit()
{
}
Fruit::Fruit(string name)
{
	setType(name);
	if (name == "apple")
	{
		setHSVMin(Scalar(42, 47, 37));
		setHSVMax(Scalar(70, 142, 145));
	}
	if (name == "banana")
	{
		setHSVMin(Scalar(0, 144, 94));
		setHSVMax(Scalar(65, 255, 235));
	}
	if (name == "cherry")
	{
		setHSVMin(Scalar(0, 144, 94));
		setHSVMax(Scalar(65, 255, 235));
	}
	setColor(Scalar(0, 255, 0));

}

Fruit::~Fruit()
{
}

int Fruit::getXPos()
{
	return Fruit::xPos;
}

void Fruit::setXPos(int x)
{
	Fruit::xPos = x;
}
int Fruit::getYPos()
{
	return Fruit::yPos;
}

void Fruit::setYPos(int y)
{
	Fruit::yPos = y;
}

Scalar Fruit::getHSVMin()
{
	return Fruit::HSVMin;
}
void Fruit::setHSVMin(Scalar min)
{
	Fruit::HSVMin = min;
}

Scalar Fruit::getHSVMax()
{
	return Fruit::HSVMax;
}
void Fruit::setHSVMax(Scalar max)
{
	Fruit::HSVMax = max;
}
