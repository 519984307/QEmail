#include "RepositoryImpl.h"

RepositoryImpl::RepositoryImpl(QObject *parent) : Repository{parent} {}

template <typename T>
void RepositoryImpl::handleResult(QString result, T &data) {

  if (!CommonTool::instance()->isJson(result)) {
    LOGD(result);
    throw BizException(-1, "服务器异常");
  } else {
    CommonTool::instance()->jsonNonNull(result);
    const QJsonObject &obj =
        CommonTool::instance()->json2Object(result.toStdString());
    LOGD(obj);
  }
  json j = json::parse(result.toStdString());
  data = j.get<T>();
}

void RepositoryImpl::login(User user) {
  const QVariantMap &data = {{"email", user.email},
                             {"password", user.password},
                             {"imapHost", user.imapHost},
                             {"imapPort", user.imapPort},
                             {"imapSecurity", user.imapSecurity},
                             {"smtpHost", user.smtpHost},
                             {"smtpPort", user.smtpPort},
                             {"smtpSecurity", user.smtpSecurity}};
  QString result = RxHttp::get(api("/login"), data);
  qDebug() << result;
}

QJsonObject RepositoryImpl::getProtocolByAccount(const QString &email) {
  QFile file("./mailcore-provider-settings.json");
  bool bOpen = file.open(QIODevice::ReadOnly);
  if (bOpen == false) {
    return {};
  }
  QByteArray data = file.readAll();
  file.close();
  QJsonDocument doc = QJsonDocument::fromJson(data);
  if (!doc.isObject()) {
    return {};
  }
  QJsonObject obj = doc.object();
  auto strList = email.split("@");
  if (strList.isEmpty()) {
    return {};
  }
  auto domain = strList[1];
  foreach (auto item, obj.keys()) {
    if (domain.startsWith(item)) {
      return obj[item].toObject();
    }
  }
  return {};
}
