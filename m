Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAE09E00D18; Wed, 12 Oct 2016 10:53:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B983AE00D08
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 10:53:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9CHrr13006249
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 12:53:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9CHrrMK007240
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 12:53:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 12:53:52 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9CHrp4P017703;	Wed, 12 Oct 2016 12:53:52 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Oct 2016 13:53:48 -0400
Message-ID: <1476294829-27885-4-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1476294829-27885-1-git-send-email-jsobota@ti.com>
References: <1476294829-27885-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 4/5] ti-ccsv6-native: Upgrade to version 6.2.0.00050
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
X-List-Received-Date: Wed, 12 Oct 2016 17:53:57 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 ...ive_6.1.3.00034.bb => ti-ccsv6-native_6.2.0.00050.bb} |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename recipes-ti/devtools/{ti-ccsv6-native_6.1.3.00034.bb => ti-ccsv6-native_6.2.0.00050.bb} (72%)

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb b/recipes-ti/devtools/ti-ccsv6-native_6.2.0.00050.bb
similarity index 72%
rename from recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
rename to recipes-ti/devtools/ti-ccsv6-native_6.2.0.00050.bb
index 334c7df..4e5192c 100644
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.2.0.00050.bb
@@ -10,25 +10,25 @@ require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-staging.inc
 require recipes-ti/includes/ti-paths.inc
 
-TI_CGT_ARM_VERSION = "15.12.1.LTS"
+TI_CGT_ARM_VERSION = "15.12.3.LTS"
 
-SRC_URI = "http://install.source.dir.local/CCS${PV}_linux.tar.gz;name=ccsv6"
+SRC_URI = "http://install.source.dir.local/CCS${PV}_linux-x64.tar.gz;name=ccsv6"
 
-S = "${WORKDIR}/CCS${PV}_linux"
+S = "${WORKDIR}/CCS${PV}_linux-x64"
 
-BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
+BINFILE = "CCS${PV}_linux-x64/ccs_setup_linux64_${PV}.bin"
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
 TI_BIN_UNPK_CMDS = ""
 
-SRC_URI[ccsv6.md5sum] = "ceaa5023c1a4b51bc637d3de1a15786b"
-SRC_URI[ccsv6.sha256sum] = "fb3205a21942da09684c871371513707c841c4fd8d88a62f6a7865b0a86cc492"
+SRC_URI[ccsv6.md5sum] = "652185ae9ef7c60a92d5fc42e4869bf2"
+SRC_URI[ccsv6.sha256sum] = "cb31dad800f2740bf5a0ce8c7e1d172666c70d71e18609c8951db1e37b2cf48e"
 
 do_install() {
     install -d ${D}${CCSV6_INSTALL_DIR_RECIPE}
     cp -r ${WORKDIR}/ccsv6/. ${D}${CCSV6_INSTALL_DIR_RECIPE}
 
     install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
-    cp -r ${WORKDIR}/ccsv6/tools/compiler/ti-cgt-arm_${TI_CGT_ARM_VERSION}/. \
+    cp -r ${WORKDIR}/ccsv6/tools/compiler/arm_${TI_CGT_ARM_VERSION}/. \
           ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
 }
 
-- 
1.7.10.4


