<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mahasiswa".
 *
 * @property int $Nim
 * @property string $Nama
 * @property string $Jurusan
 * @property string $TTL
 * @property string $Alamat
 */
class Mahasiswa extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mahasiswa';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Nama', 'Jurusan', 'TTL', 'Alamat'], 'required'],
            [['Nama', 'Jurusan', 'TTL'], 'string', 'max' => 50],
            [['Alamat'], 'string', 'max' => 70],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'Nim' => 'Nim',
            'Nama' => 'Nama',
            'Jurusan' => 'Jurusan',
            'TTL' => 'Ttl',
            'Alamat' => 'Alamat',
        ];
    }
}
