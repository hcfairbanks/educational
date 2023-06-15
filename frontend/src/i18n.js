// doing a double import here
// on index.js and on the initialilzation file
// wonder if I can reduce this
import i18next from "i18next";

import common_fr from "./translations/fr/common.json";
import common_en from "./translations/en/common.json";
import common_ja from "./translations/ja/common.json";


i18next.init({
  interpolation: { escapeValue: false },  // React already does escaping
  lng: localStorage.getItem("locale") || "en",                              // language to use
  resources: {
      en: {
          common: common_en               // 'common' is our custom namespace
      },
      fr: {
          common: common_fr
      },
      ja: {
        common: common_ja
    },
  },
});