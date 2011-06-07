<?php



class Zadmin_Db
{
    protected static $_models = array();
    protected static $_inst = null;

    public static function getInstance()
    {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        return self::$_inst;
    }

    public static function getModel($modelName, $options = null)
    {
        $model = 'Model_' . ucfirst($modelName);
        if (array_key_exists($model, self::$_models)) {
            return self::$_models[$model];
        } else {
            self::$_models[$model] = is_null($options) ? new $model : new $model($options);
            return self::$_models[$model];
        }
    }

    public static function __callStatic($name, $arguments)
    {
        self::getInstance()->_lastCalledModel = $name;
        return self::$_inst;
    }

    public function __call($method, $arguments)
    {
        $m = self::getModel($this->_lastCalledModel);
        if (method_exists($m, $method) === false) {
            $msg = 'Invoked method <i>' . $method . '</i> doesn\'t exists in class <i>' . get_class($m) . '</i>';
            throw new Zadmin_Exception_Internal($msg);
        }
        return call_user_func_array(array($m, $method), $arguments);
    }
}
