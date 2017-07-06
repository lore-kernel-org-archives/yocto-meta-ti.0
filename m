Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10241E00BD5; Thu,  6 Jul 2017 15:35:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2794E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:35:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MZIxb006436
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380518;
	bh=7o+Aot1QZe0pIBaaDq7Z9UCpiCAMIty9gvoi7J3Tht4=;
	h=From:To:CC:Subject:Date;
	b=gq0XXd8Ux+mr55BT4T4h05Bedpx1g1P6MDokAErgTFjgGiBpy+Qb0897JDWkCMB6m
	+iDFvoWybGksuclFEUUFY2tA5rFsTnfntpLIKpWr2hSnpDYBjJ7q412uaoSWb7+Jz2
	ZvjK/g8OQ/9l3Eef7EdiK2hfhTS183wyZUgFYPUg=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MZDgt019008
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:35:13 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:35:12 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MZCvM025836;	Thu, 6 Jul 2017 17:35:12 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:35:11 -0400
Message-ID: <1499380511-60269-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mcbsp-lld-rtos: Added rtos recipe for mcbsp-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:35:30 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb

diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
new file mode 100644
index 0000000..f701b8f
--- /dev/null
+++ b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
@@ -0,0 +1,33 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://mcbspver.h;beginline=1;endline=47;md5=a8a39efd13fa6fe66da5461b898d620e"
+
+COMPATIBLE_MACHINE = "k2g|c665x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+MCBSP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mcbsp-lld.git"
+MCBSP_LLD_GIT_PROTOCOL = "git"
+MCBSP_LLD_GIT_BRANCH = "master"
+MCBSP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcbsp"
+
+# Below commit ID corresponds to "DEV.MCBSP_LLD.01.00.00.08"
+MCBSP_LLD_SRCREV = "63a4bed526ac70bbc530836ef4aa711739bd0bd2"
+
+BRANCH = "${MCBSP_LLD_GIT_BRANCH}"
+SRC_URI = "${MCBSP_LLD_GIT_URI};destsuffix=${MCBSP_LLD_GIT_DESTSUFFIX};protocol=${MCBSP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${MCBSP_LLD_SRCREV}"
+PV = "01.00.00.08"
+PR = "r0"
+
+S = "${WORKDIR}/${MCBSP_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " edma3-lld-rtos \
+"
+
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "MCBSP LLD"
-- 
1.9.1


