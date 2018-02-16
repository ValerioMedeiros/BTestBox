#include "btestboxdialog.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    bTestBoxDialog w;
    w.show();
    w.setData(argv[1], argv[2], argv[3]);

    return a.exec();
}
