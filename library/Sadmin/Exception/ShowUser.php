<?php

class Sadmin_Exception_ShowUser
    extends Zend_Exception
{
    public function __construct($msg = '', $code = 0, Exception $previous = null)
    {
        parent::__construct($msg, $code, $previous);
    }
}
