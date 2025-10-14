import { createRouter, createWebHistory } from 'vue-router';

import wwPage from './views/wwPage.vue';

import { initializeData, initializePlugins, onPageUnload } from '@/_common/helpers/data';

let router;
const routes = [];

function scrollBehavior(to) {
    if (to.hash) {
        return {
            el: to.hash,
            behavior: 'smooth',
        };
    } else {
        return { top: 0 };
    }
}

 
/* wwFront:start */
import pluginsSettings from '../../plugins-settings.json';

// eslint-disable-next-line no-undef
window.wwg_designInfo = {"id":"5694ead8-574f-41fe-bcf0-969899518781","homePageId":"a9836863-72a7-49a1-98fe-bc5c420b444d","authPluginId":null,"baseTag":null,"defaultTheme":"light","langs":[{"lang":"en","default":true}],"background":{},"workflows":[],"pages":[{"id":"d5c1237b-a401-4332-9157-175f87706cb8","linkId":"d5c1237b-a401-4332-9157-175f87706cb8","name":"Contact","folder":null,"paths":{"en":"contact","default":"contact"},"langs":["en"],"cmsDataSetPath":null,"sections":[{"uid":"29b07fe2-2555-408f-89d7-bde2e047b54e","sectionTitle":"Header Section","linkId":"3e64fd80-d281-423d-8051-c89334d3dc4a"},{"uid":"cc289fe1-0a5b-40db-9f2c-43b827b464a2","sectionTitle":"Hero Section","linkId":"3a9844dc-26a8-4e6d-97da-453d23331f1d"},{"uid":"6ee6eb15-c0ce-472f-bd8d-d370ea85aefa","sectionTitle":"Reach Us Section","linkId":"1f609422-1edd-420a-8183-c2a73d214a0c"},{"uid":"6b01bf92-790f-43b9-a25c-f042d9efcc6c","sectionTitle":"How We Can Help Section","linkId":"7f1439a2-1742-4276-b302-053489a3b7c5"},{"uid":"73c494d9-306e-4065-894e-c3faed7bb62f","sectionTitle":"Analytical Testing Services Section","linkId":"0809d0c7-a531-4b7e-9256-034d1d9bf1be"},{"uid":"27aee6a9-211b-4c95-87de-e527637b5425","sectionTitle":"Testing Process Section","linkId":"2db6abfb-9021-4ad4-bed0-d99c3ccb6fd1"},{"uid":"b8b5397b-a4e5-48f7-bb27-519dad1fb7b5","sectionTitle":"Industries We Serve Section","linkId":"1ba94a6a-6aca-4a36-a4e5-6c1b9d30799c"},{"uid":"65a2b789-8a8c-4a4a-b80b-3abed75398e1","sectionTitle":"Testimonials Section","linkId":"b937e45a-518c-4342-bb76-301e85364b7b"},{"uid":"2f39abbb-68a0-45b4-af37-81cf41537ba1","sectionTitle":"FAQ Section","linkId":"08e239db-7f0e-409d-a88c-a4e01448cbbb"},{"uid":"58004df1-48ee-491d-b1d5-c84ca31eb2b7","sectionTitle":"CTA Band Section","linkId":"a9a5b865-a1f7-4c2e-85c8-96ee2d2a7515"},{"uid":"3acebf1c-f03f-48a2-bb7f-96809d0de272","sectionTitle":"Footer Section","linkId":"c6bc58c9-ad71-4d1e-a94d-6b2d2da7f53f"},{"uid":"75212180-d4c8-405c-8e9b-dfb3fe049d8e","sectionTitle":"WhatsApp Float Button","linkId":"6ea6471c-bc91-4e03-9257-9921aca655b8"}],"pageUserGroups":[],"title":{},"meta":{"desc":{},"keywords":{},"socialDesc":{},"socialTitle":{},"structuredData":{}},"metaImage":""},{"id":"a9836863-72a7-49a1-98fe-bc5c420b444d","linkId":"a9836863-72a7-49a1-98fe-bc5c420b444d","name":"Home","folder":null,"paths":{"en":"home","default":"home"},"langs":["en"],"cmsDataSetPath":null,"sections":[{"uid":"7f3a5761-6355-4dcb-a6d5-2d8253edfd66","sectionTitle":"Header Section","linkId":"75600cc8-fe3a-4da2-ac20-c769c46bfb23"},{"uid":"d2edf351-b234-4724-9c1e-e71588d63fbc","sectionTitle":"Hero Section","linkId":"fc58bfa4-cca5-4dc8-9187-75b157c1444e"},{"uid":"cfad7e82-2b82-4aee-ae79-b453416efaeb","sectionTitle":"Who We Work With Section","linkId":"18e3b86c-ad30-43a3-aa54-1e06000d5d6b"},{"uid":"0506787b-94c6-484b-9ac5-db7708350006","sectionTitle":"Trusted By Section","linkId":"8262e982-b111-451c-b2f8-6b3b6e748c3e"},{"uid":"d0b30f6f-ba65-471c-adb1-9897c430bbca","sectionTitle":"Facilities Section","linkId":"3006515c-b436-4d7e-b228-5172a22a1b7a"},{"uid":"033c086e-d341-4a6a-8fd9-06358b709749","sectionTitle":"Beyond Testing Section","linkId":"3d678103-4d79-4f43-a0ab-7c5357c6f77e"},{"uid":"9a2fb1a1-0a9b-4005-b730-7dca841cd26a","sectionTitle":"Government Recognition Section","linkId":"c44c0aaa-2b93-4652-9c9b-24f656820986"},{"uid":"6714e64e-f67f-4bfc-b0ca-30154cbfc381","sectionTitle":"Support Organizations Section","linkId":"7050c770-2ce7-4964-8d18-e2ba6d869011"},{"uid":"fc231b52-3eda-4c58-8de3-2cba09742628","sectionTitle":"How It Works Section","linkId":"351cf55a-dd50-493a-8439-0e1a34d06d5b"},{"uid":"cb1b7e52-5d29-435b-8b48-58c7f503e387","sectionTitle":"Testimonials Section","linkId":"dff8eaf2-8a1c-4e98-9db3-f14eecde2646"},{"uid":"74a382d5-574d-4ba4-a1e4-56c2531d44d4","sectionTitle":"CTA Strip Section","linkId":"51302e9f-f3ac-4d79-8ed3-0be2067c3113"},{"uid":"11ee9aa9-272c-4956-99e5-540f30b80830","sectionTitle":"Footer Section","linkId":"b5e8a66a-61ac-4273-b104-b8e35008d6ea"},{"uid":"466fc4a2-4eac-49af-a4a1-fc52163d5d14","sectionTitle":"WhatsApp Button","linkId":"926c32a1-8528-446f-b74a-768d475f37d6"},{"uid":"a5546883-49d8-4b31-9b8d-0096d1849594","sectionTitle":"Mobile Menu Overlay","linkId":"6886f6b8-7365-497d-8cd2-cf190c1cbbee"}],"pageUserGroups":[],"title":{"en":"","fr":"Vide | Commencer à partir de zéro"},"meta":{"desc":{},"keywords":{},"socialDesc":{},"socialTitle":{},"structuredData":{}},"metaImage":""},{"id":"1ae9357b-e773-466a-a9eb-972cf15369ee","linkId":"1ae9357b-e773-466a-a9eb-972cf15369ee","name":"Aboute","folder":null,"paths":{"en":"aboute","default":"aboute"},"langs":["en"],"cmsDataSetPath":null,"sections":[{"uid":"66371218-4433-47fa-bb6f-38d16f0b76f6","sectionTitle":"Header Section","linkId":"e2093f9a-9442-477b-a324-6352710c46e8"},{"uid":"a25c7e37-5b53-4899-9253-f09dc9fea6c8","sectionTitle":"Hero Section","linkId":"a6f84c95-0031-423e-8683-0e83e004698a"},{"uid":"b19f1d8c-567a-49fc-bdbf-3f0396cf0c67","sectionTitle":"Who We Are Section","linkId":"d06fd3c1-a280-4132-93c4-efbf7eb3fac6"},{"uid":"911fe8fb-2b60-493e-be38-f0b10ca4597b","sectionTitle":"Vision Mission Section","linkId":"bfc291de-89b2-4d39-b534-32e82ad602cb"},{"uid":"92a1cb1f-b448-4f96-99ef-4f0720debf0d","sectionTitle":"Why We Exist Section","linkId":"6b575b7c-ec15-450c-b233-51cc078d3a57"},{"uid":"86f7dc46-e24f-40dc-bb8f-31fcfff69a8e","sectionTitle":"Testing Services Section","linkId":"8f05f51b-24f2-4829-962d-a18f842694a1"},{"uid":"fca462b1-b349-4f18-9451-d30c37dd8b88","sectionTitle":"How RNDgrid Works Section","linkId":"c4a2d6f8-fae8-433e-9abe-b940837095b3"},{"uid":"d4c34547-5a0d-4f29-b78b-38bc9e2851f4","sectionTitle":"Testimonials Section","linkId":"fc0505e3-2f4c-42fb-a089-1208368b5dcc"},{"uid":"f3d2969d-7a8d-4495-9368-b70a53ddeaec","sectionTitle":"CTA Section","linkId":"d8575a38-4e07-4d46-9558-e9a8a7c12261"},{"uid":"41f9fe3c-31db-46fb-bf39-d29629b2d325","sectionTitle":"Footer Section","linkId":"bac9e156-c3a5-4c31-8073-7969ce46fdb2"},{"uid":"0c1c5c49-482b-4341-b5ae-f706001ce1bc","sectionTitle":"WhatsApp Float Button","linkId":"487a8a80-89c9-4504-aad8-93e33623bb56"}],"pageUserGroups":[],"title":{},"meta":{"desc":{},"keywords":{},"socialDesc":{},"socialTitle":{},"structuredData":{}},"metaImage":""}],"plugins":[{"id":"2bd1c688-31c5-443e-ae25-59aa5b6431fb","name":"REST API","namespace":"restApi"}]};
// eslint-disable-next-line no-undef
window.wwg_cacheVersion = 1;
// eslint-disable-next-line no-undef
window.wwg_pluginsSettings = pluginsSettings;
// eslint-disable-next-line no-undef
window.wwg_disableManifest = false;

const defaultLang = window.wwg_designInfo.langs.find(({ default: isDefault }) => isDefault) || {};

const registerRoute = (page, lang, forcedPath) => {
    const langSlug = !lang.default || lang.isDefaultPath ? `/${lang.lang}` : '';
    let path =
        forcedPath ||
        (page.id === window.wwg_designInfo.homePageId ? '/' : `/${page.paths[lang.lang] || page.paths.default}`);

    //Replace params
    path = path.replace(/{{([\w]+)\|([^/]+)?}}/g, ':$1');

    routes.push({
        path: langSlug + path,
        component: wwPage,
        name: `page-${page.id}-${lang.lang}`,
        meta: {
            pageId: page.id,
            lang,
            isPrivate: !!page.pageUserGroups?.length,
        },
        async beforeEnter(to, from) {
            if (to.name === from.name) return;
            //Set page lang
            wwLib.wwLang.defaultLang = defaultLang.lang;
            wwLib.$store.dispatch('front/setLang', lang.lang);

            //Init plugins
            await initializePlugins();

            //Check if private page
            if (page.pageUserGroups?.length) {
                // cancel navigation if no plugin
                if (!wwLib.wwAuth.plugin) {
                    return false;
                }

                await wwLib.wwAuth.init();

                // Redirect to not sign in page if not logged
                if (!wwLib.wwAuth.getIsAuthenticated()) {
                    window.location.href = `${wwLib.wwPageHelper.getPagePath(
                        wwLib.wwAuth.getUnauthenticatedPageId()
                    )}?_source=${to.path}`;

                    return null;
                }

                //Check roles are required
                if (
                    page.pageUserGroups.length > 1 &&
                    !wwLib.wwAuth.matchUserGroups(page.pageUserGroups.map(({ userGroup }) => userGroup))
                ) {
                    window.location.href = `${wwLib.wwPageHelper.getPagePath(
                        wwLib.wwAuth.getUnauthorizedPageId()
                    )}?_source=${to.path}`;

                    return null;
                }
            }

            try {
                await import(`@/pages/${page.id.split('_')[0]}.js`);
                await wwLib.wwWebsiteData.fetchPage(page.id);

                //Scroll to section or on top after page change
                if (to.hash) {
                    const targetElement = document.getElementById(to.hash.replace('#', ''));
                    if (targetElement) targetElement.scrollIntoView();
                } else {
                    document.body.scrollTop = document.documentElement.scrollTop = 0;
                }

                return;
            } catch (err) {
                wwLib.$store.dispatch('front/showPageLoadProgress', false);

                if (err.redirectUrl) {
                    return { path: err.redirectUrl || '404' };
                } else {
                    //Any other error: go to target page using window.location
                    window.location = to.fullPath;
                }
            }
        },
    });
};

for (const page of window.wwg_designInfo.pages) {
    for (const lang of window.wwg_designInfo.langs) {
        if (!page.langs.includes(lang.lang)) continue;
        registerRoute(page, lang);
    }
}

const page404 = window.wwg_designInfo.pages.find(page => page.paths.default === '404');
if (page404) {
    for (const lang of window.wwg_designInfo.langs) {
        // Create routes /:lang/:pathMatch(.*)* etc for all langs of the 404 page
        if (!page404.langs.includes(lang.lang)) continue;
        registerRoute(
            page404,
            {
                default: false,
                lang: lang.lang,
            },
            '/:pathMatch(.*)*'
        );
    }
    // Create route /:pathMatch(.*)* using default project lang
    registerRoute(page404, { default: true, isDefaultPath: false, lang: defaultLang.lang }, '/:pathMatch(.*)*');
} else {
    routes.push({
        path: '/:pathMatch(.*)*',
        async beforeEnter() {
            window.location.href = '/404';
        },
    });
}

let routerOptions = {};

const isProd =
    !window.location.host.includes(
        // TODO: add staging2 ?
        '-staging.' + (process.env.WW_ENV === 'staging' ? import.meta.env.VITE_APP_PREVIEW_URL : '')
    ) && !window.location.host.includes(import.meta.env.VITE_APP_PREVIEW_URL);

if (isProd && window.wwg_designInfo.baseTag?.href) {
    let baseTag = window.wwg_designInfo.baseTag.href;
    if (!baseTag.startsWith('/')) {
        baseTag = '/' + baseTag;
    }
    if (!baseTag.endsWith('/')) {
        baseTag += '/';
    }

    routerOptions = {
        base: baseTag,
        history: createWebHistory(baseTag),
        routes,
    };
} else {
    routerOptions = {
        history: createWebHistory(),
        routes,
    };
}

router = createRouter({
    ...routerOptions,
    scrollBehavior,
});

//Trigger on page unload
let isFirstNavigation = true;
router.beforeEach(async (to, from) => {
    if (to.name === from.name) return;
    if (!isFirstNavigation) await onPageUnload();
    isFirstNavigation = false;
    wwLib.globalVariables._navigationId++;
    return;
});

//Init page
router.afterEach((to, from, failure) => {
    wwLib.$store.dispatch('front/showPageLoadProgress', false);
    let fromPath = from.path;
    let toPath = to.path;
    if (!fromPath.endsWith('/')) fromPath = fromPath + '/';
    if (!toPath.endsWith('/')) toPath = toPath + '/';
    if (failure || (from.name && toPath === fromPath)) return;
    initializeData(to);
});
/* wwFront:end */

export default router;
