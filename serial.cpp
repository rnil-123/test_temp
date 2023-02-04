#include "serial.h"
#include<QDebug>
#include <QFile>
#include<QSerialPort>
#include <QObject>
#include <QTextCodec>

serial::serial(QObject *parent)
    : QObject{parent}
    , m_sdata("null")
{
    serial1=new QSerialPort(this);
    serial1->setPortName("ttyACM0");
    serial1->setBaudRate(QSerialPort::Baud9600);
    serial1->setDataBits(QSerialPort::Data8);
    //serial1->setParity("QSerialPort::NoParity");
    serial1->setStopBits(QSerialPort::OneStop);//  stop bit is used to signal the end of a frame.
    serial1->setFlowControl(QSerialPort::NoFlowControl);//Flow control is the management of data flow between
    serial1->open(QIODevice::ReadOnly);//mode read write
    connect(serial1,SIGNAL(readyRead()),this,SLOT(read_data()));//signal slot connection
//    qDebug()<<"created";
    m_sdata="kunal";
}

serial::~serial()
{
serial1->close();
qDebug()<<"closed";
}

QString serial::sdata()
{
return m_sdata;
}

QByteArray ba;
void serial::read_data()
{

//    QString st = QString::fromUtf8(ba);
//    QString st = QTextCodec::codecForMib(1015)->toUnicode(ba);
    ba=serial1->readLine();
   //qDebug()<<"cccccccccc";
    //qDebug()<<st;
    //ui->label->setText(ba);
    QString filename="/home/rnil/test_serial/out.buf";
    QFile file(filename);
        if (!file.open(QIODevice::ReadWrite | QIODevice::Append))
            return;

        QTextStream out(&file);
       out << QString(ba) ;//<< "\n";
        out << QString( ba ).remove("\r").remove("\n") << "\n";

        qDebug()<<"kunal";
    qDebug().noquote()<<ba;

    m_sdata=QString( ba );
    qDebug()<<m_sdata+"k";
//   for(int i=0;i<m_sdata.length();i++){
//       qDebug()<<m_sdata[i]<<endl;
//   }
}

void serial::setSdata()
{
m_sdata="llll";
}


