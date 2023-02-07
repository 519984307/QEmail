#include "LoginController.h"

LoginController::LoginController(QObject *parent) : BaseController{parent} {}

LoginController::~LoginController() {}

void LoginController::login(const QString &email, const QString &password,
                            const QString &imapHost, const QString &imapPort,
                            const QString &imapSecurity, const QString &smtpHost,
                            const QString &smtpPort, const QString &smtpSecurity) {
    subscription.add(
        rxs::create<QString>([=](subscriber<QString> subscriber) {
        userService()->login(email,password,imapHost,imapPort,imapSecurity,smtpHost,smtpPort,smtpSecurity);
          subscriber.on_next("");
          subscriber.on_completed();
        })
            .subscribe_on(Rx->IO())
            .observe_on(Rx->mainThread())
            .subscribe([=](const QString &data) {  },
                       [this](const rxu::error_ptr &error) {
                         handleError(error, [](const BizException &e) {

                         });
                       }));
}

void LoginController::loadProtocolByAccount(const QString &email) {
  subscription.add(
      rxs::create<QJsonObject>([=](subscriber<QJsonObject> subscriber) {
        subscriber.on_next(userService()->getProtocolByAccount(email));
        subscriber.on_completed();
      })
          .subscribe_on(Rx->IO())
          .observe_on(Rx->mainThread())
          .subscribe([=](const QJsonObject &data) { protocol(data); },
                     [this](const rxu::error_ptr &error) {
                       handleError(error, [](const BizException &e) {

                       });
                     }));
}
