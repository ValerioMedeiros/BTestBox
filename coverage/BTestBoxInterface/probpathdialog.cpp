#include "ProBPathDialog.h"
#include <QFile>
#include <QMessageBox>
#include <QTextStream>
#include <QDebug>

ProBPathDialog::ProBPathDialog(QWidget *parent) :
    QDialog(parent)
{
    _ui.setupUi(this);

    setWindowTitle(tr("Please insert probcli path"));

    connect(_ui.buttonBox, SIGNAL(accepted()), this, SLOT(accept()));
    connect(_ui.buttonBox, SIGNAL(rejected()), this, SLOT(reject()));
}

QString ProBPathDialog::getLineEdit(){
    return _ui.lineEdit->text();
}
