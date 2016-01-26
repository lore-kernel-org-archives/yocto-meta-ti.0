Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6660BE00C09; Tue, 26 Jan 2016 13:17:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 202A9E00C0F
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:16:58 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLGwxf005541
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:16:58 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLGwe0001392
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:16:58 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:16:57 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0QLGvUL012813;	Tue, 26 Jan 2016 15:16:57 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Jan 2016 16:16:39 -0500
Message-ID: <1453843011-28530-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
References: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] ti-cgt6x: Upgrade to version 8.1.0
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
X-List-Received-Date: Tue, 26 Jan 2016 21:17:05 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../devtools/{ti-cgt6x_8.0.3.bb => ti-cgt6x_8.1.0.bb}  | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
 rename recipes-ti/devtools/{ti-cgt6x_8.0.3.bb => ti-cgt6x_8.1.0.bb} (82%)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.3.bb b/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
similarity index 82%
rename from recipes-ti/devtools/ti-cgt6x_8.0.3.bb
rename to recipes-ti/devtools/ti-cgt6x_8.1.0.bb
index 23866d1..79b562a 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.0.3.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "TI DSP Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
 
 PE = "1"
 
-require ../includes/ti-unpack.inc
+require recipes-ti/includes/ti-unpack.inc
 
 COMPATIBLE_HOST_class-target = "arm.*-linux"
 
@@ -37,11 +37,11 @@ BINFILE_NAME_class-target = "cgt6x_arm_installer"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt6x_x86_installer.md5sum] = "cac177c3b94bf308d5198230739639b4"
-SRC_URI[cgt6x_x86_installer.sha256sum] = "9c9ebab9f29cfd55f7df1df888ede66da3c2ccc0440d602ef34564305f02b9fb"
+SRC_URI[cgt6x_x86_installer.md5sum] = "43d9a9a6307c7ba0933050e4ba1b0e56"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "0ce82e2d338b8aab3c3d1eb52217d025bd07952ac40c8f5a9319652d0c8882ad"
 
-SRC_URI[cgt6x_arm_installer.md5sum] = "7966f5ad2f055c3462ac6c3c13453ed7"
-SRC_URI[cgt6x_arm_installer.sha256sum] = "f435f886610fc7df585a6ef898494e621b3bfa17f20658436f5e63af86a9a987"
+SRC_URI[cgt6x_arm_installer.md5sum] = "52433a9ffdc6fbbb539a3c8e3e1c9ec0"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "286a96e3082086c37129cbbc6c3665c76028b68975d02fc30375a6aaba00532a"
 
 do_install() {
     install -d ${D}${bindir}
@@ -79,7 +79,9 @@ do_install() {
 
     install -d ${D}${datadir}/man/man1
     for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
-        install -m 644 ${manfile} ${D}${datadir}/man/man1
+        if [ -e ${manfile} ]; then
+            install -m 644 ${manfile} ${D}${datadir}/man/man1
+        fi
     done
 
     install -d ${D}${datadir}/doc/ti/cgt-c6x
-- 
1.9.1


