TEMPLATE = subdirs

SUBDIRS = src tests type-to-cxx

prf.path = $$[QT_INSTALL_ARCHDATA]/mkspecs/features
prf.files = iodata-qt5.prf

INSTALLS = prf

OTHER_FILES += rpm/*.spec *.prf
