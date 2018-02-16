#ifndef __REPORTDIALOG_H_
#define __REPORTDIALOG_H_

#include "ui_reportdialog.h"

#include <QDialog>

class QString;

class reportDialog: public QDialog
{
    Q_OBJECT

public:
    explicit reportDialog(QString allProjectsDir, QString copyProjName,
                          QString coverage, QString componentName,
                          int exitCode, QString errorString, QWidget *parent = 0);

    QString getCoverage(QString coverage);

private:
    Ui_reportDialog _ui;

private slots:
    void OpenUrl(QUrl url);
};

#endif // __REPORTDIALOG_H_
