VERSION = 0.$$(IODATA_VERSION)
TEMPLATE=lib
QT -= gui

HEADERS = iodata.h validator.h storage.h misc.h log.h
SOURCES = iodata.cpp validator.cpp storage.cpp misc.cpp

equals(QT_MAJOR_VERSION, 5): TARGET = iodata-qt5
equals(QT_MAJOR_VERSION, 6): TARGET = iodata-qt6
target.path = $$[QT_INSTALL_LIBS]

devheaders.files = iodata.h validator.h storage.h iodata validator storage
equals(QT_MAJOR_VERSION, 5): devheaders.path  = /usr/include/iodata-qt5
equals(QT_MAJOR_VERSION, 6): devheaders.path  = /usr/include/iodata-qt6

INSTALLS = target devheaders

FLEXSOURCES = datalang.l
BISONSOURCES = datalang.y
QMAKE_EXTRA_COMPILERS += bison flex bisonh

flex.commands = flex -o tokens.cpp ${QMAKE_FILE_IN}
flex.input = FLEXSOURCES
flex.output = tokens.cpp
flex.variable_out = SOURCES
flex.depends = parser.hpp
flex.name = flex

bison.commands = bison -v -d -o parser.cpp ${QMAKE_FILE_IN}
bison.input = BISONSOURCES
bison.output = parser.cpp
bison.variable_out = SOURCES
bison.name = bison

bisonh.commands = true
bisonh.input = BISONSOURCES
bisonh.output = parser.hpp
bisonh.variable_out = HEADERS
bisonh.name = bison header
bisonh.depends = parser.cpp
