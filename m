Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18229E01299
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 07:33:50 -0800 (PST)
Received: by wgbdr1 with SMTP id dr1so14284265wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 07:33:49 -0800 (PST)
Received: by 10.227.60.14 with SMTP id n14mr10933646wbh.5.1324568029619;
	Thu, 22 Dec 2011 07:33:49 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n9sm10121227wbo.16.2011.12.22.07.33.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 07:33:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu, 22 Dec 2011 16:33:44 +0100
Message-Id: <1324568025-24923-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/2] ti-cgt6x: update to 6.1.20
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 15:33:51 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/devtools/ti-cgt6x_6.1.17.bb |   11 -----------
 recipes-ti/devtools/ti-cgt6x_6.1.20.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-cgt6x_6.1.17.bb
 create mode 100644 recipes-ti/devtools/ti-cgt6x_6.1.20.bb

diff --git a/recipes-ti/devtools/ti-cgt6x_6.1.17.bb b/recipes-ti/devtools/ti-cgt6x_6.1.17.bb
deleted file mode 100644
index d47ad3c..0000000
--- a/recipes-ti/devtools/ti-cgt6x_6.1.17.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ti-cgt6x.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712a8c64bb70c5ea5fa193faef3bed6f"
-
-PE = "1"
-PV = "6_1_17"
-PVwithdots = "6.1.17"
-
-SRC_URI[cgt6xbin.md5sum] = "41ee41cc74800b06705804f7ef901447"
-SRC_URI[cgt6xbin.sha256sum] = "7e1c8b67420abf6f2f44786811d0a2b5692e76194743bed714ec9087cc1a75c7"
-
diff --git a/recipes-ti/devtools/ti-cgt6x_6.1.20.bb b/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
new file mode 100644
index 0000000..1d6609c
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
@@ -0,0 +1,11 @@
+require ti-cgt6x.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
+
+PE = "1"
+PV = "6_1_20"
+PVwithdots = "6.1.20"
+
+SRC_URI[cgt6xbin.md5sum] = "39485ea8211960de0a958ab27106ab9b"
+SRC_URI[cgt6xbin.sha256sum] = "a020142011c8160e24f6386f7696ecfbfe02dab2a6c83af74ce6b67eb1da9900"
+
-- 
1.7.2.5


