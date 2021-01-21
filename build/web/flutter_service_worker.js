'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "303de1b096a76d5b83e5eae2322810f3",
".git/config": "b3faa8806c5852e6503eef95f566515a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "48fa8aaed15321ecd8b639b5299a819f",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/index": "5e5aeee03006bb92f6081f6d495eb7cc",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "48e4976ef66bcdd811b146fc77ee6235",
".git/logs/refs/heads/master": "48e4976ef66bcdd811b146fc77ee6235",
".git/logs/refs/remotes/origin/master": "bc17f188b2832913d310542a3dc4a93d",
".git/objects/00/ff2cec40dedeca665dce4ecf080364fa093287": "5cb6de0dbed1aec9fed12a63874af8d3",
".git/objects/02/eb7502e3ecd2bcb3c3adaf5ece067374a9b8a7": "6c5fe9de21c9bf91e01dd2c07ab42c3b",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/05/b0f44b734ced04ccd5a6756b430134955b3fa9": "50e98d1d5dc4d82865cc0467c8628297",
".git/objects/10/589e277ed7087dfd2d499a064e8c0e8bd9efad": "ee2b5dd6988532a99f8d19fe4df34404",
".git/objects/1b/92c1454f5d5f64af11c87da385f85d54c3d5a7": "dcf02b516bb17f31850857a356708cf3",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/21/665a6e060538a2f654114eda230506ac4ab0c3": "ab14d28612a01bc3e62bab61162fda4c",
".git/objects/29/67bfcad554c8442673013008dc12bc1ca45d74": "4a706f443e917609af68133e77f4e0b6",
".git/objects/29/807bd18ba00d7c4446e88bbe89b6912cb42b78": "bb7f9891be8f866fd9400cfeffcd9c05",
".git/objects/2b/7be69f70b56420444f86714e2c81f411d3de56": "c805a114f2dbbdd3306a00915268de10",
".git/objects/36/a0d0ac22ac292e4e4a2211a09453b4a198d77d": "ea6880bc06a0169e15327ab5a183125b",
".git/objects/42/0e607bed991a488fc1f0ef75148f24b323e986": "bb09a107986058ea49975538623be25f",
".git/objects/42/9d9ef6f0db6461c672f28241203416de401eb0": "1779f6c2bc62b05064b98364ea70da8c",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4d/b5f464b87af56e18671d73590c6e8698730bac": "7fafce09a21c29b4aca0d1ae43b22442",
".git/objects/4d/bdfca8a4b975477f07c203e548e9c798d72ffc": "e0f636417adc16a5528144f85fb71d01",
".git/objects/4d/f9e7acfe215ba607e49cb5f68594369bcd19ce": "09b1f00046e0c543086bf9395f32641b",
".git/objects/52/215906dd93f62a1ea4733dba0631ae9c2cc7c3": "3dba88b57da6d429f53fb06f06f73105",
".git/objects/5d/13cacc184f838c9663e96b10a7746d8b494f8f": "fda48736af44ee338b1decd3400e0a85",
".git/objects/60/3f450dc40e11859bec0c008bcc2e1b44df6de4": "8768defb1407f19908ce729a761ac14d",
".git/objects/60/d46764760c46841732be1097ce6deeb093c65e": "818ebb5b99a2ddc33926b3c516f604f8",
".git/objects/65/b76ef7180c05185fd95fa75792b7bc7f8c70d9": "dbf0520095dd949d2688e7319134fedf",
".git/objects/69/2b574763a028ef548fe42908eefeb9de97f80d": "cd0307535dee04265c464c2778c40ffd",
".git/objects/74/652f2f5fea8bb6b4d24dd744c2b1946268989f": "6e25211c494fe8debc2568cf9036ed63",
".git/objects/79/01ed9e86c4348c5a33d8b602c22a4002ca8fc0": "dad432f32c993bde7e4b2ea8a0507b83",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/7d/0d68ef2e820d8dc2dddd2f7c65b2de58d7056e": "955e26efe4c9c744ec3bbc3cf40c1e21",
".git/objects/7e/6c03fc998d9cf83f161b61db24dd712f255240": "c9672700c849059f7487851ccd1fa208",
".git/objects/85/4bb2fa40a9ed89a357317a29087536f17b1995": "47685c44ded79e375849b15f0b6f714d",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/14bb6d61683f12d37be2a557b71cd5b9f083ff": "ca4f458203d1ca75bea7fc7c604e4fde",
".git/objects/90/971440784ed929b67d147fcacdde5d92955afc": "11a4ea42090adb08911e4de411611978",
".git/objects/90/d7b11ca7f081fff0caa6d46e95c845ab073f51": "a39b49cfe22e6fdcb2433441b58c99c3",
".git/objects/9d/9b0f694fd1e8a19ca837f4515ef21be12de470": "046e723b07039b253d51656448f8493d",
".git/objects/9e/ad4e2c46e650e4169234867d041ea4c02dd98c": "42e8ac36152d6f596acccfdec242973a",
".git/objects/a0/89e7541b36a687381d5365ccf041f816499a29": "f830d199cbe456b7c7af6dc111a9bb07",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a3/b197b7927983a6f36cb4ad0efa28930fb4e027": "a138ccb3fe2b3304ddbfcf2a460d0d18",
".git/objects/a8/3a17d54b6dc2156c855c6580301cefc9c8d017": "6525101be8d70b808a809af9c83fa4ad",
".git/objects/aa/27a9c13324cef6d41a1ccf7c2499bdd8a08e29": "bd95d450db8be2c007b3f456a124ced7",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/414643d53a359edab2a47713dc584b616800a5": "b42ffb0f599da44a2df3c8714484e62e",
".git/objects/be/e3f0616ec2b9d5fac125a8d352d2f7ba6dde35": "1f3f11c077d09994d8443102dbb008fa",
".git/objects/bf/08fbdbdc49a636b33060359c33db4e7abe2a26": "beab8690cc6670d5f82e64fb62c8b521",
".git/objects/bf/6870c773bb5ac48b3ee28426d0b76152fe9e0b": "f6a9cdedec4815dff97f0e7bd19a71c0",
".git/objects/c1/b56104cb958ba1c90786c7e9e6b47812641b7a": "6cc2669950af6f93731d561d6e9a211e",
".git/objects/c6/1581a428ecf2929f27670f24a6cd305f5dcd38": "1f5f0fe37ca3ead54f005d7f24051302",
".git/objects/c8/7e60611f50d3cce6c0334610f059a9d4d48213": "168a9c267ddf265c1fbe58bdf7a0e647",
".git/objects/cb/85e3485f56eafbf9cb1d43c6addd213c0b0887": "b4ca8031ed243416a3d4545a309a41d5",
".git/objects/ce/6b220c33914f42b473fd78f6fbf98299637fd9": "4e13e908af0cfa21137c0a286063ea37",
".git/objects/d5/eba913ef0928ce4f188b89cfa4bfefadc7398e": "584b9c4488de883ac313b429d0b5fc40",
".git/objects/d6/890b336466d5c76aab0ae5f0b953abe7bdf0ec": "94450eb08bef15cdd1b0937b9b20c4c3",
".git/objects/d9/44cc84efcdce65da73324cfb34d87fbdd76a97": "71263f21b66cb762239c2cab79e690ab",
".git/objects/de/cb5224e0aa67acb11c04bba4d6317830f8cc59": "b66f6948f041bd891f9c87315dfb9b96",
".git/objects/e1/3d93410db8db77620e74eaf529c07f7c0c8494": "7092853a44080a8cc446e4e1738194f7",
".git/objects/e3/3d2596dd015a4646d92faed95e71da0aac6d4f": "e768f0a2678892deaee3aa0aefb3be22",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e6/cf902102ae26eac6e7b9a5e6c65b6d30fcd18e": "84308a9156e7bffe23dc872f08147735",
".git/objects/e6/dece6c8e2c37b069d3551cb7d895640cf2d7b5": "6bd656291dca94c7f3cd972e2f971259",
".git/objects/e8/32e5cd08512316edb348946163f9012e558ec1": "aeac53b7e6d80a765d5ba5e39f478164",
".git/objects/eb/48977c1b6fb37641516d2dfff3fb000504642f": "af7337b2039096c1dbaf9a9c291dace5",
".git/objects/f2/5787c93ad00665f0f797a43ab397f0628a273e": "59e425d1456034072d902c75d18ec75f",
".git/objects/fe/580508a8423c2b35c63c75998ca35b5fa53aa2": "b918f53ba8d7c8397f7ef5b42c7c99c9",
".git/ORIG_HEAD": "7d4bdcfc0390f8c1cde1d23b75908013",
".git/refs/heads/master": "1f168fc4fab5cff1eab0e103e28aa8b0",
".git/refs/remotes/origin/master": "1f168fc4fab5cff1eab0e103e28aa8b0",
"assets/AssetManifest.json": "c75fe12f497f9b2da8778d24e6d88b64",
"assets/assets/assets/coding_bg.jpg": "3a8418a2714a361b1ff86735eb16d16d",
"assets/assets/assets/construction.gif": "c94f1b33c9208adbb3163c483f3d82c3",
"assets/assets/assets/flutter_me.png": "564685777122a09bfbb61189b58b2d6e",
"assets/assets/assets/ricarth.png": "dd6966b19df25364cb94721673fd523a",
"assets/assets/coding_bg.jpg": "3a8418a2714a361b1ff86735eb16d16d",
"assets/assets/construction.gif": "c94f1b33c9208adbb3163c483f3d82c3",
"assets/assets/flutter_me.png": "564685777122a09bfbb61189b58b2d6e",
"assets/assets/ricarth.png": "dd6966b19df25364cb94721673fd523a",
"assets/FontManifest.json": "7e9433d5386f1e47ab22f0afd8e7a4f9",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/fonts/NotoSans-Regular.ttf": "5a87cce84010f7cea085ae218d44a64b",
"assets/NOTICES": "38a2ebde9fd3a80c72eb1c10c90af413",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/ricarth.png": "dd6966b19df25364cb94721673fd523a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "27844036aab2793f4371d84c51a4579f",
"/": "27844036aab2793f4371d84c51a4579f",
"main.dart.js": "20bd801cb66564b1513bab323f1a0118",
"manifest.json": "4846091b14508dd1b9071c5e6c76bebb",
"version.json": "86de147ee5343277ac37765a035c711d"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
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
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
  for (var resourceKey in Object.keys(RESOURCES)) {
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
