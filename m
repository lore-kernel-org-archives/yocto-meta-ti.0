Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 348AEE00C95; Tue, 18 Jul 2017 16:04:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 983ADE00C82
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:32 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4WA8007547
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419072;
	bh=oR3kTJOhp/yL5blRH3+AxNuX9px3q7RxdBno7VTn6T4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GB+An3hv6ADHzIANJ5Zt76FDI3iAU2Cifu9AxLsivRQraYHdLlXAhN9Y1WfyoWPsg
	vClWc/6gjtRRFmwc+NiL38SVkIOz5iT2F/W0ua+icHpI3DkBZYl9TSOg9E8rCroSew
	rhAlioNrss7vsD/JJOtT+pRmNGa8yvRvgcAHoZ48=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4WWo031935
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:32 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hl000997;	Tue, 18 Jul 2017 18:04:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:25 -0400
Message-ID: <1500419028-3361-14-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 14/37] profiling-rtos: Add rtos recipe for profiling
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:41 -0000
Content-Type: text/plain

Upstreaming RTOS recipe for profiling utilties

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary and merged in to a single recipe

 recipes-bsp/utils-rtos/profiling-rtos_git.bb | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-bsp/utils-rtos/profiling-rtos_git.bb

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
new file mode 100644
index 0000000..2afbef9
--- /dev/null
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "TI RTOS profiling utilities"
+
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


