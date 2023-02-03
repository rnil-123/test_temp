#ifndef TEMPERATURE_H
#define TEMPERATURE_H

#include <QObject>

class temperature : public QObject
{
    Q_OBJECT
public:
    explicit temperature(QObject *parent = nullptr);
    Q_PROPERTY(QString temp READ temp WRITE setTemp CONSTANT)

    QString temp();
    void setTemp();
signals:

private:
    QString m_temp;
};

#endif // TEMPERATURE_H
