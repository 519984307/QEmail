#ifndef REPOSITORY_H
#define REPOSITORY_H

#include <QObject>
#include <domain/entity/User.h>
class Repository : public QObject
{
    Q_OBJECT
public:
    explicit Repository(QObject* parent = nullptr);

    QString api(const QString& path){
        return "http://localhost:8887" + path;
    }

    virtual QJsonObject getProtocolByAccount(const QString& email) = 0;

    virtual void login(User user) = 0;
};

#endif  // REPOSITORY_H
