android: QT *= androidextras

HEADERS += \
	$$PWD/androidutils.h \
	$$PWD/filechooser.h \
    $$PWD/sharedpreferences.h

SOURCES += \
	$$PWD/androidutils.cpp \
	$$PWD/filechooser.cpp \
    $$PWD/sharedpreferences.cpp
    
RESOURCES += \
	$$PWD/de_skycoder42_androidutils.qrc

INCLUDEPATH += $$PWD

DISTFILES += \
	$$PWD/android/androidutils.gradle \
	$$PWD/android/src/de/skycoder42/androidutils/AlarmReceiver.java \
	$$PWD/android/src/de/skycoder42/androidutils/AndroidUtils.java \
	$$PWD/android/src/de/skycoder42/androidutils/FileChooser.java \
    $$PWD/android/src/de/skycoder42/androidutils/PrefHelper.java

QPM_TRANSLATIONS += $$PWD/androidutils_de.ts \
	$$PWD/androidutils_template.ts

android {
	HEADERS += $$PWD/contentdevice.h
	SOURCES += $$PWD/contentdevice.cpp

	isEmpty(QPM_ROOT): QPM_ROOT = $$_PRO_FILE_PWD_/vendor

	copygradle.path = /
	copygradle.files = $$PWD/android/androidutils.gradle

	setupnative.path = /
	setupnative.files =
	setupnative.commands = echo 'addAndroidUtilsPath\\(\\\"$$QPM_ROOT/android/native/pri/java/src/\\\"\\)' >> $(INSTALL_ROOT)/androidutils.gradle
	setupnative.depends = install_copygradle

	setupgradle.path = /
	setupgradle.files =
	setupgradle.commands = echo 'addAndroidUtilsPath\\(\\\"$$PWD/android/src\\\"\\)' >> $(INSTALL_ROOT)/androidutils.gradle
	setupgradle.depends = install_copygradle

	INSTALLS += copygradle setupnative setupgradle
}

noJniOnLoad: DEFINES += NO_JNI_ONLOAD
