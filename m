Return-Path: <mwei@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA7FEE00566; Mon, 23 May 2016 11:54:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C939E004A0
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 11:54:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4NIsPGX014627
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 13:54:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4NIsPvL018530
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 13:54:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 May 2016 13:54:25 -0500
Received: from UDA0322553.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4NIsPsi018417;	Mon, 23 May 2016 13:54:25 -0500
From: Ming Wei <mwei@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 23 May 2016 14:54:17 -0400
Message-ID: <1464029657-16548-1-git-send-email-mwei@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ccsv6-native: update to new version 6.1.3.00033
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
X-List-Received-Date: Mon, 23 May 2016 18:54:29 -0000
Content-Type: text/plain

updated ARM-CGT version and MD5/SHAR256 checksum

Signed-off-by: Ming Wei <mwei@ti.com>
---
 ...i-ccsv6-native_6.1.2.00015.bb => ti-ccsv6-native_6.1.3.00033.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-ccsv6-native_6.1.2.00015.bb => ti-ccsv6-native_6.1.3.00033.bb} (87%)
 mode change 100644 => 100755

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
old mode 100644
new mode 100755
similarity index 87%
rename from recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
rename to recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
index 270169d..ba0da7d
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
@@ -10,7 +10,7 @@ require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-staging.inc
 require recipes-ti/includes/ti-paths.inc
 
-TI_CGT_ARM_VERSION = "5.2.5"
+TI_CGT_ARM_VERSION = "15.12.1.LTS"
 
 SRC_URI = "http://install.source.dir.local/CCS${PV}_linux.tar.gz;name=ccsv6"
 
@@ -20,8 +20,8 @@ BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
 TI_BIN_UNPK_CMDS = ""
 
-SRC_URI[ccsv6.md5sum] = "cfe5a759068809df5b5926dfc9889683"
-SRC_URI[ccsv6.sha256sum] = "6c25c046898812dcc72f08af512321bb4c9833ab932e4792560e14c13fbc7dc5"
+SRC_URI[ccsv6.md5sum] = "d95121970f8bcee944bf8b8e576bf3ec"
+SRC_URI[ccsv6.sha256sum] = "b785f040de8cccbc571923e34303fea92484677845df64a65abee2d3c248fa5b"
 
 do_install() {
     install -d ${D}${CCSV6_INSTALL_DIR_RECIPE}
-- 
1.9.1


