Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5277E00BB1; Mon, 18 Sep 2017 13:43:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FAB6E00970
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:43:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKhaNo012499
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505767416;
	bh=IYGsrlbz6rrtmWnVGk+Fdl5cswncF8d4DlTC4ZUNJjE=;
	h=From:To:CC:Subject:Date;
	b=drePzyn36jFgI/vvPRJwSE2x8KcXCMatGF6FToB1igQv+2AzuLw4iR98Hh4qgDwFQ
	h3JSkeLWapNTelk/u+0BUsFirK9gLqlEZ/JWX9xvpn8gQ7XsqXM9n9BelVIGZBWhGd
	YufvXzWqYkg61stolG8R1roh9z3pkH+1Gz/oiz5E=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKhax2022660
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:43:36 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 15:43:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 15:43:36 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKhaXF023220;
	Mon, 18 Sep 2017 15:43:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 Sep 2017 16:43:34 -0400
Message-ID: <1505767414-4178-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v4] vps-lld-rtos: Added rtos recipe for vps-lld
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
X-List-Received-Date: Mon, 18 Sep 2017 20:43:41 -0000
Content-Type: text/plain

RTOS low level driver for Video processing subsystem.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Modifications to use ti-pdk.bbclass
 v3 - Removed intermediate tar-untar for do-install
 v2 - Added summary

 recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 recipes-bsp/vps-lld/vps-lld-rtos_git.bb

diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
new file mode 100644
index 0000000..f13e2fc
--- /dev/null
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -0,0 +1,52 @@
+SUMMARY = "TI RTOS Low level driver for Video Processing Subsystem (VPS) "
+
+require recipes-ti/includes/ti-paths.inc
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=32;md5=4303d306ea53eb66132983d6901c137d"
+
+COMPATIBLE_MACHINE = "omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+VPS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/vps.git"
+VPS_LLD_GIT_PROTOCOL = "git"
+VPS_LLD_GIT_BRANCH = "master"
+VPS_LLD_GIT_DESTSUFFIX = "git/ti/drv/vps"
+
+# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.06B"
+VPS_LLD_SRCREV = "58729317b65bdb24d4343cbb1f7f6cb90ca2faf0"
+
+BRANCH = "${VPS_LLD_GIT_BRANCH}"
+SRC_URI = "${VPS_LLD_GIT_URI};destsuffix=${VPS_LLD_GIT_DESTSUFFIX};protocol=${VPS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${VPS_LLD_SRCREV}"
+PV = "01.00.01.06B"
+PR = "r0"
+
+S = "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS = " ti-sysbios \
+            osal-rtos \
+            edma3-lld-rtos \
+            board-rtos \
+            uart-lld-rtos \
+            i2c-lld-rtos \
+            pm-lld-rtos \
+"
+export PDK_VPS_COMP_PATH = "${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+do_compile_append() {
+    # Delete archive created by XDC release command since it does not contain all content
+    find -name "*.tar" -exec rm -f {} \;
+
+    # Archive from build/ to capture ti/drv/pm/ in archive
+    cd ${B}
+    tar -cf pm_lld.tar --exclude='*.tar' ./*
+}
+
+INSANE_SKIP_${PN} = "arch ldflags"
-- 
1.9.1


