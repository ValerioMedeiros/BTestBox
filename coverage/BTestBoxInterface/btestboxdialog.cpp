#include "btestboxdialog.h"
#include "ui_btestboxdialog.h"

#include <QProcess>
#include <QDebug>
#include <QtCore/QFile>
#include <QtCore/QRegExp>
#include <QMessageBox>
#include <QDir>

bTestBoxDialog::bTestBoxDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::bTestBoxDialog)
{
    ui->setupUi(this);
    ui->allOperationsCheckBox->setChecked(true);
    ui->allOperationsCheckBox->setEnabled(false);
    ui->notImplementedLabel->hide();

    connect(ui->cancelButton, SIGNAL(clicked(bool)), this, SLOT(reject()));
    connect(ui->testProjectNameLineEdit, SIGNAL(textChanged(const QString &)),
            this, SLOT(enableOkButton()));
    connect(ui->compilerLineEdit, SIGNAL(textChanged(const QString &)),
            this, SLOT(enableOkButton()));
    connect(ui->languageComboBox, SIGNAL(currentIndexChanged(int)), this,
            SLOT(changedLanguage(int)));
    connect(ui->okButton, SIGNAL(clicked(bool)), this, SLOT(okButtonClicked()));
    //connect(ui->coverageComboBox, SIGNAL(currentIndexChanged(int)), this,
    //        SLOT(changedCoverageCriteria(int));
}

bTestBoxDialog::~bTestBoxDialog()
{
    delete ui;
}

void bTestBoxDialog::changedLanguage(int index)
{
    switch(index)
    {
    case 0:
        ui->translationProfileComboBox->clear();
        ui->translationProfileComboBox->addItem("C9X");
        ui->translationProfileComboBox->addItem("PROJECT");
        ui->translationProfileComboBox->addItem("LIGHT");
        ui->translationProfileComboBox->addItem("01");
        showEverything();
        break;
    case 1:
        hideEverything();
        break;
    }
}

void bTestBoxDialog::enableOkButton()
{
    if(!ui->testProjectNameLineEdit->text().isEmpty() &&
            !ui->compilerLineEdit->text().isEmpty())
    {
        ui->okButton->setEnabled(true);
    }
    else
    {
        ui->okButton->setEnabled(false);
    }
}

void bTestBoxDialog::showEverything()
{
    ui->notImplementedLabel->hide();
    ui->translationProfileComboBox->show();
    ui->translationProfileLabel->show();
    ui->coverageComboBox->show();
    ui->coverageLabel->show();
    ui->operationsToTestScrollArea->show();
    ui->testProjectNameLabel->show();
    ui->testProjectNameLineEdit->show();
    ui->optionalArgumentsLabel->show();
    ui->optionalArgumentsLineEdit->show();
    ui->compilerLabel->show();
    ui->compilerLineEdit->show();
}

void bTestBoxDialog::hideEverything()
{
    ui->translationProfileComboBox->clear();
    ui->notImplementedLabel->show();
    ui->translationProfileComboBox->hide();
    ui->translationProfileLabel->hide();
    ui->coverageComboBox->hide();
    ui->coverageLabel->hide();
    ui->operationsToTestScrollArea->hide();
    ui->testProjectNameLabel->hide();
    ui->testProjectNameLineEdit->hide();
    ui->optionalArgumentsLabel->hide();
    ui->optionalArgumentsLineEdit->hide();
    ui->compilerLabel->hide();
    ui->compilerLineEdit->hide();
}

void bTestBoxDialog::changedCoverageCriteria(int index)
{
    switch(index)
    {
    case 0:
        coverageArgument = "code";
        break;
    case 1:
        coverageArgument = "path";
        break;
    case 2:
        coverageArgument = "branch";
        break;
    case 3:
        coverageArgument = "clause";
        break;
    }
}

void bTestBoxDialog::setData(QString arg1, QString arg2, QString arg3)
{
    atelierBDir = "";
    projectDir = "";
    BpdDir = arg1;
    for(int i = BpdDir.length()-1; i > 0; i--)
    {
        if(BpdDir[i] == '/' || BpdDir[i] == '\\')
        {
            for(int j = 0; j < i; j++)
            {
                projectDir = projectDir + BpdDir[j];
            }
            i = 0;
        }
    }
    extensionsDir = arg2;
    for(int i = extensionsDir.length()-1; i > 0; i--)
    {
        if(extensionsDir[i] == '/' || extensionsDir[i] == '\\')
        {
            for(int j = 0; j < i; j++)
            {
                atelierBDir = atelierBDir + extensionsDir[j];
            }
            i = 0;
        }
    }
    componentName = arg3;
}

void bTestBoxDialog::okButtonClicked()
{
    QStringList arguments;
    QString proBDir = "";
    QProcess *process = new QProcess();
    arguments << ui->languageComboBox->currentText();
    if(ui->translationProfileComboBox->isVisible())
    {
        arguments << ui->translationProfileComboBox->currentText();
    }
    else
    {
        arguments << "noProfile";
    }
    //arguments << coverageArgument;
    arguments << ui->coverageComboBox->currentText();
    arguments << atelierBDir;
    arguments << projectDir;
    arguments << ui->testProjectNameLineEdit->text();
    arguments << componentName;
    arguments << ui->compilerLineEdit->text();
    QFile file(atelierBDir+"/AtelierB");
    if(!file.open(QIODevice::ReadWrite))
    {
        QMessageBox::information(0, "Error", file.errorString());
    }
    QTextStream textStream(&file);
    QString text = textStream.readAll();
    QRegExp rx;
    rx.setPattern("(ATB\\*ATB\\*ProB_Command): (\\S+)");
    if(rx.indexIn(text) != -1)
    {
        proBDir = rx.cap(2);
    }
    else
    {
        ProBPathDialog *proBDialog = new ProBPathDialog(this);
        if(proBDialog->exec()){
            QApplication::processEvents();
            proBDir = proBDialog->getLineEdit();
        }
    }
    arguments << proBDir;
    if(!ui->optionalArgumentsLineEdit->text().isEmpty())
        arguments << ui->optionalArgumentsLineEdit->text();
    QString program = atelierBDir+QDir::separator()+"bbin"+QDir::separator()+"win32" +QDir::separator()+"btestbox.exe";
    int exitedCode;
    QString errorText;
    process->start(program, arguments, QIODevice::ReadWrite | QIODevice::Text);
    if(!process->waitForFinished(-1))
    {
        process->error();
    }
    exitedCode = process->exitCode();
    errorText = process->readAllStandardError();
    accept();
    reportDialog *rD = new reportDialog(projectDir,
                                        ui->testProjectNameLineEdit->text(),
                                        ui->coverageComboBox->currentText(),
                                        componentName,
                                        exitedCode,
                                        errorText,
                                        this);
    rD->exec();
}
