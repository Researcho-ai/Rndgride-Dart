import emitter from 'tiny-emitter/instance';
import services from './services/index.js';
import { useIconsStore } from '@/pinia/icons';

 /* wwFront:start */
// eslint-disable-next-line no-undef
import plugin_2bd1c688_31c5_443e_ae25_59aa5b6431fb from '@/components/plugins/plugin-2bd1c688-31c5-443e-ae25-59aa5b6431fb/src/wwPlugin.js';
/* wwFront:end */

import { computed, reactive } from 'vue';

export default {
    ...services,
     $on(event, fn) {
        emitter.on(event, fn);
    },
    $once(event, fn) {
        emitter.once(event, fn);
    },
    $emit(event, ...args) {
        if (!event) {
            return;
        }
        emitter.emit(event, ...args);
    },
    $off(event, fn) {
        emitter.off(event, fn);
    },
     front: {},
    $focus: null,
    env: process.env.NODE_ENV,
    async initFront({ router, store }) {
 
        this.front.router = router;
        /* wwFront:start */
        this.$store = store;
        /* wwFront:end */

        //Init services
        this.wwLog.init();

 
        wwLib.logStore.verbose('Starting the application...');
        await this.wwWebsiteData.init();
        this.wwLang.init(router);

        /* wwFront:start */
        // eslint-disable-next-line no-undef
        wwLib.wwPluginHelper.registerPlugin('plugin-2bd1c688-31c5-443e-ae25-59aa5b6431fb', plugin_2bd1c688_31c5_443e_ae25_59aa5b6431fb);
        /* wwFront:end */

 
        services.scrollStore.start();
        services.keyboardEventStore.start();
    },
     // TODO: Verify with Alexis, still uses wwImageMultiLang
    getResponsiveStyleProp({ store, style, uid, states = [], prop }) {
        store = store || wwLib.getFrontWindow().wwLib.$store;
        if (!style && uid) {
            const wwObject = this.$store.getters['websiteData/getWwObjects'][uid];
            if (!wwObject) return '';
            style = (wwObject._state || {}).style || {};
        }

        const screenSizes = store.getters['front/getScreenSizes'];
        const screenSize = store.getters['front/getScreenSize'];

        let value = '';

        for (const media in screenSizes) {
            if (style[media] && typeof style[media][prop] !== 'undefined') {
                value = style[media][prop];
            }
            if (media === screenSize) {
                break;
            }
        }
        for (const state of states) {
            for (const media in screenSizes) {
                if (style[`${state}_${media}`] && style[`${state}_${media}`][prop]) {
                    value = style[`${state}_${media}`][prop];
                }
                if (media === screenSize) {
                    break;
                }
            }
        }

        return value;
    },
    globalContext: reactive({
        page: computed(() => {
            const page = wwLib.$store.getters['websiteData/getPage'];
            if (!page) return {};
            else if (!page.cmsDataSetPath) return { ...pageSanitizer(page) };
            return { ...pageSanitizer(page), data: wwLib.$store.getters['data/getPageCollectionData'] };
        }),
        pageParameters: computed(() => {
            const pageParameters = Object.values(wwLib.$store.getters['data/getPageParameterVariables']);
            const pageParametersValueMap = {};
            for (const pageParameter of pageParameters) pageParametersValueMap[pageParameter.id] = pageParameter.value;
            return pageParametersValueMap;
        }),
        pages: computed(() => {
            const pages = wwLib.$store.getters['websiteData/getPages'];
            const pagesValueMap = {};
            for (const page of pages) pagesValueMap[page.id] = pageSanitizer(page);
            return pagesValueMap;
        }),
        colors: computed(() => {
            const theme = wwLib.$store.getters['front/getTheme'];
             /* wwFront:start */
            // eslint-disable-next-line no-unreachable, no-undef
            return theme === 'dark' ? {"ff84a538-3b17-43df-84c5-62ce53fc8100":"#F8FAFC","b3a3bc5b-7e1f-4e6e-b04e-271e50b3ac29":"#CBD5E1","9c69243d-ea77-4a8e-a7c9-30a3fc9702bb":"#94A3B8","80f1d3e0-6f5d-4248-8a7c-df9dc3fd8d59":"#1E293B","e6bc7505-420b-45f3-b54b-c97bc1990c2e":"#334155","84c945ff-a1a0-4cfd-a6ab-6cb740b8358f":"#0F172A","24b32be1-fde3-428e-bab9-346333ccfc1b":"#475569","be3e5222-a70b-4980-a59b-eb76ff4d9973":"#334155","b3b4c89f-c52b-463c-9892-fe8381153fd1":"#4568dc","366aef8c-4b2a-4683-8773-2bb409358060":"#b06ab3","f139f784-c380-4e3d-a8a4-0c04f0dd654d":"#FFFFFF","8f8ec30c-f135-49f7-82b8-f72da2eb60a4":"#6b8aef","41d482ba-a524-4919-ac16-e1bf0ca365ad":"#5a7ae8","a5b01be7-37ac-4d51-aff6-1d293073141f":"#1a2332","d8088c42-216f-45fe-b570-3dcadf2b25e6":"#2a3544","e7d7a2e8-d0e9-4e7e-920e-902eb1847a0f":"#94A3B8","93c532e9-7b6c-4149-9571-3ca05a4b1ac6":"#475569","5fbb86f0-44a7-4cd0-8891-6039589d84bf":"#5a7ae8","23e5f1db-f75d-4a3c-8bb9-ed0d5ae89e99":"#1a2332","0df6a459-0578-4af7-8c98-90e81af09271":"#2a1f32","0a820312-374d-41b6-89d8-2d43fe47f41f":"#2a3f6f","75f104a9-323a-48bb-8c63-a035c6ba890c":"#2a1f32","2f34a284-e7c1-42aa-834b-cf29c14ac272":"#331a24","75ba3157-31ef-46a8-80ba-f72b9c20242e":"#332a1a","e60d8bcb-c27b-4c3e-b4b9-68fa5dbb1775":"#1a2833","17cd8f80-1db4-4821-a6e7-3c01edd73d9b":"#1f331a","41e7b84f-dc52-4840-8528-b0af270b103f":"#33241a","0cdb794e-5335-4c2c-b387-4db3d6885c8f":"#331a28","f449d180-0a20-4b36-9093-9e60f78d0e00":"#1a2433","fa783e4a-7568-4445-8d8a-6b62e478b5ca":"#331a2a","edcacd73-846a-4f4d-8ed0-72ad9bbecc30":"#332a1a","18b6bb6e-771c-4c93-83b5-afbea20e92f2":"#1a331f","59886951-6b67-4dfc-b57f-33d4fa303e28":"#241a33","c75d10f0-5580-46de-8932-f782217b922c":"#4568DC","7a3e0094-eb34-4fcc-8f9a-3fcd39b68b56":"#6A5ACD","e02d8630-0ea8-4b2d-8b63-bd2cbe7f6b3b":"#A163F7","f207d49d-558e-4538-9acc-902b47c3d089":"#B06AB3","6ad663e0-97d9-4f97-a301-fd60cd46ba3f":"#1E2330","050a1626-15a3-4f39-b10c-4ef30dd9e2a4":"#2B3344","e78c08ba-5686-4e87-bdd8-c0fdd77d0152":"#1E293B","61371863-d3c9-428a-8d13-f04004badd06":"rgba(69,104,220,0.08)","bf5411f1-170f-4df9-a32d-4fbcc9e7bbda":"#F8FAFC","56c99fd9-334f-4218-ae74-204479f27036":"#E6EAF2","dc2f81a7-4c35-4ed3-8e7e-1e55476fdfa1":"#95A3B8","7a32e7fe-f67a-4fda-aea0-8637d7594e1a":"#1E2A3A","b5a74405-b2e6-49fe-bb1c-e8c23d0e7269":"rgba(69,104,220,0.15)","b2c14e2b-fc4f-44a4-9938-201c1df52471":"#6b8aef","e0e040fa-695c-40a1-a4c4-06cbc43cbe31":"#95A3B8","84d21b6a-d125-4d2f-b553-5c1ded1b8e7c":"#B0B8D0","b047efdb-3639-4ef3-a0dc-e6c23ff089ea":"#22C55E","4c231490-ca69-4696-95e6-d83614018d6e":"#0F1724","8d0dbffe-5039-4bd1-a33d-c6acbc88ad9b":"#E6EAF2","744c1428-1983-4d10-b199-9d7332d3e7f1":"#95A3B8","b2cce1ec-0d63-4cc5-a8ba-9d0f670de352":"#1E2A3A","ea4b8b24-95fd-41c4-82ca-154439630642":"#25D366","cfe5ca24-1c60-4a3d-83ea-4f6ee76325d2":"#FEC84B","03f97d03-e8b5-4260-b9a6-84b4e9ac4edb":"#000000D9","db07d869-7076-4fff-8cb5-8f81b9060866":"#00000040","afb0622b-008d-4d99-893c-0f0ebe9cb2ae":"#00000073","7135d9d0-003f-4d5b-979b-4835ed0b65bd":"#0000000F","269e56d1-6215-4b79-9d82-7e6cee40fa2a":"#000000D9","8fbac7c3-9c29-4120-a916-efddf0ee92e0":"#00000040","b841af6a-0836-4052-adfd-99ee3aa9ee4a":"#FFFFFF","a30feb65-a942-4bac-9f38-16dfb4436c11":"#e1e3e5","02e08795-d352-49fd-bc93-5286044ef953":"#c2c7ce","c8122ad7-6c9a-437c-84eb-04e924772175":"#a3acb9","e04035ac-59ff-4f90-9036-1e77cda9cb24":"#8692a1","fdb7537c-e7ec-40ba-a311-0e01c275a6ee":"#6c7888","a74a44a9-425f-4705-b866-f1421c68df52":"#545f6c","781a330b-49ce-4467-80f7-40a4a21b1299":"#3f4750","34573081-741e-4f9b-bb0a-b54fa699d29d":"#2a2f34","04645073-e69e-4e73-80ef-5f1f56118c99":"#151618","44df1337-b30d-48d2-9cdf-9c0ce338502e":"#e2e2e2","b56a2bd5-4834-484d-8ecb-7760c0ebc14b":"#c7c7c7","e964af1c-8020-4e44-96df-93b418abf1ff":"#ababab","aed66389-4433-45b2-be66-5622e3df32e7":"#919191","5172739f-2906-4f10-a758-a1d4929606dc":"#777777","eb5500ae-9ab2-4f6a-83e9-afdc2e3bc1b2":"#5e5e5e","1804f5dd-ffbe-4d0f-a18e-7d9af9eb1c8f":"#464646","f0e9c89a-44ab-4e0e-b1d4-1c223f5c1088":"#2e2e2e","4cb797eb-6ee0-474f-b1dc-99461ce603bc":"#161616","9e8130f5-d6e8-45fe-a977-2cc5e23c6bbb":"#f8f8f7","0f661c98-70c5-4b0f-9ce1-6f860eb63b49":"#e5e2de","bb3eaa2d-d4b7-4b14-8e3d-245d1ff7d00b":"#cdc5bc","0b2b321a-ec10-4f3b-bbbb-469272549bdb":"#b5aa9c","6b06c6ba-a34b-4c75-ad9b-bfb7e3d302d4":"#9b8f7f","f61a0146-c1a8-43c8-84e7-9167aa1bb25f":"#817566","a182872b-7383-46fd-a619-8f51d0d52e37":"#675c50","7950677e-aad2-4e7e-a55b-a0e4b568b0c6":"#4c443b","a1277df6-36d4-45aa-b73c-b3e8c1ead1b5":"#322d27","bfdde87c-ea57-4199-bdd9-93db2a273c9a":"#181613","04b93f0a-1fe2-4b5d-8f1a-a487c7c67ef3":"#d1e4ff","d4334cce-a468-42bf-9a6d-51aed19f8289":"#a2caff","b5bcca88-2522-4e68-880e-aee6d63a2e47":"#6faeff","b8065e7d-980b-4ae1-9b66-71c23c085a2a":"#3090ff","c9179837-9d7e-4518-9fa7-8e065db8409d":"#0075df","9821eac7-4263-4bb8-964c-47ddd1b963cf":"#005db1","8bea7fb1-7617-43d7-8391-a42a8ba2ed9f":"#004585","18dcd57b-d6f9-4fa8-9967-a2082f8b8c8e":"#002e5b","dbefda4d-f2df-4a94-aa56-d154013e03e3":"#001631","e9446b2b-09b0-4e6b-90aa-7d5760edcf4b":"#f5ddcf","0fb23398-7e19-4878-943c-6cc4cb22e0c7":"#f6b791","032d8d1a-8928-494b-86d7-0b10c8b6bb69":"#f68c47","95f27f34-c853-49ff-ace4-f3d827bef530":"#de6c0b","d1b5feb5-be21-4239-a938-9b35641d53c2":"#b95700","5cf45ebd-4fc2-4d74-b7cf-022e9de4249f":"#944403","ea6e1fcd-450b-4bf8-a835-8c85eb7e7f73":"#6f3207","31c43a43-4017-45f3-a88b-fc93427b6464":"#49220a","61a949be-2329-417a-8c47-8d5060a73eed":"#231107","e3bb1f43-e60f-47a9-8d3d-f436511c95eb":"#faf8ed","b19a2186-b06d-4a00-abc7-59a8b7252439":"#f1e3a9","eaebb6eb-2114-42ef-9d3f-66c1037222f0":"#c8aa19","c17c036a-24b7-435f-b6d0-2be3936c5447":"#8d7500","14f92e1b-c639-4e6a-b09d-6a189218f090":"#544406","4f0c4735-5c98-4ddc-9714-73d4410e47f9":"#382d07","defdd300-5ef6-4a2e-9852-0328005bf8b7":"#f4faf3","23aa7fa3-11f0-4d27-aa14-fb0a7d2473ed":"#c6f0c5","b4a51e39-8e67-48ae-82b5-041ab116b358":"#53c954","4c0c4797-47f3-416e-8f49-9e7749abc810":"#2aad2c","efd91745-2fb2-4e7e-a5b0-9f0a372dcdcd":"#1e7118","e5693771-d83f-46ab-85b6-7e9b0f1ea8c3":"#1a3616","a0df6c5b-9408-4825-809c-bd96f7a6ccb8":"#faf7f7","fb469904-507a-456a-930a-982b7010ca01":"#f6efee","6bd67ea2-8fa9-43a5-8cf5-50f625558e3c":"#f3b5b0","c8ad9641-1f8b-4f9e-972e-24d3d7c79164":"#fa444d","fb8a0c40-ded1-491a-bac7-14016b364ef0":"#af1129","2c7bfcbf-d833-46b0-9e49-bff3a2696a1f":"#4f1a1c","abd52525-b934-474f-8b93-e976fece5f80":"#e3c645","1ddbd5a9-0bf6-4f67-99f4-c4846032af7f":"#ab8f05","24ab4fe2-969e-4cbc-9985-89c353066a89":"#705c03","13fc8b4f-a356-4975-ba62-96bb6aa8fd25":"#1c1604","fa4d9179-2c75-4b4e-ac46-90ca735cc6d2":"#e6f6e6","cacd1009-7dcd-4c7b-a9d4-8978050bcaf9":"#7ee27f","9475d0e1-b273-475a-b540-5fe7d8df2ea6":"#009100","ae584ace-7bbd-4b34-8713-e000815bf128":"#23521d","157c9b53-591d-410e-9018-916de18e1c0f":"#0d1a0a","dcf7d119-b64f-4e4f-ba82-20185e1e3375":"#f2dddb","74b3c7e8-14ef-4488-9962-388f8c533d23":"#f78580","1c7b698e-806f-42aa-87ae-3ca740940b00":"#de0030","dba3598f-a6ac-4791-a54d-c335ef510ac8":"#7e1a23","199b6fa5-1912-4926-801c-ad88ee962d63":"#241010","b44bfa26-84ac-4ce2-805c-6ab1ba8e9fec":"#f7f1d9","5e7f9d06-2093-42b5-b06f-3c49c3cc5696":"#f2f0ef","6c1d3a95-c836-4dc6-9135-2e0ce966be72":"#f8f8f8","b8db72c0-cb8d-4f74-8de8-ae23882ccea2":"#f0f1f1","a9bc8da4-0ee2-46ab-97aa-5980cd432c9e":"#fbf7f4","8c2636a5-8f0c-4dd3-b5dc-1db6770c94fd":"#f8efe9","530fd98b-c9ff-4178-8122-dfa61ebd54b2":"#f8f8f8","be1705aa-2fa3-45e3-9a2d-b1e3154688a1":"#f1f1f1","08b2c1eb-4626-4895-ad53-022caf0279fe":"#f4f8ff","57730e5b-3d41-4c65-b5c5-591a2b4f2c6c":"#e8f2ff"} : {"ff84a538-3b17-43df-84c5-62ce53fc8100":"#0F172A","b3a3bc5b-7e1f-4e6e-b04e-271e50b3ac29":"#334155","9c69243d-ea77-4a8e-a7c9-30a3fc9702bb":"#64748B","80f1d3e0-6f5d-4248-8a7c-df9dc3fd8d59":"#FFFFFF","e6bc7505-420b-45f3-b54b-c97bc1990c2e":"#E6EAF2","84c945ff-a1a0-4cfd-a6ab-6cb740b8358f":"#F5F7FB","24b32be1-fde3-428e-bab9-346333ccfc1b":"#B9C5E5","be3e5222-a70b-4980-a59b-eb76ff4d9973":"#F3F6FF","b3b4c89f-c52b-463c-9892-fe8381153fd1":"#4568dc","366aef8c-4b2a-4683-8773-2bb409358060":"#b06ab3","f139f784-c380-4e3d-a8a4-0c04f0dd654d":"#FFFFFF","8f8ec30c-f135-49f7-82b8-f72da2eb60a4":"#4568dc","41d482ba-a524-4919-ac16-e1bf0ca365ad":"#3f5bd5","a5b01be7-37ac-4d51-aff6-1d293073141f":"#F1F4FA","d8088c42-216f-45fe-b570-3dcadf2b25e6":"#EDF1FB","e7d7a2e8-d0e9-4e7e-920e-902eb1847a0f":"#94A3B8","93c532e9-7b6c-4149-9571-3ca05a4b1ac6":"#B9C5E5","5fbb86f0-44a7-4cd0-8891-6039589d84bf":"#8FA3E1","23e5f1db-f75d-4a3c-8bb9-ed0d5ae89e99":"#F0F4FF","0df6a459-0578-4af7-8c98-90e81af09271":"#FDF3FF","0a820312-374d-41b6-89d8-2d43fe47f41f":"#92A1DD","75f104a9-323a-48bb-8c63-a035c6ba890c":"#FDF3FF","2f34a284-e7c1-42aa-834b-cf29c14ac272":"#FFE8F0","75ba3157-31ef-46a8-80ba-f72b9c20242e":"#FFF4E8","e60d8bcb-c27b-4c3e-b4b9-68fa5dbb1775":"#E8F5FF","17cd8f80-1db4-4821-a6e7-3c01edd73d9b":"#F0FFE8","41e7b84f-dc52-4840-8528-b0af270b103f":"#FFF0E8","0cdb794e-5335-4c2c-b387-4db3d6885c8f":"#FFE8F5","f449d180-0a20-4b36-9093-9e60f78d0e00":"#E8F0FF","fa783e4a-7568-4445-8d8a-6b62e478b5ca":"#FFE8F7","edcacd73-846a-4f4d-8ed0-72ad9bbecc30":"#FFF4E0","18b6bb6e-771c-4c93-83b5-afbea20e92f2":"#E8FFF0","59886951-6b67-4dfc-b57f-33d4fa303e28":"#F0E8FF","c75d10f0-5580-46de-8932-f782217b922c":"#4568DC","7a3e0094-eb34-4fcc-8f9a-3fcd39b68b56":"#6A5ACD","e02d8630-0ea8-4b2d-8b63-bd2cbe7f6b3b":"#A163F7","f207d49d-558e-4538-9acc-902b47c3d089":"#B06AB3","6ad663e0-97d9-4f97-a301-fd60cd46ba3f":"#F7F5FB","050a1626-15a3-4f39-b10c-4ef30dd9e2a4":"#F2EEF8","e78c08ba-5686-4e87-bdd8-c0fdd77d0152":"#FFFFFF","61371863-d3c9-428a-8d13-f04004badd06":"rgba(69,104,220,0.04)","bf5411f1-170f-4df9-a32d-4fbcc9e7bbda":"#1E2330","56c99fd9-334f-4218-ae74-204479f27036":"#2B3344","dc2f81a7-4c35-4ed3-8e7e-1e55476fdfa1":"#6B6F7B","7a32e7fe-f67a-4fda-aea0-8637d7594e1a":"#EAE7F2","b5a74405-b2e6-49fe-bb1c-e8c23d0e7269":"rgba(69,104,220,0.08)","b2c14e2b-fc4f-44a4-9938-201c1df52471":"#4568DC","e0e040fa-695c-40a1-a4c4-06cbc43cbe31":"#8F97AC","84d21b6a-d125-4d2f-b553-5c1ded1b8e7c":"#6F78A0","b047efdb-3639-4ef3-a0dc-e6c23ff089ea":"#22C55E","4c231490-ca69-4696-95e6-d83614018d6e":"#0F1724","8d0dbffe-5039-4bd1-a33d-c6acbc88ad9b":"#E6EAF2","744c1428-1983-4d10-b199-9d7332d3e7f1":"#95A3B8","b2cce1ec-0d63-4cc5-a8ba-9d0f670de352":"#1E2A3A","ea4b8b24-95fd-41c4-82ca-154439630642":"#25D366","cfe5ca24-1c60-4a3d-83ea-4f6ee76325d2":"#FEC84B","03f97d03-e8b5-4260-b9a6-84b4e9ac4edb":"#000000D9","db07d869-7076-4fff-8cb5-8f81b9060866":"#00000040","afb0622b-008d-4d99-893c-0f0ebe9cb2ae":"#00000073","7135d9d0-003f-4d5b-979b-4835ed0b65bd":"#0000000F","269e56d1-6215-4b79-9d82-7e6cee40fa2a":"#000000D9","8fbac7c3-9c29-4120-a916-efddf0ee92e0":"#00000040","b841af6a-0836-4052-adfd-99ee3aa9ee4a":"#FFFFFF","a30feb65-a942-4bac-9f38-16dfb4436c11":"#e1e3e5","02e08795-d352-49fd-bc93-5286044ef953":"#c2c7ce","c8122ad7-6c9a-437c-84eb-04e924772175":"#a3acb9","e04035ac-59ff-4f90-9036-1e77cda9cb24":"#8692a1","fdb7537c-e7ec-40ba-a311-0e01c275a6ee":"#6c7888","a74a44a9-425f-4705-b866-f1421c68df52":"#545f6c","781a330b-49ce-4467-80f7-40a4a21b1299":"#3f4750","34573081-741e-4f9b-bb0a-b54fa699d29d":"#2a2f34","04645073-e69e-4e73-80ef-5f1f56118c99":"#151618","44df1337-b30d-48d2-9cdf-9c0ce338502e":"#e2e2e2","b56a2bd5-4834-484d-8ecb-7760c0ebc14b":"#c7c7c7","e964af1c-8020-4e44-96df-93b418abf1ff":"#ababab","aed66389-4433-45b2-be66-5622e3df32e7":"#919191","5172739f-2906-4f10-a758-a1d4929606dc":"#777777","eb5500ae-9ab2-4f6a-83e9-afdc2e3bc1b2":"#5e5e5e","1804f5dd-ffbe-4d0f-a18e-7d9af9eb1c8f":"#464646","f0e9c89a-44ab-4e0e-b1d4-1c223f5c1088":"#2e2e2e","4cb797eb-6ee0-474f-b1dc-99461ce603bc":"#161616","9e8130f5-d6e8-45fe-a977-2cc5e23c6bbb":"#f8f8f7","0f661c98-70c5-4b0f-9ce1-6f860eb63b49":"#e5e2de","bb3eaa2d-d4b7-4b14-8e3d-245d1ff7d00b":"#cdc5bc","0b2b321a-ec10-4f3b-bbbb-469272549bdb":"#b5aa9c","6b06c6ba-a34b-4c75-ad9b-bfb7e3d302d4":"#9b8f7f","f61a0146-c1a8-43c8-84e7-9167aa1bb25f":"#817566","a182872b-7383-46fd-a619-8f51d0d52e37":"#675c50","7950677e-aad2-4e7e-a55b-a0e4b568b0c6":"#4c443b","a1277df6-36d4-45aa-b73c-b3e8c1ead1b5":"#322d27","bfdde87c-ea57-4199-bdd9-93db2a273c9a":"#181613","04b93f0a-1fe2-4b5d-8f1a-a487c7c67ef3":"#d1e4ff","d4334cce-a468-42bf-9a6d-51aed19f8289":"#a2caff","b5bcca88-2522-4e68-880e-aee6d63a2e47":"#6faeff","b8065e7d-980b-4ae1-9b66-71c23c085a2a":"#3090ff","c9179837-9d7e-4518-9fa7-8e065db8409d":"#0075df","9821eac7-4263-4bb8-964c-47ddd1b963cf":"#005db1","8bea7fb1-7617-43d7-8391-a42a8ba2ed9f":"#004585","18dcd57b-d6f9-4fa8-9967-a2082f8b8c8e":"#002e5b","dbefda4d-f2df-4a94-aa56-d154013e03e3":"#001631","e9446b2b-09b0-4e6b-90aa-7d5760edcf4b":"#f5ddcf","0fb23398-7e19-4878-943c-6cc4cb22e0c7":"#f6b791","032d8d1a-8928-494b-86d7-0b10c8b6bb69":"#f68c47","95f27f34-c853-49ff-ace4-f3d827bef530":"#de6c0b","d1b5feb5-be21-4239-a938-9b35641d53c2":"#b95700","5cf45ebd-4fc2-4d74-b7cf-022e9de4249f":"#944403","ea6e1fcd-450b-4bf8-a835-8c85eb7e7f73":"#6f3207","31c43a43-4017-45f3-a88b-fc93427b6464":"#49220a","61a949be-2329-417a-8c47-8d5060a73eed":"#231107","e3bb1f43-e60f-47a9-8d3d-f436511c95eb":"#faf8ed","b19a2186-b06d-4a00-abc7-59a8b7252439":"#f1e3a9","eaebb6eb-2114-42ef-9d3f-66c1037222f0":"#c8aa19","c17c036a-24b7-435f-b6d0-2be3936c5447":"#8d7500","14f92e1b-c639-4e6a-b09d-6a189218f090":"#544406","4f0c4735-5c98-4ddc-9714-73d4410e47f9":"#382d07","defdd300-5ef6-4a2e-9852-0328005bf8b7":"#f4faf3","23aa7fa3-11f0-4d27-aa14-fb0a7d2473ed":"#c6f0c5","b4a51e39-8e67-48ae-82b5-041ab116b358":"#53c954","4c0c4797-47f3-416e-8f49-9e7749abc810":"#2aad2c","efd91745-2fb2-4e7e-a5b0-9f0a372dcdcd":"#1e7118","e5693771-d83f-46ab-85b6-7e9b0f1ea8c3":"#1a3616","a0df6c5b-9408-4825-809c-bd96f7a6ccb8":"#faf7f7","fb469904-507a-456a-930a-982b7010ca01":"#f6efee","6bd67ea2-8fa9-43a5-8cf5-50f625558e3c":"#f3b5b0","c8ad9641-1f8b-4f9e-972e-24d3d7c79164":"#fa444d","fb8a0c40-ded1-491a-bac7-14016b364ef0":"#af1129","2c7bfcbf-d833-46b0-9e49-bff3a2696a1f":"#4f1a1c","abd52525-b934-474f-8b93-e976fece5f80":"#e3c645","1ddbd5a9-0bf6-4f67-99f4-c4846032af7f":"#ab8f05","24ab4fe2-969e-4cbc-9985-89c353066a89":"#705c03","13fc8b4f-a356-4975-ba62-96bb6aa8fd25":"#1c1604","fa4d9179-2c75-4b4e-ac46-90ca735cc6d2":"#e6f6e6","cacd1009-7dcd-4c7b-a9d4-8978050bcaf9":"#7ee27f","9475d0e1-b273-475a-b540-5fe7d8df2ea6":"#009100","ae584ace-7bbd-4b34-8713-e000815bf128":"#23521d","157c9b53-591d-410e-9018-916de18e1c0f":"#0d1a0a","dcf7d119-b64f-4e4f-ba82-20185e1e3375":"#f2dddb","74b3c7e8-14ef-4488-9962-388f8c533d23":"#f78580","1c7b698e-806f-42aa-87ae-3ca740940b00":"#de0030","dba3598f-a6ac-4791-a54d-c335ef510ac8":"#7e1a23","199b6fa5-1912-4926-801c-ad88ee962d63":"#241010","b44bfa26-84ac-4ce2-805c-6ab1ba8e9fec":"#f7f1d9","5e7f9d06-2093-42b5-b06f-3c49c3cc5696":"#f2f0ef","6c1d3a95-c836-4dc6-9135-2e0ce966be72":"#f8f8f8","b8db72c0-cb8d-4f74-8de8-ae23882ccea2":"#f0f1f1","a9bc8da4-0ee2-46ab-97aa-5980cd432c9e":"#fbf7f4","8c2636a5-8f0c-4dd3-b5dc-1db6770c94fd":"#f8efe9","530fd98b-c9ff-4178-8122-dfa61ebd54b2":"#f8f8f8","be1705aa-2fa3-45e3-9a2d-b1e3154688a1":"#f1f1f1","08b2c1eb-4626-4895-ad53-022caf0279fe":"#f4f8ff","57730e5b-3d41-4c65-b5c5-591a2b4f2c6c":"#e8f2ff"};
            /* wwFront:end */
        }),
        spacings:
         /* wwFront:start */
        // eslint-disable-next-line no-unreachable, no-undef
        {"41007a31-4ad4-4a5f-890f-cdaca9bd3c44":"8px","1c193a72-39dc-401d-a9a8-c478755452eb":"12px","197fcd52-63e3-4fb0-879c-cfbccbf9fc1d":"16px","3eb50a25-fd0f-45ff-83f9-56cd3113d18c":"20px","c6bcdd97-ab76-47e2-b949-4688e399953a":"24px","982886a1-d859-4bd2-a144-258cca8a8359":"32px","c7f1206e-b0a7-4948-b767-86c9527df9be":"40px","16d0c038-3e2a-4ca4-8154-0cd41aacd6f3":"56px","6da3934e-b574-4681-aa97-d4ab2e41f543":"72px","59c8b856-67e8-4d6e-b0b2-3b23331c9eec":"96px","802450d4-96e6-46b9-88b5-4ff2ad0c2a9c":"4px","0a3be4c7-8af6-4f2a-8356-cfc9a654bedb":"8px","d3c878ba-280d-4a58-b439-dec4f641301e":"12px","c5f92a83-8757-46c9-a0b3-a6def1d6d25f":"16px","35f471a8-fb6a-4b4f-85cd-d6eb927956ee":"20px","b4d95d06-8a9f-4fbc-8696-2796a7a458b2":"24px","f52b33fb-9a7f-462d-b467-a670c2a12f7f":"2px","b363e15d-300e-4ff3-b2ac-f63ea21f5e16":"4px","7f9785c9-45e0-4bab-91b0-6122b1deafe7":"8px","02c62812-8afe-4200-a60a-2d9bd080e86c":"12px","492a9411-1702-4f94-828e-f03daf553237":"16px","6f3edf1a-cab9-4568-8e22-f912fa436965":"20px","b1f0e218-59f1-44f9-bc1e-eb5e50523d75":"32px","407b6723-0694-4e59-8df2-b5259c1d28d5":"40px","78490985-6b3f-48bb-a2ef-8187f3bfc8a6":"2px"},
        /* wwFront:end */
        typographies:
         /* wwFront:start */
        // eslint-disable-next-line no-unreachable, no-undef
        {"bbc56d76-9ffd-45c8-a7da-fe769ac890c2":"700 3rem/1.2 var(--ww-default-font-family, sans-serif)","b0d59649-f626-48c7-8655-9c14ea6dd387":"600 2rem/1.3 var(--ww-default-font-family, sans-serif)","06041682-a566-4054-93ce-f57e34e245bd":"600 1.375rem/1.4 var(--ww-default-font-family, sans-serif)","7d7c3e72-f427-4d41-b0c1-40f818d8d4bf":"400 1.0625rem/1.6 var(--ww-default-font-family, sans-serif)","5f64bf45-3402-452a-94b5-2e6fe2cd8698":"400 0.9375rem/1.5 var(--ww-default-font-family, sans-serif)","35fd0bee-3fd2-4770-b479-9524c34dd2c9":"400 0.75rem/1.4 var(--ww-default-font-family, sans-serif)","c53ffd2b-58da-44ce-92cc-f100aa097616":"500 1rem/1.5 var(--ww-default-font-family, sans-serif)","03eb0883-d373-4b61-a2ce-9fa310bb20f2":"700 3rem/1.2 var(--ww-default-font-family, sans-serif)","e0aef34e-d558-4023-bca7-b474ea48e908":"600 2rem/1.3 var(--ww-default-font-family, sans-serif)","51c1432c-957e-4c9b-a478-0c751c1d6b82":"600 1.375rem/1.4 var(--ww-default-font-family, sans-serif)","4c00cb70-d668-4bf6-9b0d-a1807db0977c":"400 1.0625rem/1.6 var(--ww-default-font-family, sans-serif)","794059dd-5ce8-4202-8727-9870ab78cb2d":"500 1rem/1.5 var(--ww-default-font-family, sans-serif)","7419c94a-472d-45eb-89ac-debf7ef21b35":"400 14px/22px var(--ww-default-font-family, sans-serif)","b49b91a8-996d-45e6-ae47-795f8322c041":"500 38px/46px var(--ww-default-font-family, sans-serif)","e9d2a21b-ea8d-459b-87bf-131e4d6af9ee":"500 30px/40px var(--ww-default-font-family, sans-serif)","8d14c83a-63a5-4f4f-a12a-97af4258074d":"500 24px/32px var(--ww-default-font-family, sans-serif)","1a3aa549-d178-4106-bc9e-5d1e7bb34c8c":"500 16px/24px var(--ww-default-font-family, sans-serif)","6b591379-573d-425b-bc53-12a4426e1513":"600 14px/22px var(--ww-default-font-family, sans-serif)","d9f75b67-53a7-4a7f-9a0e-f4ab7985cde6":"400 12px/20px var(--ww-default-font-family, sans-serif)","4ef5bd5d-6c26-4512-8a87-f23d0269918a":"600 16px/24px var(--ww-default-font-family, sans-serif)","af4a2331-71bc-44af-9661-b38551756eab":"600 12px/18px var(--ww-default-font-family, sans-serif)","dba66191-af24-45ac-ae67-dd3770eec837":"400 12px/18px var(--ww-default-font-family, sans-serif)","04a090b3-eb67-4f3d-8946-bb1896dd0c4b":"400 16px/22px var(--ww-default-font-family, sans-serif)","0fa89c8c-d0cf-4c33-81cc-1a4524267593":"400 12px/20px var(--ww-default-font-family, sans-serif)","38ffbeff-764d-4bfc-9245-65b7bc0554d3":"500 20px/28px var(--ww-default-font-family, sans-serif)","f0d118f6-8610-4be0-85a6-7732ededbcbd":"400 60px/60px var(--ww-default-font-family, sans-serif)","c3f20f8d-c404-4890-a149-528c554d3a45":"400 48px/52px var(--ww-default-font-family, sans-serif)","188c18b9-1d63-48aa-b183-a0e339c28999":"400 36px/36px var(--ww-default-font-family, sans-serif)","b47fda5e-c8a2-479d-a3d2-000ef4b6ee4e":"400 24px/30px var(--ww-default-font-family, sans-serif)","d92a1cb7-94b6-4feb-9413-e70e51979f97":"400 18px/26px var(--ww-default-font-family, sans-serif)","f2a71115-b847-4f32-ade9-6ec28c04d178":"400 16px/24px var(--ww-default-font-family, sans-serif)","6991fe26-2f58-467a-a1c7-e9a576888df6":"400 12px/16px var(--ww-default-font-family, sans-serif)","413f19fe-06f4-4af0-bc58-613b9c444489":"300 48px/52px var(--ww-default-font-family, sans-serif)","36c90402-a417-43a8-9707-91580919116e":"300 24px/30px var(--ww-default-font-family, sans-serif)","fd2aa2ea-6285-4979-9dd4-0afe769b1cf7":"300 16px/24px var(--ww-default-font-family, sans-serif)","0ed994cb-55a6-4345-a079-6317154abeb9":"300 12px/16px var(--ww-default-font-family, sans-serif)","47176e75-5460-40c9-add9-f675437da5c3":"500 60px/60px var(--ww-default-font-family, sans-serif)","a46682a1-6522-4402-851e-ac1aba0b897c":"500 36px/36px var(--ww-default-font-family, sans-serif)","f59d015e-c1a5-41b0-a0bd-d7685bfa9e04":"500 18px/26px var(--ww-default-font-family, sans-serif)","90e4433f-28ec-48c5-8432-3a4ad4f12c6a":"500 14px/20px var(--ww-default-font-family, sans-serif)","1a0dc46e-3d23-4ac0-ada4-bc80d295dd7f":"500 11px/16px var(--ww-default-font-family, sans-serif)","e6d49f9e-afe0-4248-8d07-d27a1c9b6230":"700 48px/52px var(--ww-default-font-family, sans-serif)","63427591-e191-4f49-bcd0-e63f63c1f0d0":"700 24px/30px var(--ww-default-font-family, sans-serif)","ad5de84f-abf6-4f14-81d9-ee7fdc1674f6":"700 16px/24px var(--ww-default-font-family, sans-serif)","4dba5634-32ac-49d9-9e3b-1c227801b3a8":"700 12px/16px var(--ww-default-font-family, sans-serif)","f4a28b33-58fd-41ca-b1fd-feda6a0a7e75":"400 14px/20px var(--ww-default-font-family, sans-serif)","c895a4f5-7855-4344-9a83-dff3321d79e6":"400 11px/16px var(--ww-default-font-family, sans-serif)","b593a132-fc74-46b5-beca-3b5698188264":"300 60px/60px var(--ww-default-font-family, sans-serif)","306b96db-c31c-4957-832b-199fd5382cb2":"300 36px/36px var(--ww-default-font-family, sans-serif)","a849b37a-ec69-4519-8689-7ca0ec99905e":"300 18px/26px var(--ww-default-font-family, sans-serif)","355d65f8-3e12-4e04-a4d3-3181e93175b8":"300 14px/20px var(--ww-default-font-family, sans-serif)","c455b4ea-99a3-49f6-a60c-659ec8afdf31":"300 11px/16px var(--ww-default-font-family, sans-serif)","c924f875-829c-4696-8dbc-a392f579d23f":"500 48px/52px var(--ww-default-font-family, sans-serif)","3d798d9f-1dff-4804-987f-f3a7192ef9c9":"500 24px/30px var(--ww-default-font-family, sans-serif)","a610bd35-596d-4cec-b59c-6aa7e996721b":"500 16px/24px var(--ww-default-font-family, sans-serif)","d7a3303e-30a9-4e87-a23c-cb6e262d91e7":"500 12px/16px var(--ww-default-font-family, sans-serif)","261e7097-5da3-4f2d-98ce-77accbcaabb3":"700 60px/60px var(--ww-default-font-family, sans-serif)","5cd34ef8-3e66-48d9-a40c-173b6be0752a":"700 36px/40px var(--ww-default-font-family, sans-serif)","4e3cfba6-0330-4c70-bf29-d8dd3d4d3b94":"700 18px/26px var(--ww-default-font-family, sans-serif)","665adc55-24af-4037-8838-a84d19562ea2":"700 14px/20px var(--ww-default-font-family, sans-serif)","94e99de8-68eb-4787-80af-c99d29e791d5":"700 11px/16px var(--ww-default-font-family, sans-serif)"},
        /* wwFront:end */
        browser: computed(() => {
            const router = wwLib.manager ? wwLib.getEditorRouter() : wwLib.getFrontRouter();
            const currentRoute = router.currentRoute.value;
            let currentQueries = currentRoute.query;
             return {
                url: window.location.origin + currentRoute.fullPath,
                path: currentRoute.path,
                // verify if auth plugin
                 /* wwFront:start */
                // eslint-disable-next-line no-dupe-keys
                source: currentQueries._source,
                /* wwFront:end */
                query: currentQueries,
                domain: window.location.hostname,
                baseUrl: window.location.origin,
                breakpoint: wwLib.$store.getters['front/getScreenSize'],
                environment: wwLib.getEnvironment(),
                theme: wwLib.$store.getters['front/getTheme'],
            };
        }),
        screen: services.scrollStore.screen,
        componentPositionInfo: services.scrollStore.componentPositionInfo,
    }),

    pageData: computed(() => {
        const lang = wwLib.$store.getters['front/getLang'];
        const cmsDataSetPath = wwLib.$store.getters['websiteData/getPage'].cmsDataSetPath;
        if (!cmsDataSetPath) {
            return { lang };
        }

        return { lang, data: wwLib.$store.getters['data/getPageCollectionData'] };
    }),

    getEnvironment() {
        return wwLib.manager
            ? 'editor'
            : window.location.host.includes(
                  // TODO: add staging2 ?
                  '-staging.' + (process.env.WW_ENV === 'staging' ? import.meta.env.VITE_APP_PREVIEW_URL : '')
              )
            ? 'staging'
            : window.location.host.includes(import.meta.env.VITE_APP_PREVIEW_URL)
            ? 'preview'
            : 'production';
    },

    useBaseTag() {
        return (
            wwLib.getEnvironment() === 'production' &&
            window.wwg_designInfo.baseTag &&
            window.wwg_designInfo.baseTag.href
        );
    },

    getBaseTag() {
        let baseTag = window.wwg_designInfo.baseTag?.href || '';
        if (!baseTag.startsWith('/')) {
            baseTag = '/' + baseTag;
        }
        if (!baseTag.endsWith('/')) {
            baseTag += '/';
        }
        return baseTag;
    },

    /**
     * @PUBLIC_API
     */
    getFrontWindow() {
        if (document.querySelector('.ww-manager-iframe')) {
            return document.querySelector('.ww-manager-iframe').contentWindow;
        }
        return window;
    },

    /**
     * @PUBLIC_API
     */
    getFrontDocument() {
        return this.getFrontWindow().document;
    },

    /**
     * @PUBLIC_API
     */
    getFrontRouter() {
        return this.front.router;
    },

    /**
     * @PUBLIC_API
     */
    getEditorWindow() {
         // eslint-disable-next-line no-unreachable
        return null;
    },

    /**
     * @PUBLIC_API
     */
    getEditorDocument() {
         // eslint-disable-next-line no-unreachable
        return null;
    },

    /**
     * @PUBLIC_API
     */
    getEditorRouter() {
        return this.editor.router;
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED wwLib.wwApp.goTo
     */
    goTo(...args) {
        wwLib.wwLog.warn('wwLib.goTo is DEPRECATED, use wwLib.wwApp.goTo instead');
        wwLib.wwApp.goTo(...args);
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED wwLib.wwUtils.getStyleFromToken
     */
    getStyleFromToken(...args) {
        // wwLib.wwLog.warn('wwLib.getStyleFromToken is DEPRECATED, use wwLib.wwUtils.getStyleFromToken instead');
        return wwLib.wwUtils.getStyleFromToken(...args);
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED wwLib.wwUtils.getTypoFromToken
     */
    getTypoFromToken(...args) {
        // wwLib.wwLog.warn('wwLib.getTypoFromToken is DEPRECATED, use wwLib.wwUtils.getTypoFromToken instead');
        return wwLib.wwUtils.getTypoFromToken(...args);
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED
     */
    element(value) {
        wwLib.wwLog.warn('wwLib.element is DEPRECATED');
        if (typeof value === 'object') {
            return { isWwObject: true, ...value };
        } else {
            return { isWwObject: true, type: value };
        }
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED wwLib.wwUtils.resolveObjectPropertyPath
     */
    resolveObjectPropertyPath(...args) {
        // wwLib.wwLog.warn(
        //     'wwLib.resolveObjectPropertyPath is DEPRECATED, use wwLib.wwUtils.resolveObjectPropertyPath instead'
        // );
        return wwLib.wwUtils.resolveObjectPropertyPath(...args);
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED wwLib.wwutils.getTextStyleFromContent
     */
    getTextStyleFromContent(...args) {
        // wwLib.wwLog.warn(
        //     'wwLib.getTextStyleFromContent is DEPRECATED, use wwLib.wwUtils.getTextStyleFromContent instead'
        // );
        return wwLib.wwUtils.getTextStyleFromContent(...args);
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED wwLib.wwWorkflow.executeGlobal
     */
    async executeWorkflow(...args) {
        wwLib.wwLog.warn('wwLib.executeWorkflow is DEPRECATED, use wwLib.wwWorkflow.executeGlobal instead');
        return wwLib.wwWorkflow.executeGlobal(...args);
    },

    /**
     * @PUBLIC_API
     * @EDITOR
     * @DEPRECATED wwLib.wwEditor.findParentUidByFlag
     */
    findParentUidByFlag(...args) {
        wwLib.wwLog.warn('wwLib.wwEditor.findParentUidByFlag is DEPRECATED, use wwLib.findParentUidByFlag instead');
        return wwLib.wwEditor.findParentUidByFlag(...args);
    },

    /**
     * @PUBLIC_API
     * @EDITOR
     * @DEPRECATED wwLib.wwEditor.selectParentByFlag
     */
    selectParentByFlag(...args) {
        wwLib.wwLog.warn('wwLib.wwEditor.selectParentByFlag is DEPRECATED, use wwLib.selectParentByFlag instead');
        return wwLib.wwEditor.selectParentByFlag(...args);
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED wwLib.wwElement.useCreate
     */
    useCreateElement() {
        wwLib.wwLog.warn('wwLib.useCreateElement is DEPRECATED, use wwLib.wwElement.useCreate instead');
        return this.wwElement.useCreate();
    },

    /**
     * @PUBLIC_API
     * @DEPRECATED wwLib.wwElement.useLayoutStyle
     */
    useLayoutStyle() {
        wwLib.wwLog.warn('wwLib.useLayoutStyle is DEPRECATED, use wwLib.wwElement.useLayoutStyle instead');
        return wwLib.wwElement.useLayoutStyle();
    },

    /**
     * @PUBLIC_API
     */
    useIcons() {
        const store = useIconsStore();
        return {
            getIcon: store.getIcon,
        };
    },
};

function pageSanitizer(page) {
    const keysToInclude = [
        'id',
        'name',
        'folder',
        'metaImage',
        'pageLoaded',
        'paths',
        'langs',
        'meta',
        'title',
        'sections',
        'pageUserGroups',
    ];

    const _page = {};
    keysToInclude.forEach(key => {
        _page[key] = page[key];
    });

    _page.meta && delete _page.meta.__typename;
    for (const section of _page.sections || []) {
        delete section.__typename;
    }

    const lang = wwLib.$store.getters['front/getLang'];
    if (_page.paths) _page.path = _page.paths[lang] || _page.paths.default;
    else _page.path = null;

    _page.lang = lang;

    return _page;
}
