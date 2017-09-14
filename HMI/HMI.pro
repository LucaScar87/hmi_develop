QT += qml quick core multimedia multimediawidgets
!no_desktop: QT += widgets
# webengine

CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    coverart.h

DISTFILES +=

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../taglib-1.11/taglib-debug/ -ltaglib
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../taglib-1.11/taglib-debug/ -ltaglib
else:unix: LIBS += -L$$PWD/../taglib-1.11/taglib-debug/ -ltaglib

INCLUDEPATH += $$PWD/../taglib-1.11/taglib
DEPENDPATH += $$PWD/../taglib-1.11/taglib
INCLUDEPATH += $$PWD/../taglib-1.11/taglib/mpeg
DEPENDPATH += $$PWD/../taglib-1.11/taglib/mpeg
INCLUDEPATH += $$PWD/../taglib-1.11/taglib/mpeg/id3v2
DEPENDPATH += $$PWD/../taglib-1.11/taglib/mpeg/id3v2
INCLUDEPATH += $$PWD/../taglib-1.11/taglib/mpeg/id3v2/frames
DEPENDPATH += $$PWD/../taglib-1.11/taglib/mpeg/id3v2/frames
INCLUDEPATH += $$PWD/../taglib-1.11/taglib/toolkit
DEPENDPATH += $$PWD/../taglib-1.11/taglib/toolkit
INCLUDEPATH += $$PWD/../taglib-1.11/taglib/mp4
DEPENDPATH += $$PWD/../taglib-1.11/taglib/mp4
