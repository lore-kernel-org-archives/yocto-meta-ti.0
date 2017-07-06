Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE4B5E00BD5; Thu,  6 Jul 2017 15:30:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32ED4E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:30:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MUVpH025262
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380231;
	bh=+UhXDqrXyP+ykj9p23MGB/cVKI+NDM/GQUICBFA93i0=;
	h=From:To:CC:Subject:Date;
	b=ImxX/RM8OIZtKJ5epznLTzLUYmfad3P+5Z3/YwnnQZYFp439DEN7Ibs11+CbQDXLS
	U+/O+wdaPNPHuAxLrGGbvNJy1EKLiKRsZ4Oyckw9KwvkcQLx4C+NFd0O3C0JPPL9qw
	vlvBXHdX6uAo7A9FQgsK7CjAEH1FvDVnk8aKdtn8=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MUVwH012284
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:30:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:30:30 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MUUrg021153;	Thu, 6 Jul 2017 17:30:30 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:30:29 -0400
Message-ID: <1499380229-60093-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] i2c-lld-rtos: Add rtos recipe for i2c-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:30:34 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
new file mode 100644
index 0000000..af8fe7a
--- /dev/null
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
@@ -0,0 +1,40 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=147a6773e962b103cd162ca58535289c"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+I2C_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/i2c-lld.git"
+I2C_LLD_GIT_PROTOCOL = "git"
+I2C_LLD_GIT_BRANCH = "master"
+I2C_LLD_GIT_DESTSUFFIX = "git/ti/drv/i2c"
+
+# Below commit ID corresponds to "DEV.I2C_LLD.01.00.00.07A"
+I2C_LLD_SRCREV = "85ad56fb6e1f2bdabdd3c371b97170cb62a6fdd7"
+
+BRANCH = "${I2C_LLD_GIT_BRANCH}"
+SRC_URI = "${I2C_LLD_GIT_URI};destsuffix=${I2C_LLD_GIT_DESTSUFFIX};protocol=${I2C_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${I2C_LLD_SRCREV}"
+PV = "01.00.00.07A"
+PR = "r0"
+
+DEPENDS_append = " osal-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+S = "${WORKDIR}/${I2C_LLD_GIT_DESTSUFFIX}"
+
+export PDK_I2C_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "I2C LLD"
-- 
1.9.1


