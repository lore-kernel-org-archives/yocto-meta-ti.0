Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69285E00A92; Tue,  4 Aug 2015 07:13:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A6C0E009C5
	for <meta-ti@yoctoproject.org>; Tue,  4 Aug 2015 07:13:41 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74EDesG029070
	for <meta-ti@yoctoproject.org>; Tue, 4 Aug 2015 09:13:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74EDegf011348
	for <meta-ti@yoctoproject.org>; Tue, 4 Aug 2015 09:13:40 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 09:13:40 -0500
Received: from udc0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t74EDe3b006086;	Tue, 4 Aug 2015 09:13:40 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 4 Aug 2015 10:13:32 -0400
Message-ID: <1438697612-2575-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] ti-cgt6x: Upgrade to version 8.0.3
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
X-List-Received-Date: Tue, 04 Aug 2015 14:13:43 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../devtools/{ti-cgt6x_8.0.0.bb => ti-cgt6x_8.0.3.bb}       | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename recipes-ti/devtools/{ti-cgt6x_8.0.0.bb => ti-cgt6x_8.0.3.bb} (88%)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-cgt6x_8.0.3.bb
similarity index 88%
rename from recipes-ti/devtools/ti-cgt6x_8.0.0.bb
rename to recipes-ti/devtools/ti-cgt6x_8.0.3.bb
index 2353ebd..23866d1 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.0.3.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f1563
 LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
 
 PE = "1"
-PR = "r1"
 
 require ../includes/ti-unpack.inc
 
@@ -36,13 +35,13 @@ TI_BIN_UNPK_CMDS = ""
 BINFILE_class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
 BINFILE_NAME_class-target = "cgt6x_arm_installer"
 
-SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/Production/${PV}/${BINFILE};name=${BINFILE_NAME}"
+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt6x_x86_installer.md5sum] = "ff83845672090bf0a669bba7b0cadf56"
-SRC_URI[cgt6x_x86_installer.sha256sum] = "297f77a00b211b3c4afa23afe7319e98b2400b5d2eb0f8c8cfe3ef7d7aa4d709"
+SRC_URI[cgt6x_x86_installer.md5sum] = "cac177c3b94bf308d5198230739639b4"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "9c9ebab9f29cfd55f7df1df888ede66da3c2ccc0440d602ef34564305f02b9fb"
 
-SRC_URI[cgt6x_arm_installer.md5sum] = "13961e5a1da4c310ea8c8707ab981fff"
-SRC_URI[cgt6x_arm_installer.sha256sum] = "cb24ae05baffbd44d6dedba68743be09fd883e04403e069c437c486533d8fffb"
+SRC_URI[cgt6x_arm_installer.md5sum] = "7966f5ad2f055c3462ac6c3c13453ed7"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "f435f886610fc7df585a6ef898494e621b3bfa17f20658436f5e63af86a9a987"
 
 do_install() {
     install -d ${D}${bindir}
@@ -110,4 +109,6 @@ FILES_${PN} += "${datadir}/ti/*"
 
 FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
 
+INSANE_SKIP_${PN} += "staticdev"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


