Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30C93E00C8F; Tue, 18 Jul 2017 16:04:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E287E00C5D
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4OV5001263
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419064;
	bh=bEHCaeA+nKPKe7mwVfIBHRUjxDVYLzmE0YH7gEOPgDY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=APwKzboyCEWYhlC97Wy2DWYm58gEBQUk1Lwbupljtcu4uQoc1TniyePul5TDYtl1f
	6DBTagA3E8NdQB6LXOxHGN18j/mB6tN5eFWE2d65OpmDKGJ27Vpa81Ew+okoL30uBu
	K8jiGZ10ETf80RmMVhV/l8BwMRK8j0CInTyoNiMQ=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4Jjc008239
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:19 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hc000997;	Tue, 18 Jul 2017 18:04:19 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:16 -0400
Message-ID: <1500419028-3361-5-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 05/37] mmcsd-lld-rtos: Add rtos recipe for mmcsd-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:45 -0000
Content-Type: text/plain

Upstreaming Multimedia card (MMC)/Secure Digital(SD) card driver recipe
for RTOS
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary

 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
new file mode 100644
index 0000000..5d1e8ae
--- /dev/null
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
@@ -0,0 +1,46 @@
+SUMMARY = "TI Multimedia card(MMC)/Secure Digital(SD) low level driver for RTOS "
+
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


