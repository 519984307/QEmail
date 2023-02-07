#ifndef LOGINCONTROLLER_H
#define LOGINCONTROLLER_H

#include <application/service/UserService.h>

#include <QObject>
#include <QtConcurrent>
#include <infrastructure/tool/MailTool.h>

#include "BaseController.h"

using namespace QInjection;

class LoginController : public BaseController {
  Q_OBJECT
  Q_PROPERTY_AUTO(int, socketState);
  Q_PROPERTY_AUTO(QJsonObject, protocol);

private:
  UserService *userService() { return QInjection::Inject; }

public:
  explicit LoginController(QObject *parent = nullptr);
  ~LoginController();

  Q_INVOKABLE void login(const QString &email, const QString &password,
                         const QString &imapHost, const QString &imapPort,
                         const QString &imapSecurity, const QString &smtpHost,
                         const QString &smtpPort, const QString &smtpSecurity);

  Q_INVOKABLE void loadProtocolByAccount(const QString &email);
};

#endif // LOGINCONTROLLER_H
