<?php
/**
 * This file is part of PHPWord - A pure PHP library for reading and writing
 * word processing documents.
 *
 * PHPWord is free software distributed under the terms of the GNU Lesser
 * General Public License version 3 as published by the Free Software Foundation.
 *
 * For the full copyright and license information, please read the LICENSE
 * file that was distributed with this source code. For the full list of
 * contributors, visit https://github.com/PHPOffice/PHPWord/contributors. test bootstrap
 *
 * @see         https://github.com/PHPOffice/PHPWord
 * @copyright   2010-2018 PHPWord contributors
 * @license     http://www.gnu.org/licenses/lgpl.txt LGPL version 3
 */

$vendorDirPath = realpath(__DIR__ . '/vendor');
//echo __DIR__.$vendorDirPath; die();
if (file_exists($vendorDirPath . '/autoload.php')) {
    require $vendorDirPath . '/autoload.php';
} else {
    throw new Exception(
        sprintf(
            'Could not find file \'%s\'. It is generated by Composer. Use \'install --prefer-source\' or \'update --prefer-source\' Composer commands to move forward.',
            $vendorDirPath . '/autoload.php'
        )
    );
}