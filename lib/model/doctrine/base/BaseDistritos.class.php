<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('Distritos', 'doctrine');

/**
 * BaseDistritos
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $distrito
 * @property integer $gd_id
 * @property integer $rdr_id
 * @property integer $rdi_id
 * @property integer $aim_id
 * @property Aims $Aims
 * @property Doctrine_Collection $Clubes
 * @property Doctrine_Collection $DistritosAdmin
 * @property sfGuardUser $sfGuardUser
 * @property sfGuardUser $sfGuardUser_1
 * @property sfGuardUser $sfGuardUser_2
 * 
 * @method integer             getId()             Returns the current record's "id" value
 * @method integer             getDistrito()       Returns the current record's "distrito" value
 * @method integer             getGdId()           Returns the current record's "gd_id" value
 * @method integer             getRdrId()          Returns the current record's "rdr_id" value
 * @method integer             getRdiId()          Returns the current record's "rdi_id" value
 * @method integer             getAimId()          Returns the current record's "aim_id" value
 * @method Aims                getAims()           Returns the current record's "Aims" value
 * @method Doctrine_Collection getClubes()         Returns the current record's "Clubes" collection
 * @method Doctrine_Collection getDistritosAdmin() Returns the current record's "DistritosAdmin" collection
 * @method sfGuardUser         getSfGuardUser()    Returns the current record's "sfGuardUser" value
 * @method sfGuardUser         getSfGuardUser1()   Returns the current record's "sfGuardUser_1" value
 * @method sfGuardUser         getSfGuardUser2()   Returns the current record's "sfGuardUser_2" value
 * @method Distritos           setId()             Sets the current record's "id" value
 * @method Distritos           setDistrito()       Sets the current record's "distrito" value
 * @method Distritos           setGdId()           Sets the current record's "gd_id" value
 * @method Distritos           setRdrId()          Sets the current record's "rdr_id" value
 * @method Distritos           setRdiId()          Sets the current record's "rdi_id" value
 * @method Distritos           setAimId()          Sets the current record's "aim_id" value
 * @method Distritos           setAims()           Sets the current record's "Aims" value
 * @method Distritos           setClubes()         Sets the current record's "Clubes" collection
 * @method Distritos           setDistritosAdmin() Sets the current record's "DistritosAdmin" collection
 * @method Distritos           setSfGuardUser()    Sets the current record's "sfGuardUser" value
 * @method Distritos           setSfGuardUser1()   Sets the current record's "sfGuardUser_1" value
 * @method Distritos           setSfGuardUser2()   Sets the current record's "sfGuardUser_2" value
 * 
 * @package    Sistema de Gestion - Rotaract Rotary e Interact
 * @subpackage model
 * @author     Gaspar Zaragoza
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDistritos extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('distritos');
        $this->hasColumn('id', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => true,
             'autoincrement' => true,
             'length' => 8,
             ));
        $this->hasColumn('distrito', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => 8,
             ));
        $this->hasColumn('gd_id', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 8,
             ));
        $this->hasColumn('rdr_id', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 8,
             ));
        $this->hasColumn('rdi_id', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 8,
             ));
        $this->hasColumn('aim_id', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 8,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Aims', array(
             'local' => 'aim_id',
             'foreign' => 'id'));

        $this->hasMany('Clubes', array(
             'local' => 'id',
             'foreign' => 'distrito_id'));

        $this->hasMany('DistritosAdmin', array(
             'local' => 'id',
             'foreign' => 'distrito_id'));

        $this->hasOne('sfGuardUser', array(
             'local' => 'gd_id',
             'foreign' => 'id'));

        $this->hasOne('sfGuardUser as sfGuardUser_1', array(
             'local' => 'rdr_id',
             'foreign' => 'id'));

        $this->hasOne('sfGuardUser as sfGuardUser_2', array(
             'local' => 'rdi_id',
             'foreign' => 'id'));
    }
}