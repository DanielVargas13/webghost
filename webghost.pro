TEMPLATE = app
QT += webengine
CONFIG += c++11

RC_FILE = webghost.rc

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        ghostwrapper.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -LD:/workspace/qtghost/build-qtghost-Desktop_Qt_5_10_1_MSVC2017_64bit-Release/release/ -lqtghost
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/workspace/qtghost/build-qtghost-Desktop_Qt_5_10_1_MSVC2017_64bit-Debug/debug/ -lqtghost
else:unix: LIBS += -LD:/workspace/qtghost/build-qtghost-Desktop_Qt_5_10_1_MSVC2017_64bit-Debug/ -lqtghost


INCLUDEPATH += D:/workspace/qtghost/qtghost
DEPENDPATH += D:/workspace/qtghost/qtghost

HEADERS += \
    ghostwrapper.h
