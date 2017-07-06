Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8F5AE00BC1; Thu,  6 Jul 2017 15:48:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31757E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:48:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MmKwA004309
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499381300;
	bh=yj94k8vLNHGe56Op/xV7nI9VD7IMTmlwUzgeEAOglow=;
	h=From:To:CC:Subject:Date;
	b=Jqh6pYFWNeuqUIM0lS+Kf8SoNqkx018sahWKfHFqTss9bvApP+UN4Wbi2vpLDRC/D
	DIv7atOMK8xTun25DeiWuGdWHlOvIg/y9Oquxcdt5l7y6Df4GcwZG8lgIqIqHxT0hG
	JZviC0ZH53hUadDOSDJAT4Cy/VRcF5T4C3R1fOBE=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MmK6s003487
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:48:20 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:48:20 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MmKEZ015509;	Thu, 6 Jul 2017 17:48:20 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:48:19 -0400
Message-ID: <1499381299-60889-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] spi-lld-rtos: Add rtos recipe for spi-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:48:22 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bb

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
new file mode 100644
index 0000000..a16e1d4
--- /dev/null
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
@@ -0,0 +1,39 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://SPI.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SPI_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/spi-lld.git"
+SPI_LLD_GIT_PROTOCOL = "git"
+SPI_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.07A"
+SPI_LLD_SRCREV = "d37daaf3a922e893fe845d44324393994321d443"
+
+BRANCH = "${SPI_LLD_GIT_BRANCH}"
+SRC_URI = "${SPI_LLD_GIT_URI};protocol=${SPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${SPI_LLD_SRCREV}"
+PV = "01.00.00.07A"
+PR = "r0"
+
+DEPENDS_append = " osal-rtos \
+                   edma3-lld-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_SPI_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "SPI LLD"
-- 
1.9.1


