#ifndef __PROBPATHDIALOG_H_
#define __PROBPATHDIALOG_H_

#include "ui_probpathdialog.h"

#include <QDialog>

class QString;

class ProBPathDialog : public QDialog
{
    Q_OBJECT

public:
    explicit ProBPathDialog(QWidget *parent = 0);

    QString getLineEdit();

private:
    Ui_ProBPathDialog _ui;
};

#endif // __PROBPATHDIALOG_H_
