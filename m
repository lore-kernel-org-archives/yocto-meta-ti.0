Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88558E00B57; Thu,  6 Jul 2017 09:53:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15016E00B57
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:53:13 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66Gr3S4030416
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499359983;
	bh=402x3WfgxPoUSt/5hkbdUOL0y/gl9TmyHptx6CaRaaw=;
	h=From:To:CC:Subject:Date;
	b=XzXEsi99YlgZMKTfuVbvIL/bRS+Y4MloSis1Zu0i+WE86oJ2nk5R460MFftHCqXrg
	/DMvASIXqlNNTLnF2jXuOKWIqIvpgyOUKPiCuAjH+wtD1pwHkwF8VVlnwRWqIUhFkr
	8B2pdX8LXKVV4g29MIh3idgeJUGh09QisLmNoOyU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66GqwiN023600
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:52:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:52:57 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66GqvtU002330;	Thu, 6 Jul 2017 11:52:57 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:52:56 -0400
Message-ID: <1499359976-38171-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] fftc-lld-rtos: Added rtos recipe for fftc-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 16:53:15 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb | 11 +++++++++++
 recipes-bsp/fftc-lld/fftc-lld.inc         | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
 create mode 100644 recipes-bsp/fftc-lld/fftc-lld.inc

diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
new file mode 100644
index 0000000..f3437f3
--- /dev/null
+++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
@@ -0,0 +1,11 @@
+inherit ti-pdk
+require fftc-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append= " qmss-lld-rtos \
+                  cppi-lld-rtos \
+"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "FFTC LLD"
diff --git a/recipes-bsp/fftc-lld/fftc-lld.inc b/recipes-bsp/fftc-lld/fftc-lld.inc
new file mode 100644
index 0000000..0e055b0
--- /dev/null
+++ b/recipes-bsp/fftc-lld/fftc-lld.inc
@@ -0,0 +1,22 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644caf6d30a2b7df"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FFTC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/fftc-lld.git"
+FFTC_LLD_GIT_PROTOCOL = "git"
+FFTC_LLD_GIT_BRANCH = "master"
+FFTC_LLD_GIT_DESTSUFFIX = "git/ti/drv/fftc"
+
+# Below commit ID corresponds to "DEV.FFTC_LLD.02.02.00.06A"
+FFTC_LLD_SRCREV = "96e8839a2de5f15ba8765f4a6a4fd499689c496d"
+
+BRANCH = "${FFTC_LLD_GIT_BRANCH}"
+SRC_URI = "${FFTC_LLD_GIT_URI};destsuffix=${FFTC_LLD_GIT_DESTSUFFIX};protocol=${FFTC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${FFTC_LLD_SRCREV}"
+PV = "02.02.00.06A"
+INC_PR = "r0"
+
+S = "${WORKDIR}/${FFTC_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


