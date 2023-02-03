#include "temperature.h"
#include<QFile>
#include<QTextStream>
#include<QDebug>
temperature::temperature(QObject *parent)
    : QObject{parent}
    , m_temp("null")
{
qDebug()<<"created";
QFile file("/sys/class/thermal/thermal_zone0/temp");
   if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
       return;

   QTextStream in(&file);

       QString line = in.readLine();
       qDebug()<<line;
       float a=line.toFloat()/1000;
       qDebug()<<a;
       line.setNum(a);
       m_temp=line;
      // process_line(line);
}

QString temperature::temp()
{
return m_temp;
}

void temperature::setTemp()
{


}
