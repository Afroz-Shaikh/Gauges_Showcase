'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "72554eacae36afce56e27800df85910b",
"index.html": "5fa9604b4be04c0e4e3638a066685781",
"/": "5fa9604b4be04c0e4e3638a066685781",
"main.dart.js": "34ac6ccc4e9b86c98e12c87746e16b5c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7cf6874c09b7d5a8e22c1b63ce1f8228",
"assets/AssetManifest.json": "4955029fcdabfe201e85e3e907b02e85",
"assets/NOTICES": "94044031f02a3ea9b39553158ad84737",
"assets/FontManifest.json": "7b14b57cc99042b1b5b94a886b7436b2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/geekyants_flutter_gauges/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/shaders/ink_sparkle.frag": "57f2f020e63be0dd85efafc7b7b25d80",
"assets/lib/usecase/temperature_meter.dart": "3e75ab0f077909c5ad4b00c9dabf4f78",
"assets/lib/usecase/rainfall.dart": "9a3540c6e23e75b24425141607d9716a",
"assets/lib/usecase/battery.dart": "ea8383ed4466c21ce978be32edf2fbab",
"assets/lib/usecase/progress_bar.dart": "6629db115ffe519d1214a80b4f91da7f",
"assets/lib/usecase/separator.dart": "121366df3029ec5b49cd39c8cdb96343",
"assets/lib/usecase/blood_sugar_test.dart": "4ce7cb4f1e0acfa8ce40a8142383b19f",
"assets/lib/usecase/server_utilization.dart": "ca545806cddc21388a033a1304208558",
"assets/lib/usecase/progress_level.dart": "8156a5599aef4ffa5b24428c7f8ff79d",
"assets/lib/usecase/daily_tasks.dart": "3d9220234b01e08231862cc660e1aa77",
"assets/lib/usecase/water_level.dart": "b89c2a9e2ffc3067bf215f0bdefdcc41",
"assets/lib/usecase/thermometer.dart": "29662e81841bc2c25f81ed99c1c68ae2",
"assets/lib/usecase/timeline_controller.dart": "b804ec11afe7afc91c3205d1325e6f1b",
"assets/lib/usecase/lemonade.dart": "84877e30db62ff40e84a3026640d956a",
"assets/lib/usecase/speedometer.dart": "e0d5ea73475bd1509f0bee83d633ab2c",
"assets/lib/usecase/height_indicator.dart": "dfe15db2074d03383ee6d64da708575d",
"assets/lib/usecase/disk_space.dart": "fb4f660e9dff6ce3defd44763de8a098",
"assets/lib/usecase/vaccination_graph.dart": "f5b1c5a48ac35344452966075f923d68",
"assets/lib/usecase/usecase.dart": "2010bc539763730ce148193d43f1e9e3",
"assets/AssetManifest.bin": "691a8c7f28559486e771b640114ab764",
"assets/fonts/MaterialIcons-Regular.otf": "1b35c027a3fa4c8934b71140c3d5bac3",
"assets/assets/bmi_light.png": "42c103457140edfa57bbd289425b5642",
"assets/assets/random_code.dart": "1e69fbed64396a424faec324ce14a63c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
