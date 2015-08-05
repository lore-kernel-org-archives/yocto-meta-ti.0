Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DFB3E00B01; Tue,  4 Aug 2015 19:24:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: misformatted + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 571E1E00AB9
	for <meta-ti@yoctoproject.org>; Tue,  4 Aug 2015 19:24:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BC47B52AB6; Wed,  5 Aug 2015 02:24:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150805022448.BC47B52AB6@arago-project.org>
Date: Wed,  5 Aug 2015 02:24:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-cgt6x: Upgrade to version 8.0.3
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
X-List-Received-Date: Wed, 05 Aug 2015 02:24:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0d7433db7a95b8aaee06fac508ef5db819aeb2ed
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0d7433db7a95b8aaee06fac508ef5db819aeb2ed

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Aug  4 20:13:32 2015 +0000

ti-cgt6x: Upgrade to version 8.0.3

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../{ti-cgt6x_8.0.0.bb => ti-cgt6x_8.0.3.bb}       |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

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


