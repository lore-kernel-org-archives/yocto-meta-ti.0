Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A21C6E00D17; Wed, 28 Sep 2016 08:33:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9285E00CFC
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 08:33:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8SFXUMO025622
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 10:33:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8SFXUsC027651
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 10:33:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 10:33:29 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8SFXTPK000911;	Wed, 28 Sep 2016 10:33:29 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 28 Sep 2016 11:33:28 -0400
Message-ID: <1475076808-16161-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v2 2/3] gcc-arm-none: Update to 4.9.2015q3
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2016 15:33:36 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 .../gcc-arm-none-eabi-native_4.9.2015q3.bb         |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
new file mode 100644
index 0000000..1fe5c52
--- /dev/null
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Baremetal GCC for ARM"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=cba77c7fde3ed13e866b04a2f3d93918"
+
+inherit native
+require recipes-ti/includes/ti-paths.inc
+
+SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2;name=gcc-arm-none"
+
+SRC_URI[gcc-arm-none.md5sum] = "8a4a74872830f80c788c944877d3ad8c"
+SRC_URI[gcc-arm-none.sha256sum] = "c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab"
+
+S = "${WORKDIR}/gcc-arm-none-eabi-4_9-2015q3"
+
+do_install() {
+    install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
+}
+
+FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
+
+INSANE_SKIP_${PN} = "already-stripped"
-- 
1.7.10.4


