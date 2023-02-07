INCLUDEPATH += $$PWD

HEADERS += \
    $$PWD/abstractsqlgenerator.h \
    $$PWD/postgresqlgenerator.h \
    $$PWD/mysqlgenerator.h \
    $$PWD/sqlitegenerator.h \
    $$PWD/sqlservergenerator.h

SOURCES += \
    $$PWD/abstractsqlgenerator.cpp \
    $$PWD/postgresqlgenerator.cpp \
    $$PWD/mysqlgenerator.cpp \
    $$PWD/sqlitegenerator.cpp \
    $$PWD/sqlservergenerator.cpp
