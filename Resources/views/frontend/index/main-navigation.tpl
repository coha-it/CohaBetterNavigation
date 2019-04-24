{extends file="parent:frontend/index/main-navigation.tpl"}

{block name='frontend_index_navigation_categories_top_entry'}
    {if !$sCategory.hideTop}

        {*$sCategory->getAttribute('coha_cat_floating_direction')|@var_dump*}
        {*$sCategory->getAttribute()|@var_dump*}
        {$coha_nav_space = $sCategory.attribute.coha_navigation_space}

        <li class="navigation--entry{if $sCategory.flag} is--active{/if} {if $coha_nav_space}coha--navigation-space{/if}" role="menuitem">
            {block name='frontend_index_navigation_categories_top_link'}
                <a class="navigation--link{if $sCategory.flag} is--active{/if}" href="{$sCategory.link}" title="{$sCategory.description}" itemprop="url"{if $sCategory.external && $sCategory.externalTarget} target="{$sCategory.externalTarget}"{/if}>
                    <span itemprop="name">{$sCategory.description}</span>
                </a>
            {/block}
        </li>
    {/if}
{/block}

{block name="frontend_index_navigation_categories_top_after"}
    {$smarty.block.parent}
    {action module=widgets controller=checkout action=info}
{/block}
