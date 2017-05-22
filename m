Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 104A8E00B51; Mon, 22 May 2017 15:32:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4977CE00812
	for <meta-ti@yoctoproject.org>; Mon, 22 May 2017 15:32:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4MMWJie023537
	for <meta-ti@yoctoproject.org>; Mon, 22 May 2017 17:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1495492339;
	bh=ivu5dvX5ehZ6DWc5TS65XotD3WQEtHGCVkczjQ99l04=;
	h=From:To:CC:Subject:Date;
	b=OCcd27kplwCltjhqMY9uLVABlbOPMpCBylW+5bKXBS9WfNH27KcQ8NBr/xYyg2bx0
	icnVnkkcHr7EU74FZeOWjV2yeqOjc2hGrXGmSDZu5GDvTs4un4khzb/2qz29Yh6uAC
	mEplIIfBl1+FS/0vFscC+TAJDPhFlVE32ESiME3E=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4MMWJo1032640
	for <meta-ti@yoctoproject.org>; Mon, 22 May 2017 17:32:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 22 May 2017 17:32:18 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4MMWIQu020698;	Mon, 22 May 2017 17:32:18 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 22 May 2017 17:32:03 -0500
Message-ID: <1495492323-19213-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] starterware-rtos: added recipe for RTOS starterware
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
X-List-Received-Date: Mon, 22 May 2017 22:32:23 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-bsp/starterware/starterware-rtos_git.bb | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bb

diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/starterware/starterware-rtos_git.bb
new file mode 100644
index 0000000..f831fb8
--- /dev/null
+++ b/recipes-bsp/starterware/starterware-rtos_git.bb
@@ -0,0 +1,46 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=35;md5=286cbb5dce3e348294b6b025cff969b3"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x"
+DEPENDS = "gcc-arm-none-eabi-native"
+
+require recipes-ti/includes/ti-paths-append.inc
+require recipes-ti/includes/ti-staging.inc
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
+STARTERWARE_GIT_PROTOCOL = "git"
+STARTERWARE_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.02A"
+STARTERWARE_SRCREV = "d648ffc46a3508802ec5d4f70f3d0e8f970ce1fa"
+
+BRANCH = "${STARTERWARE_GIT_BRANCH}"
+SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${STARTERWARE_SRCREV}"
+PV = "02.01.01.02A"
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+PARTNO_ti33x = "am335x"
+PARTNO_ti43x = "am437x"
+
+export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
+
+do_compile() {
+    cd build
+    ./release_${PARTNO}.sh
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch staticdev"
-- 
1.9.1


