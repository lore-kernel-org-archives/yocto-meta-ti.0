Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E048AE00BD5; Thu,  6 Jul 2017 15:32:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A084E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:32:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MWWeE019870
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380352;
	bh=Yji1o7bSm9VF1p0gOHHhHZo/WHjjyZChtXx3tGF0iJI=;
	h=From:To:CC:Subject:Date;
	b=suOZgGlkeOE8jrO0Ig5SX1Mv++syza+azhrFaNEVzzb8wBlxg6R/8hgz+zjv/CyA8
	UuhjBM8yC+gSSGdTeFqpdy+mrkqE2ZGhwv/01SzpioyI1asPvjnDdHW/2Xx+/S9PEQ
	P4Ho9hX7nZHdYp/mWGoLdU0tcuWzrqQy7zfV68PI=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MWWpn015504
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:32:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:32:31 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MWVBB001203;	Thu, 6 Jul 2017 17:32:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:32:24 -0400
Message-ID: <1499380344-60148-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] uart-lld-rtos: Added rtos recipe for uart-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:32:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bb

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
new file mode 100644
index 0000000..fb4c352
--- /dev/null
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -0,0 +1,39 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://UART.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+UART_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/uart-lld.git"
+UART_LLD_GIT_PROTOCOL = "git"
+UART_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.07A"
+UART_LLD_SRCREV = "884e340f5d2f004de99e44f014fedb781f1fb975"
+
+BRANCH = "${UART_LLD_GIT_BRANCH}"
+SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${UART_LLD_SRCREV}"
+PV = "01.00.00.07A"
+PR = "r0"
+
+DEPENDS_append = " edma3-lld-rtos \
+                   osal-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_UART_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "UART LLD"
-- 
1.9.1


