#include "netcheck.h"
#include <QTcpSocket>


bool check()
{
    QTcpSocket* sock = new QTcpSocket();
    sock->connectToHost("www.google.com", 80);
    bool connected = sock->waitForConnected(30000);

    if (!connected)
    {
        sock->abort();
        qDebug() <<"false";
        return false;
    }
    sock->close();
    return true;
}
netcheck::netcheck(QObject *parent)
    : QObject{parent}
    , m_net("NULL")
{
    if(check()){
        m_net="Connected";
        emit netChanged();
    }
    else{
        m_net="Not Connected";
        emit netChanged();
    }
}

QString netcheck::net()
{
    return m_net;
}


void netcheck::setNet()
{
//    if(check()){
//        m_net="Connected";
//        emit netChanged();
//    }
//    else{
//        m_net="Not Connected";
//        emit netChanged();
//    }
}
