Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85C06E00C97; Tue, 18 Jul 2017 16:04:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 543ABE00CBB
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4nTl007576
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419089;
	bh=f/a8+V0s2US2cxNdQUXLvRNEK3e63wZsEZOh7Z4UqaA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q8pVfo2P3m0xNK7YpDAnzOS8wxqPL2/G2GCxuScStwqalG4z58pCFt/3HIOTi9TFP
	U7cvR6Y13hKbWreZ0JIjhreOlyIW1736df5jrq0KH1IwgSnjplJhI0zEwyGEQLXqoe
	Dz3xYVWDRbq57wbMgsZN+RFuXmGgTW8O39Zz0dqs=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4mHI032425
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:48 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46i0000997;	Tue, 18 Jul 2017 18:04:48 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:38 -0400
Message-ID: <1500419028-3361-27-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 27/37] pruss-lld: Add rtos recipe & update the version to 1.0.0.7
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:59 -0000
Content-Type: text/plain

Upstreaming the RTOS low level driver of the PRUSS module & updating to
the latest version
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

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
index 8620108..1f1bfc5 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://pruicss.h;beginline=1;endline=31;md5=315177aa03d58bcd124a6e799e2bd458"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g-evm|k2g-hs-evm"
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


