Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDE50E00CA4; Tue, 18 Jul 2017 16:04:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0C85E00C78
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4SJA027035
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419068;
	bh=9rk3NxAAFV4d7NOUb2FGBl13X3zRArv9HZLg7cLwv4k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EQS7qOfnWKeioSHFxhh2sR1fzHTNJcqaEmAs+xpSdOwO7nO31gEOKiWp0dh5LhzmF
	00RMfGwFiUkfKzl+EuwOFfT6LvlS9MS3ntNkaRU4ufWrFPFzKkcQjCM69EK5cknWTA
	2R0jk+z7z0+h04VWnnkIDot4i9YrRhUtqP6C3OlA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4S8K008460
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:27 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hi000997;	Tue, 18 Jul 2017 18:04:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:22 -0400
Message-ID: <1500419028-3361-11-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 11/37] mcbsp-lld-rtos: Added rtos recipe for mcbsp-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:35 -0000
Content-Type: text/plain

Upstreaming RTOS PDK driver for MCBSP module

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary & moving in to a single recipe

 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb

diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
new file mode 100644
index 0000000..2fe0ede
--- /dev/null
+++ b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "TI RTOS low level driver for Multi-channel Buffered Serial Port (McBSP)"
+
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


