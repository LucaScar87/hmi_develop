#ifndef UTILTS_H
#define UTILTS_H

#include <QObject>
#include<iostream>
#include<stdio.h>

using namespace std;

class Utilts : public QObject
{
   Q_OBJECT
   Q_PROPERTY(double totalPrice READ totalPrice WRITE setTotalPrice NOTIFY totalPriceChanged)
public:
   Utilts(QObject *parent = 0) :
     QObject(parent),
    mTotalPrice(0.0)
   {
   }

   //double totalPrice() const { return mTotalPrice; }
   double totalPrice() const { return 12345456; }
signals:
   void totalPriceChanged();
public slots:
   void setTotalPrice(const double &arg)
   {
     if(mTotalPrice != arg)
     {
       mTotalPrice = arg;
       emit totalPriceChanged();
     }
   }
   void calculateTotalPrice(int number, int price)
   {
    const double TAX_rate = 0.05;
    double subtotal;
    subtotal = price*number;
    setTotalPrice(subtotal + subtotal*TAX_rate);
   }
protected:
   double mTotalPrice;
};


#endif // UTILTS_H
