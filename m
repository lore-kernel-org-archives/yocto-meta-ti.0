Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D6CAE00BAD; Thu,  6 Jul 2017 09:43:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,TVD_SPACE_RATIO,
	TVD_SPACE_RATIO_MINFP autolearn=ham version=3.3.1
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
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  0.0 TVD_SPACE_RATIO_MINFP Space ratio
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E84AE00B57
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:43:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66Gh4vS009580
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499359384;
	bh=hp0lZePR8q3BJiHNKuVGpc5l4UQXV/iWjZ+84yfjONE=;
	h=From:To:CC:Subject:Date;
	b=Uchh/pTWix29jOMWRq4G6qIQUUxjMky1oO/AnOeAXsq925Xx3P8/iKSvPLmBA12sH
	/KTilN7hcGGhB5kWAGciChqV57z2eHoV7aNRQ4R4r3rB2DzmvaYsDLBDRXdAAg50H6
	K3T+4GaOlRqxTlruLKTopOcnCTDUh65rBM/DSCqQ=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66Gh4dX010472
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:43:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:43:03 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66Gh3C5024938;	Thu, 6 Jul 2017 11:43:03 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:43:02 -0400
Message-ID: <1499359382-35477-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] emac-lld-rtos: Added emac-lld-rtos recipe
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
X-List-Received-Date: Thu, 06 Jul 2017 16:43:08 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 12 ++++++++++++
 recipes-bsp/emac-lld/emac-lld.inc         | 19 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bb
 create mode 100644 recipes-bsp/emac-lld/emac-lld.inc

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
new file mode 100644
index 0000000..9420ed5
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
@@ -0,0 +1,12 @@
+inherit ti-pdk
+require emac-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " board-rtos osal-rtos"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+DEPENDS_append_k2g  = " cppi-lld-rtos qmss-lld-rtos"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "EMAC LLD"
diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/emac-lld.inc
new file mode 100644
index 0000000..e99580e
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld.inc
@@ -0,0 +1,19 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a85d990a390f45d88"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
+EMAC_LLD_GIT_PROTOCOL = "git"
+EMAC_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.06A"
+EMAC_LLD_SRCREV = "30ed663809ab178098f8207e9d49913d1446ee6c"
+
+BRANCH ="${EMAC_LLD_GIT_BRANCH}"
+SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${EMAC_LLD_SRCREV}"
+PV = "01.00.03.06A"
+INC_PR = "r0"
-- 
1.9.1


