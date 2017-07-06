Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DE94E00BD5; Thu,  6 Jul 2017 15:06:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14F78E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:06:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66M6rlJ022871
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499378813;
	bh=MCQtqPGkhmaq48mu1otyDOXihkCqFA5bpKSd9vjMud4=;
	h=From:To:CC:Subject:Date;
	b=D6G+N9tiZyjqB1v48nz9HDjlo/g0k9InZzzAZ6payV7GU0/lPxqIdjKlJSu8XUsiS
	94b5zqUMyuKJ9uz1ErDgQT2T2Syn+i8+736bfkgMIQW6aDbAuSqdcg0RvFoBTFhy+S
	UbttJ906KPSZz9wtfvFW4AcSFrxJHGKNyNHVafMQ=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66M6r5Y014464
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:06:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:06:52 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66M6qoO009364;	Thu, 6 Jul 2017 17:06:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:06:50 -0400
Message-ID: <1499378810-55974-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] fatfs-rtos: Added fatfs recipe for rtos
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
X-List-Received-Date: Thu, 06 Jul 2017 22:06:56 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb

diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
new file mode 100644
index 0000000..6dccf01
--- /dev/null
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
@@ -0,0 +1,32 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://FATFS.h;beginline=1;endline=32;md5=6619832755598d1cc2b01f2e6a1801d6"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FATFS_GIT_URI = "git://git.ti.com/keystone-rtos/fatfs.git"
+FATFS_GIT_PROTOCOL = "git"
+FATFS_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.06A"
+FATFS_SRCREV = "7cb9e45da11cd3c60fe48c38c9dcdaa6e49a8276"
+
+BRANCH ="${FATFS_GIT_BRANCH}"
+SRC_URI = "${FATFS_GIT_URI};protocol=${FATFS_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${FATFS_SRCREV}"
+PV = "01.00.00.06A"
+PR = "r0"
+
+DEPENDS_append = " mmcsd-lld-rtos \
+"
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_FATFS_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "FATFS Library"
-- 
1.9.1


