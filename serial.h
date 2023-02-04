#ifndef SERIAL_H
#define SERIAL_H
#include <QtSerialPort/QSerialPort>
#include <QObject>
class serial : public QObject
{
    Q_OBJECT

private:
    QSerialPort *serial1;
public:
    explicit serial(QObject *parent = nullptr);
    Q_PROPERTY(QString sdata READ sdata WRITE setSdata CONSTANT);
    ~serial();
    QString sdata();

signals:


public slots:
//    void fun(QSerialPort *serial1);
    void read_data();
    void setSdata();

private:
    QString m_sdata;
};

#endif // SERIAL_H
