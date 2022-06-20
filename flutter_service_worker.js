'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js_57.part.js": "2c859e5a6ceaebb927ac08b769b885a9",
"main.dart.js": "d973f34014ae4b47e9b3a61f76c6e665",
"main.dart.js_54.part.js": "be587faff45aa3cce8d2e4122f3e5f3c",
"main.dart.js_22.part.js": "1d5b93a489de8107333c147bdf6c7165",
"main.dart.js_12.part.js": "207d8be2f9e11ec4a34606dda153a33e",
"main.dart.js_10.part.js": "46fbe6ab59c57fefd0f4b35073d37f19",
"main.dart.js_70.part.js": "23fdda3cb5cfeca7c64719ffcfe0f029",
"main.dart.js_65.part.js": "b94fce31fe25b21128e8e64d327c6f0b",
"main.dart.js_60.part.js": "24216d0acdab4f700ee917e5f0293dc7",
"main.dart.js_71.part.js": "33d6f0b1ffd237a2290dd3e381abdbda",
"main.dart.js_35.part.js": "1098ff7042708c468a0b127451f56755",
"main.dart.js_1.part.js": "55589dd485782e51f0f77715682eff27",
"main.dart.js_33.part.js": "2d7dbe8d21e1eb60117cfb93d0b5967a",
"main.dart.js_7.part.js": "33b0a16ddb213dfc14403d0e7484ee07",
"main.dart.js_59.part.js": "648f3ee5cee5495e8f455523a1116e8d",
"main.dart.js_28.part.js": "0df4aaf67c2c5d987f9e11d4e208dfa8",
"main.dart.js_48.part.js": "284d0927935266eb7402b2095f7fab8f",
"main.dart.js_3.part.js": "841bb8bbd309ca07e895b5e793b90dc1",
"main.dart.js_23.part.js": "dbb5728f1bf7565d686b14c57c11e26a",
"main.dart.js_68.part.js": "460b7d537fcaddb729be35aa4e7af70f",
"main.dart.js_43.part.js": "1da14327f87b2c3583a209614dc9b690",
"main.dart.js_11.part.js": "c477e995c82ea9989016aa0d99623b75",
"main.dart.js_21.part.js": "d7fdcb099c743f407bb1568f2ed90d0c",
"manifest.json": "035a521ac78dbe41644399f73366b6ac",
"main.dart.js_63.part.js": "f84a8358c5e15ffe4b0c8cb01628ee3b",
"main.dart.js_17.part.js": "041365d299d3527366aedc71beb31bdc",
"version.json": "b1352d85895503aba1fcdd29e31f2066",
"main.dart.js_37.part.js": "6bd75d7e306b9ccebccd86a447b62710",
"main.dart.js_32.part.js": "ab1061f0c7d2ed3947280bddf84cfdac",
"main.dart.js_64.part.js": "dd428b4ad63cc975515d70bc366bca48",
"main.dart.js_44.part.js": "23aedb5457acd53284ac7f805ad62914",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_20.part.js": "8e80ac23d86b9fc12e3bb46808cf32ab",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_19.part.js": "bd1e003db0725c2a2fb2d60b8a09e5ca",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"main.dart.js_16.part.js": "a2c16493223ca2d2ea2df0f7879add9a",
"main.dart.js_14.part.js": "a73bfeb9ec17cee2cd623dae35e3a867",
"main.dart.js_36.part.js": "79e1cc26d8feb49c36607ac16eca3271",
"main.dart.js_25.part.js": "21fa57dd6dafcfe23ac93304133e689b",
"main.dart.js_8.part.js": "04332c002be65e33abd000a1023223d9",
"main.dart.js_45.part.js": "31c8c0dcddb88fd96b749eb13a45e348",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"assets/AssetManifest.json": "309c416f3d0cf5750989b17b37bd35ec",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/assets/images/0.jpg": "92d1545d90ec7ead183bf75ac146d213",
"assets/assets/images/demo.png": "13e9c72ec37fac220397aa819fa1ef2d",
"assets/NOTICES": "f5825f11af247f07c1915f10a9620f2e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"main.dart.js_53.part.js": "ddd983c40af7bb8a6b5a85f4779f579d",
"main.dart.js_26.part.js": "1ed40923624cadc8b59f3619ce63dec3",
"main.dart.js_50.part.js": "5e8b0347a3a0125928e49f14de32b54c",
"main.dart.js_2.part.js": "c0cf661626f15533bb83a573cc6fc44f",
"main.dart.js_47.part.js": "f9e3e28eeaac89963990a1492c41e49f",
"main.dart.js_67.part.js": "3e52631052db7c13322bdfc16380ddee",
"main.dart.js_31.part.js": "77215727c9cf802e9c4c8fa413a48c26",
"main.dart.js_38.part.js": "592ae2a24ebb63f8b196f2f30e0f960c",
"main.dart.js_52.part.js": "22707335341f265d8548f0624ccd5495",
"main.dart.js_24.part.js": "6a79e1dc8493e2363ae367e265e56754",
"main.dart.js_18.part.js": "09bd51c3bc91b80ea93d8314338a13d6",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js_66.part.js": "10c865e19a902f5698a5e2e6dea62836",
"main.dart.js_41.part.js": "89375387e3b68ce0351189171de2d95f",
"main.dart.js_27.part.js": "4842db21baafb599ce808b88f62cbe83",
"main.dart.js_6.part.js": "465a093d5800aca1a70855d68ec92bf6"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
