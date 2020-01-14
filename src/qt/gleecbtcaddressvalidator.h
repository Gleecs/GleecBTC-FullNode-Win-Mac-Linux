// Copyright (c) 2011-2014 The GleecBTC Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef GLEECBTC_QT_GLEECBTCADDRESSVALIDATOR_H
#define GLEECBTC_QT_GLEECBTCADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class GleecBTCAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit GleecBTCAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** GleecBTC address widget validator, checks for a valid gleecbtc address.
 */
class GleecBTCAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit GleecBTCAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // GLEECBTC_QT_GLEECBTCADDRESSVALIDATOR_H
