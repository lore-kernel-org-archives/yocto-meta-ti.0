Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80360E00C82; Tue, 18 Jul 2017 16:05:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB58AE00CC6
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4rdt020823
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419093;
	bh=0Z3K+Sgaf54kCEocQDU5a9UiMMKY32lKXHP+bDsMHSo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eiwN6BqvH8cjSjDzFqtJEAYcG+40DXdjacwempR3d0FrAYP0AZ9AX2t8mJBcMmY6N
	OLOvPqybdeLwIROC4z6IuXH6qTLOxyaNs5AqUtiASCHZPaDHC+w2mKUQRKKdIPLAJo
	UzqomWrv3rZh/wZ+xVqOdJT4Ld4QY0lMEScBp9uU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4rTp032512
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:53 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46i4000997;	Tue, 18 Jul 2017 18:04:53 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:42 -0400
Message-ID: <1500419028-3361-31-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 31/37] board-rtos: Added board-rtos recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 23:05:04 -0000
Content-Type: text/plain

Upstreaming board library for RTOS
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary & merged in to a single recipe

 recipes-bsp/board-rtos/board-rtos_git.bb | 71 ++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bb

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
new file mode 100644
index 0000000..5ba672f
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -0,0 +1,71 @@
+SUMMARY = "TI RTOS Board Library"
+
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
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+
+export PDK_BOARD_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
-- 
1.9.1


