Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78076E00C82; Mon, 18 Sep 2017 13:22:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DEE3E00956
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:22:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKMhNM030370
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505766163;
	bh=6oFN6ZNRfwn72Ogg1WJzVp540suTQjLCdpQO0BbmADA=;
	h=From:To:CC:Subject:Date;
	b=R9rAfDAIWukOUo4mpyslMpSfq3jqHLNA9FsPVsvj7yyHX2520LU+6pLXp4Pv8UUCN
	mYbJCDiKWPCgBPN+LYIxJE7oRAMoom0z1Utb65N58YCzB7gQoYJRWAXtLawaEe9bJh
	p48Lo23vsZ05dYOExQDWP6XkrKZDXIX2cuUhDUMc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKMhQO008384
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:22:43 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 15:22:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 15:22:42 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKMgqm023930;
	Mon, 18 Sep 2017 15:22:42 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 Sep 2017 16:22:39 -0400
Message-ID: <1505766159-40186-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v4] pruss-lld: Add rtos recipe & update the version to 1.0.0.7
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
X-List-Received-Date: Mon, 18 Sep 2017 20:22:47 -0000
Content-Type: text/plain

RTOS low level driver for the PRUSS module
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 
 v4 - Updated the commit message
 v3 - Added k2g SOC family in place of k2g-evm & k2g-hs-evm
 v2 - Added summary

 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 23 +++++++++++++++++++++++
 recipes-bsp/pruss-lld/pruss-lld.inc         |  8 ++++----
 2 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb

diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
new file mode 100644
index 0000000..5068286
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "TI RTOS low level driver library for PRUSS"
+
+inherit ti-pdk
+require recipes-bsp/pruss-lld/pruss-lld.inc
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " osal-rtos"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_PRUSS_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${WORKDIR}/build"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "PRUSS LLD"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
index 8620108..44d84b8 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://pruicss.h;beginline=1;endline=31;md5=315177aa03d58bcd124a6e799e2bd458"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PRUSS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pruss-lld.git"
@@ -9,12 +9,12 @@ PRUSS_LLD_GIT_PROTOCOL = "git"
 PRUSS_LLD_GIT_BRANCH = "master"
 PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
 
-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.06A"
-PRUSS_LLD_SRCREV = "b98729cc1fc26c9ac32846146892646a23c28adb"
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.07"
+PRUSS_LLD_SRCREV = "636bb5645014723c54c08245cf8c2ee401eceb4f"
 
 BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
 SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PRUSS_LLD_SRCREV}"
-PV = "01.00.00.06A"
+PV = "01.00.00.07"
 INC_PR = "r0"
-- 
1.9.1


