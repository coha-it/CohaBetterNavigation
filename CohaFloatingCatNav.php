<?php 

namespace CohaFloatingCatNav;

use Shopware\Components\Plugin;

class CohaFloatingCatNav extends Plugin
{

    /**
     * @param \Enlight_Event_EventArgs $args
     * @throws \Exception
     */
    public function onFrontend(\Enlight_Event_EventArgs $args)
    {
        $this->container->get('Template')->addTemplateDir(
            $this->getPath() . '/Resources/views/'
        );
    }
}
