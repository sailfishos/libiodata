TEMPLATE = subdirs

SUBDIRS = src tests type-to-cxx

tests.depends = src
type-to-cxx.depends = src

prf.path =  $$[QT_HOST_DATA]/mkspecs/features

equals(QT_MAJOR_VERSION, 5): prf.files = iodata-qt5.prf
equals(QT_MAJOR_VERSION, 6): prf.files = iodata-qt6.prf

INSTALLS = prf

OTHER_FILES += rpm/*.spec *.prf
