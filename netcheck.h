#ifndef NETCHECK_H
#define NETCHECK_H

#include <QObject>

class netcheck : public QObject
{
    Q_OBJECT
public:
    explicit netcheck(QObject *parent = nullptr);
    Q_PROPERTY(QString net READ net WRITE setNet NOTIFY netChanged)//
public:
 //   explicit someclass(QObject *parent = nullptr);
    QString net();
signals:
    void netChanged();

public slots:
    //void setSomeVar(QString);
    void setNet();
private:
    QString m_net;
};

#endif // NETCHECK_H
