VERSION = $$(IODATA_VERSION)
TEMPLATE = app
QT -= gui
TARGET = iodata-qt5-type-to-c++

INSTALLS = target

LIBS += -liodata-qt5 -lcrypt
QMAKE_LIBDIR_FLAGS += -L../src

SOURCES = type-to-cxx.cpp

target.path = /usr/bin
