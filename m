Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B3F7E00BD5; Thu,  6 Jul 2017 15:42:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E61FE00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:42:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MgQv7026309
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380946;
	bh=7U1qIr5oTVKLnvjx9wBxSpAkdoLJoJB1eG4exJMdtgE=;
	h=From:To:CC:Subject:Date;
	b=KNSNtP7PhzBbGh7IsSBKuo+XdswL69NgmcenCjJpf2Px06f9PnrFLP2cwQcgHhEsC
	p2cQuA42lJmTYie+Epnobge2x5xW5NaXJaVeNB7N8q7GqZ6mmzvfa4fJ47hK9f9dsU
	lHQf78DFz+xr0fjHrQfS8vYdXPlXvyKn919lZ5PI=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MgQOB028724
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:42:26 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:42:25 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MgPFV010495;	Thu, 6 Jul 2017 17:42:25 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:42:24 -0400
Message-ID: <1499380944-60574-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] icss-emac-lld-rtos: Added rtos recipe for icss-emac-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:42:27 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
new file mode 100644
index 0000000..53e6bf3
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
@@ -0,0 +1,43 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://icss_emacDrv.h;beginline=1;endline=40;md5=88d270788c1d8516511304f11a28586d"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ICSS_EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/icss-emac.git"
+ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
+ICSS_EMAC_LLD_GIT_BRANCH = "master"
+ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
+
+# Below commit ID corresponds to "DEV.ICSS-EMAC_LLD.01.00.00.07C"
+ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
+
+BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
+SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
+PV = "01.00.00.07C"
+PR = "r0"
+
+S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " osal-rtos \
+                   pruss-lld-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_ICSS_EMAC_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
+
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


