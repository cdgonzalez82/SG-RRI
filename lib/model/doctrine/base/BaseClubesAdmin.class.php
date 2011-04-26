<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('ClubesAdmin', 'doctrine');

/**
 * BaseClubesAdmin
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $club_id
 * @property integer $user_id
 * @property Clubes $Clubes
 * @property sfGuardUser $sfGuardUser
 * 
 * @method integer     getId()          Returns the current record's "id" value
 * @method integer     getClubId()      Returns the current record's "club_id" value
 * @method integer     getUserId()      Returns the current record's "user_id" value
 * @method Clubes      getClubes()      Returns the current record's "Clubes" value
 * @method sfGuardUser getSfGuardUser() Returns the current record's "sfGuardUser" value
 * @method ClubesAdmin setId()          Sets the current record's "id" value
 * @method ClubesAdmin setClubId()      Sets the current record's "club_id" value
 * @method ClubesAdmin setUserId()      Sets the current record's "user_id" value
 * @method ClubesAdmin setClubes()      Sets the current record's "Clubes" value
 * @method ClubesAdmin setSfGuardUser() Sets the current record's "sfGuardUser" value
 * 
 * @package    base_de_datos
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseClubesAdmin extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('clubes_admin');
        $this->hasColumn('id', 'integer', 8, array(
             'type' => 'integer',
             'autoincrement' => true,
             'primary' => true,
             'length' => 8,
             ));
        $this->hasColumn('club_id', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => 8,
             ));
        $this->hasColumn('user_id', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => 8,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Clubes', array(
             'local' => 'club_id',
             'foreign' => 'id'));

        $this->hasOne('sfGuardUser', array(
             'local' => 'user_id',
             'foreign' => 'id'));
    }
}