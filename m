Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1211FE00D19; Wed, 12 Oct 2016 10:53:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 887D4E00C19
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 10:53:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9CHrqsn011313
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 12:53:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9CHrq55007237
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 12:53:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 12:53:52 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9CHrp4O017703;	Wed, 12 Oct 2016 12:53:52 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Oct 2016 13:53:47 -0400
Message-ID: <1476294829-27885-3-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1476294829-27885-1-git-send-email-jsobota@ti.com>
References: <1476294829-27885-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 3/5] ti-cgt6x: Upgrade to version 8.1.1
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
X-List-Received-Date: Wed, 12 Oct 2016 17:53:56 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/devtools/{ti-cgt6x_8.1.0.bb => ti-cgt6x_8.1.1.bb} |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-ti/devtools/{ti-cgt6x_8.1.0.bb => ti-cgt6x_8.1.1.bb} (90%)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb b/recipes-ti/devtools/ti-cgt6x_8.1.1.bb
similarity index 90%
rename from recipes-ti/devtools/ti-cgt6x_8.1.0.bb
rename to recipes-ti/devtools/ti-cgt6x_8.1.1.bb
index 79b562a..bc40762 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.1.1.bb
@@ -5,7 +5,7 @@ LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0
 LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
 LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
 
-PE = "1"
+PE = "0"
 
 require recipes-ti/includes/ti-unpack.inc
 
@@ -37,11 +37,11 @@ BINFILE_NAME_class-target = "cgt6x_arm_installer"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt6x_x86_installer.md5sum] = "43d9a9a6307c7ba0933050e4ba1b0e56"
-SRC_URI[cgt6x_x86_installer.sha256sum] = "0ce82e2d338b8aab3c3d1eb52217d025bd07952ac40c8f5a9319652d0c8882ad"
+SRC_URI[cgt6x_x86_installer.md5sum] = "ef39176c85615eba27c5334cc18e9065"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "28dc93aaf4f29b86c212492d8e414df4dd2a7d0b48053b5c557d681aa9ae21b6"
 
-SRC_URI[cgt6x_arm_installer.md5sum] = "52433a9ffdc6fbbb539a3c8e3e1c9ec0"
-SRC_URI[cgt6x_arm_installer.sha256sum] = "286a96e3082086c37129cbbc6c3665c76028b68975d02fc30375a6aaba00532a"
+SRC_URI[cgt6x_arm_installer.md5sum] = "536f15652c4222d67c17fc6caa7ae807"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "dd33743b61daeef0a22ede2086af7e60d0ea9f45c1b667caf2d1ae8d260a099a"
 
 do_install() {
     install -d ${D}${bindir}
-- 
1.7.10.4


