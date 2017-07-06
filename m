Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69F88E00BD5; Thu,  6 Jul 2017 15:36:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1F0EE00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:36:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66Ma9Qd003266
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380569;
	bh=jIdR9HGqgDgN9tAo3npAHiksJaGDyApfklGs1iPI7Pg=;
	h=From:To:CC:Subject:Date;
	b=OBoHHX5v4cQEaqWlamADqCQAxIZxNU/jQlUlV5ygf0dgRjKBXZNKFYRKu3CrU0gsZ
	4pI4VzYzYuBI4HvWxke9/S758th3omFSFmnBaAZxnVcl+4YQWQVgUfR4wA24Ki4MKE
	cJVrMP0/mL6JK7aSE54pWPnRDwO3rcmoS0P7ph5M=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66Ma96w020161
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:36:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:36:08 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66Ma8sf026845;	Thu, 6 Jul 2017 17:36:08 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:36:06 -0400
Message-ID: <1499380566-60323-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mcasp-lld-rtos: Added rtos recipe for mcasp-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:36:11 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
new file mode 100644
index 0000000..78e2982
--- /dev/null
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
@@ -0,0 +1,43 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://mcaspver.h;beginline=1;endline=47;md5=cc81a11c1566fe1cf19270744f504619"
+
+COMPATIBLE_MACHINE = "ti43x|omap-a15|k2g|ti33x|omapl1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+MCASP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mcasp-lld.git"
+MCASP_LLD_GIT_PROTOCOL = "git"
+MCASP_LLD_GIT_BRANCH = "master"
+MCASP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcasp"
+
+# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.06B"
+MCASP_LLD_SRCREV = "c64ca018d4482f6841e7f8fde3a7adf50f4d329f"
+
+BRANCH = "${MCASP_LLD_GIT_BRANCH}"
+SRC_URI = "${MCASP_LLD_GIT_URI};destsuffix=${MCASP_LLD_GIT_DESTSUFFIX};protocol=${MCASP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${MCASP_LLD_SRCREV}"
+PV = "01.01.00.06B"
+PR = "r0"
+
+S = "${WORKDIR}/${MCASP_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " edma3-lld-rtos \
+                   osal-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_MCASP_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "MCASP LLD"
-- 
1.9.1


