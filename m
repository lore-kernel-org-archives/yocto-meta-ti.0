Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC535E00BD5; Thu,  6 Jul 2017 15:43:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81573E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:43:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MhB8S020647
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499380991;
	bh=OezzVqAfhSDmqZuag6a6JJP4fODihYFTyKSJxaXlVYw=;
	h=From:To:CC:Subject:Date;
	b=i45J8neJFbSs6BUUGzY4T7ncYgzLp0THLrOd+w8dAUv0+083avGz1q8neQ5iklSow
	tfJtlTPPnOIgnF4meNaJzZhQoJj86+52CF74IaDVY8MZA4qHk4Y3rHEM1+6J40KROv
	vNqR+c0O8uH9hSvhZngA3gzGS3SdjcS+IGpkSjN4=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MhBec029723
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:43:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:43:11 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MhB6H010924;	Thu, 6 Jul 2017 17:43:11 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:43:09 -0400
Message-ID: <1499380989-60628-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] profiling-rtos: Add rtos recipe for profiling
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
X-List-Received-Date: Thu, 06 Jul 2017 22:43:15 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 recipes-bsp/utils-rtos/profiling-rtos_git.bb

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
new file mode 100644
index 0000000..bbb49b4
--- /dev/null
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
@@ -0,0 +1,32 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://profilingver.h;beginline=1;endline=46;md5=974494ad60f33cfc0340e421c5a5a7a0"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROFILING_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
+PROFILING_GIT_PROTOCOL = "git"
+PROFILING_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.UTILS.01.00.00.04"
+PROFILING_SRCREV = "535ee56fcc6a476029d9567df49a5308b866efe4"
+
+BRANCH = "${PROFILING_GIT_BRANCH}"
+SRC_URI = "${PROFILING_GIT_URI};protocol=${PROFILING_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${PROFILING_SRCREV}"
+PV = "01.00.00.04"
+PR = "r0"
+
+S = "${WORKDIR}/git/profiling"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_PROFILING_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "Profiling Utility Library"
-- 
1.9.1


