<?php

class Sadmin_Exception_Internal
    extends Zend_Exception
{
    public function __construct($msg = '', $code = 0, Exception $previous = null)
    {
        //@TODO adjust logging
        parent::__construct($msg, $code, $previous);
    }
}
