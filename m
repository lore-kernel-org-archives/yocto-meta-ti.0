Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8EFA9E00A7D; Wed, 27 Jan 2016 12:54:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCB1AE00B46
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 885BF52AAD; Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205449.885BF52AAD@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-cgt6x: Upgrade to version 8.1.0
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
X-List-Received-Date: Wed, 27 Jan 2016 20:54:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5437ef8b7a2babc5246fcec8b9f2f272e0de973b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5437ef8b7a2babc5246fcec8b9f2f272e0de973b

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:39 2016 +0000

ti-cgt6x: Upgrade to version 8.1.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../{ti-cgt6x_8.0.3.bb => ti-cgt6x_8.1.0.bb}       |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

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


