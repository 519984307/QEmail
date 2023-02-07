#ifndef USERHELPER_H
#define USERHELPER_H

#include <QObject>
#include <QGlobalStatic>
#include <infrastructure/helper/SettingsHelper.h>
#include <domain/entity/User.h>
#include <infrastructure/stdafx.h>

class UserHelper : public QObject
{
    Q_OBJECT
    Q_PROPERTY_AUTO(QString,email)
    Q_PROPERTY_AUTO(QString,password)
public:
    static UserHelper* instance();

    explicit UserHelper(QObject* parent = nullptr);

    Q_INVOKABLE bool isLogin(){
        return !_password.isEmpty();
    }

    Q_INVOKABLE void logout(){
        email(""),password("");
        SettingsHelper::instance()->saveToken(_password);
    }

    Q_INVOKABLE void login(const QString& val){
        password(val);
        SettingsHelper::instance()->saveToken(_password);
    }

    void updateUser(const User& user){
        email(user.email);
        password(user.password);
    };

};

#endif  // USERHELPER_H
