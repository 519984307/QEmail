﻿#include "UserHelper.h"

Q_GLOBAL_STATIC(UserHelper, userHelper)

UserHelper* UserHelper::instance()
{
  return userHelper;
}

UserHelper::UserHelper(QObject* parent) : QObject{ parent }
{
    password(SettingsHelper::instance()->getToken());
}
