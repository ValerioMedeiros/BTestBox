#include "reportdialog.h"

#include <QFile>
#include <QMessageBox>
#include <QTextStream>
#include <QDebug>
#include <QDir>
#include <QUrl>
#include <QDesktopServices>

reportDialog::reportDialog(QString allProjectsDir,
                           QString copyProjName,
                           QString coverage,
                           QString componentName,
                           int exitCode,
                           QString errorText,
                           QWidget *parent) :
    QDialog(parent)
{
    _ui.setupUi(this);
    QString project = "";
    setWindowTitle("Test Report");
    if(exitCode == 0){
        for(int i = allProjectsDir.length(); i > 0; i--){
            if(allProjectsDir[i] == '/' || allProjectsDir[i] == '\\')
            {
                for(int j = 0; j < i; j++)
                {
                    project = project + allProjectsDir[j];
                }
                i = 0;
            }
        }
        QString cov = getCoverage(coverage);
        _ui.reportTextBrowser->setTextInteractionFlags(Qt::LinksAccessibleByMouse);
        _ui.reportTextBrowser->setOpenLinks(false);
        _ui.reportTextBrowser->setHtml(QString("Test Complete!\nThe report is written in the file"
                                    " <a href=\"file:///%1/report_%2_%3.html\">report_%4_%5.html</a> "
                                    "located in the folder %6")
                .arg(project+"/"+copyProjName)
                .arg(cov).arg(componentName).arg(cov).arg(componentName).arg(project+"\\"+copyProjName));
        connect(_ui.reportTextBrowser, SIGNAL(anchorClicked(QUrl)), this, SLOT(OpenUrl(QUrl)));
    }
    else{
        _ui.reportTextBrowser->setPlainText(tr("Test failed!\n Something went wrong!\n\n"
                                               "BTestBox exited with the error:\n")+errorText);
    }
    connect(_ui.okButton, SIGNAL(clicked(bool)), this, SLOT(accept()));
}

QString reportDialog::getCoverage(QString coverage)
{
    if(coverage == "Code Coverage")
    {
        return "CODE";
    }
    else
    {
        if(coverage == "Clause Coverage")
        {
            return "CLAUSE";
        }
        else
        {
            if(coverage == "Path Coverage")
            {
                return "PATH";
            }
            else
            {
                return "BRANCH";
            }
        }
    }
}

void reportDialog::OpenUrl(QUrl url)
{
    QDesktopServices::openUrl(url);
}
