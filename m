Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1ED72E00BD5; Thu,  6 Jul 2017 15:34:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2E1CE00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:34:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MYDUt006355
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380453;
	bh=4WCppP2gWoFdzyhH18c8tI7E/fqDYHz0Lt8bcm421dc=;
	h=From:To:CC:Subject:Date;
	b=JJ57HKCVdbIH/ND9CmnOJar/TkCesfWVuT9MVK51GcMCTnRYBnK676TQnfI4KrZZa
	e2zE26Mu9Zxc/ZHA0hg+6KEz62CsYj99xIF5r/BssPQjNrwn7FetFJ9T674I4LhTnJ
	2vJALvnS1ccK4SQArd7HLfWMYIZVoX/bnrtBVRjY=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MY7tg017775
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:34:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:34:07 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MY7gK024855;	Thu, 6 Jul 2017 17:34:07 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:34:05 -0400
Message-ID: <1499380445-60212-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mmcsd-lld-rtos: Add rtos recipe for mmcsd-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:34:25 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb | 44 +++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
new file mode 100644
index 0000000..466b1d9
--- /dev/null
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
@@ -0,0 +1,44 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://MMCSD.h;beginline=1;endline=32;md5=f74069541d4d165a000a66b4043cb065"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+MMCSD_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sd-mmc.git"
+MMCSD_LLD_GIT_PROTOCOL = "git"
+MMCSD_LLD_GIT_BRANCH = "master"
+MMCSD_LLD_GIT_DESTSUFFIX = "git/ti/drv/mmcsd"
+
+# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.07"
+MMCSD_LLD_SRCREV = "54b4b40174297475a648abc4afd23560c2f29911"
+
+BRANCH = "${MMCSD_LLD_GIT_BRANCH}"
+SRC_URI = "${MMCSD_LLD_GIT_URI};destsuffix=${MMCSD_LLD_GIT_DESTSUFFIX};protocol=${MMCSD_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${MMCSD_LLD_SRCREV}"
+PV = "01.00.00.07"
+PR = "r0"
+
+S = "${WORKDIR}/${MMCSD_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " edma3-lld-rtos \
+                   osal-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_MMCSD_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "MMCSD LLD"
-- 
1.9.1


