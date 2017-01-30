#ifndef BTESTBOXDIALOG_H
#define BTESTBOXDIALOG_H

#include <QDialog>
#include "probpathdialog.h"
#include "reportdialog.h"

namespace Ui {
class bTestBoxDialog;
}

class bTestBoxDialog : public QDialog
{
    Q_OBJECT

public:
    explicit bTestBoxDialog(QWidget *parent = 0);
    ~bTestBoxDialog();

    QString coverageArgument;
    void hideEverything();
    void showEverything();
    void setData(QString arg1, QString arg2, QString arg3);

private:
    Ui::bTestBoxDialog *ui;
    QString BpdDir;
    QString extensionsDir;
    QString componentName;
    QString atelierBDir;
    QString projectDir;

private slots:
    void enableOkButton();
    void okButtonClicked();
    void changedLanguage(int index);
    void changedCoverageCriteria(int index);
};

#endif // BTESTBOXDIALOG_H
