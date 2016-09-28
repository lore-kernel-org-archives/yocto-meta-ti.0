Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7CDEE00D10; Wed, 28 Sep 2016 08:44:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAFE3E00CF2
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 08:44:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8SFiLia013902
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 10:44:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8SFiKqN006108
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 10:44:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 10:44:19 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8SFiGKX010765;	Wed, 28 Sep 2016 10:44:19 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 28 Sep 2016 11:44:03 -0400
Message-ID: <1475077444-16485-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1475077444-16485-1-git-send-email-jsobota@ti.com>
References: <1475077444-16485-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gcc-arm-none-eabi-native: Update to version 4.9.2015q3
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
X-List-Received-Date: Wed, 28 Sep 2016 15:44:25 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 ...ve_4.8.2014q3.bb => gcc-arm-none-eabi-native_4.9.2015q3.bb} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/devtools/{gcc-arm-none-eabi-native_4.8.2014q3.bb => gcc-arm-none-eabi-native_4.9.2015q3.bb} (59%)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
similarity index 59%
rename from recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
rename to recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
index d3dba41..1fe5c52 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=cba77c7fd
 inherit native
 require recipes-ti/includes/ti-paths.inc
 
-SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2;name=gcc-arm-none"
+SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2;name=gcc-arm-none"
 
-SRC_URI[gcc-arm-none.md5sum] = "acc8c8ff45f8801e2155934214309a87"
-SRC_URI[gcc-arm-none.sha256sum] = "e33d7546de1e02844239c72b3ef5563f472fcd6b4637419d513770ae13f551c0"
+SRC_URI[gcc-arm-none.md5sum] = "8a4a74872830f80c788c944877d3ad8c"
+SRC_URI[gcc-arm-none.sha256sum] = "c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab"
 
-S = "${WORKDIR}/gcc-arm-none-eabi-4_8-2014q3"
+S = "${WORKDIR}/gcc-arm-none-eabi-4_9-2015q3"
 
 do_install() {
     install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
-- 
1.7.10.4


