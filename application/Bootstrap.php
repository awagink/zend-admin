<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    
    protected function _initUserModuleAutoloader()
    {
        $loader = new Zend_Application_Module_Autoloader(array(
                    'namespace' => '',
                    'basePath' => APPLICATION_PATH
                ));
        $loader->addResourceTypes(array(
            'model' => array(
                'path'      => 'models',
                'namespace' => 'Model'
            )
        ));
    }

//    protected function _initView()
//    {
//        $this->bootstrap('layout');
//        $view = $this->getResource('layout')->getView();
//        $view->addHelperPath('Expo/View/Helper', 'Expo_View_Helper');
//        $view->addHelperPath('ZendX/JQuery/View/Helper', 'ZendX_JQuery_View_Helper');
//        $view->jQuery()
//             //->setVersion('1.4.2')
//             ->addStylesheet('/css/jquery-ui-1.8.2.css')
//             ->setLocalPath('/js/jquery-1.4.2.min.js')
//             ->setUiLocalPath('/js/jquery-ui-1.8.2.min.js')
//             ->uiEnable()
//             ->enable();
//    }
    
    protected function _initLogging()
    {
        $this->bootstrap('frontController');
        $this->bootstrap('db');

        $logger = new Zend_Log();

        switch (APPLICATION_ENV) {
            case 'development':
                $db = Zend_Db_Table::getDefaultAdapter();
                $profiler = new Zend_Db_Profiler_Firebug('Db profiler');

                $profiler->setEnabled(true);

                $db->setProfiler($profiler);

                $writer = new Zend_Log_Writer_Firebug();
                $logger->addWriter($writer);

                Zend_Registry::set('profiler', $profiler);
                break;
//            case 'production':
//                break;
            default://production
                $path = APPLICATION_PATH . '/../data/logs/main.log.txt';
                $writer = new Zend_Log_Writer_Stream($path);
                $logger->addWriter($writer);
                break;
        }

        $this->_logger = $logger;
        Zend_Registry::set('log', $logger);
    }

    protected function _initRoute()
    {
        $router = Zend_Controller_Front::getInstance()->getRouter();
        $router->addRoute(
                'catalog', new Zend_Controller_Router_Route_Regex(
                        'catalog/(\d+)(/page/(\d+))?',
                        array(
                            'controller' => 'catalog',
                            'action'     => 'index',
                        ),
                        array(
                            '1' => 'id',
                            '3' => 'page'
                        )
                )
        );
        $router->addRoute(
                'exhibition', new Zend_Controller_Router_Route(
                        'ex/:id',
                        array(
                            'controller' => 'exhibition',
                            'action'     => 'view'
                        ),
                        array(
                            'id' => '\d+'
                        )
                )
        );
        $router->addRoute(
                'profile', new Zend_Controller_Router_Route(
                        'profile/:id',
                        array(
                            'controller' => 'profile',
                            'action'     => 'view',
                        ),
                        array(
                            'id' => '\d+'
                        )
                 )
        );
        $router->addRoute(
                'page', new Zend_Controller_Router_Route(
                        'page/:name',
                        array(
                            'controller' => 'page',
                            'action'     => 'index',
                        )
                )
        );
        $router->addRoute(
                'article', new Zend_Controller_Router_Route(
                        'article/:id',
                        array(
                            'controller' => 'page',
                            'action'     => 'article',
                            'id'         => null
                        )
                )
        );
        $router->addRoute(
                'news', new Zend_Controller_Router_Route(
                        'news/:id',
                        array(
                            'controller'    => 'page',
                            'action'        => 'news',
                            'id'            => null
                        )
                )
        );
        return $router;
    }
}

