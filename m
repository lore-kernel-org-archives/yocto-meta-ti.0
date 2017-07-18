Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A859EE00CAE; Tue, 18 Jul 2017 16:04:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A23FE00C82
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4Ysb001282
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419074;
	bh=tE30R1q8/fTR80we6swPhDXo2TrXl1tRZpydCYNGezc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VUrZYY59tT4ACXT/lG98LMgHz5+yx8O57lI07StixFPfXHrOc6jrh2q8XXxurvIfH
	48GKlUVtazJP5kJWYtx4jpFMpfOsxr36pCedl6CUnV3vY9reVOjnWIIFRaOQz7Vcez
	+0IPswRhOjFzGi5Q0uX1PAJt9kZZWm7HTqjo2y+k=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4TpA008480
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:29 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hj000997;	Tue, 18 Jul 2017 18:04:29 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:23 -0400
Message-ID: <1500419028-3361-12-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 12/37] mcasp-lld-rtos: Added rtos recipe for mcasp-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:53 -0000
Content-Type: text/plain

Upstreaming RTOS recipe for Multi Channel Audio Serial port (McASP) low
level driver
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2- Added summary & merged in to a single recipe

 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 45 +++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
new file mode 100644
index 0000000..11b18c5
--- /dev/null
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
@@ -0,0 +1,45 @@
+SUMMARY = "TI RTOS low level driver for Multi channel Audio Serial port (McASP)"
+
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


