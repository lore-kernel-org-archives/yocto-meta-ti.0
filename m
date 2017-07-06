Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DA57E00BDC; Thu,  6 Jul 2017 15:19:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CF7AE00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:19:00 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MIxwe001335
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499379539;
	bh=nmH/EFJmfW18BK89IavprhN90/CU1GpC93DRkCMg15g=;
	h=From:To:CC:Subject:Date;
	b=RLX0whdfHZ4HY+Nk2kbVmKKhcvz1FlntPEvY9PVgNDP2yh8hNL8lHine+tQYPod9j
	IDgZ9oJj+4IitINkXkSgMPzVPh6g0QKxQCzwREFQ1RAo2BHdzKAU4hHSKWTuhgYCtu
	qvvQMaHAEEhCcRJFS4dplSZbf4L2Up9a1GzB138I=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MIx7R030095
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:18:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:18:59 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MIxlV019915;	Thu, 6 Jul 2017 17:18:59 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:18:57 -0400
Message-ID: <1499379537-56273-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] board-rtos: Added board-rtos recipe
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
X-List-Received-Date: Thu, 06 Jul 2017 22:19:04 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bb | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bb

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
new file mode 100644
index 0000000..bd80346
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -0,0 +1,66 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=0e3182ba6a963da159c37eafa9752ade"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BOARD_GIT_URI = "git://git.ti.com/keystone-rtos/board.git"
+BOARD_GIT_PROTOCOL = "git"
+BOARD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.BOARD.01.00.07.00"
+BOARD_SRCREV = "7d6a76ee65d75714740d468a48ca7e3668e66a94"
+
+BRANCH ="${BOARD_GIT_BRANCH}"
+SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${BOARD_SRCREV}"
+PV = "01.00.07.00"
+PR = "r0"
+
+DEPENDS_append = " i2c-lld-rtos \
+                   spi-lld-rtos \
+                   uart-lld-rtos \
+"
+
+DEPENDS_append_omap-a15 = " osal-rtos \
+                            ti-ndk \
+"
+
+DEPENDS_append_am57xx-evm = " gpio-lld-rtos \
+                              icss-emac-lld-rtos \
+                              mmcsd-lld-rtos \
+                              pruss-lld-rtos \
+                              pm-lld-rtos \
+"
+
+DEPENDS_append_ti33x = " gpio-lld-rtos \
+                         gpmc-lld-rtos \
+                         icss-emac-lld-rtos \
+                         mmcsd-lld-rtos \
+                         osal-rtos \
+                         pruss-lld-rtos \
+                         starterware-rtos \
+                         ti-ndk \
+"
+
+DEPENDS_append_ti43x = " gpio-lld-rtos \
+                         gpmc-lld-rtos \
+                         icss-emac-lld-rtos \
+                         mmcsd-lld-rtos \
+                         osal-rtos \
+                         pruss-lld-rtos \
+                         starterware-rtos \
+                         ti-ndk \
+"
+
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_BOARD_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
-- 
1.9.1


