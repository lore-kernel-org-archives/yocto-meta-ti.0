Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10AACE00E3A; Thu,  7 Nov 2019 10:10:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87B95E00E1E
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:58 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9vrB106957
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150198;
	bh=wPM2v2F4d8MPaL2FpCUAlHKgSCEtCbcOup92bF7olsI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pDAKjS6k6QVDQLiKMxkdaz1+v/QOsndz4bgwHaeLqIVyJe9Py6LkYpzDEz6h3TR6w
	8G/jF4QCeNJS10O5IP7iM5wgse+GSsuXKdjiQG/9N3Vlzthu5H40YbpuT1cb97in7O
	OoU++9xGDG4ZLPkQzAPrOxSFfVYM5fMVH6eM2yU0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9vS7071271
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:57 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:42 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIi067418;
	Thu, 7 Nov 2019 12:09:57 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:33 -0500
Message-ID: <1573149037-762-39-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 38/42] utils-rtos: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:10:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb | 16 +++-------------
 recipes-bsp/utils-rtos/trace-rtos_git.bb     | 16 +++-------------
 2 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
index 134a0f9..27a4f45 100644
--- a/recipes-bsp/utils-rtos/profiling-rtos_git.bb
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS profiling utilities"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://profilingver.h;beginline=1;endline=46;md5=974494ad60f33cfc0340e421c5a5a7a0"
@@ -8,21 +9,9 @@ LIC_FILES_CHKSUM = "file://profilingver.h;beginline=1;endline=46;md5=974494ad60f
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PROFILING_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
-PROFILING_GIT_PROTOCOL = "git"
-PROFILING_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UTILS.01.00.00.10"
-PROFILING_SRCREV = "dbd2683d80326165d078282b1ef7dce44667e972"
-
-BRANCH = "${PROFILING_GIT_BRANCH}"
-SRC_URI = "${PROFILING_GIT_URI};protocol=${PROFILING_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${PROFILING_SRCREV}"
-PV = "01.00.00.10"
 PR = "r0"
 
-S = "${WORKDIR}/git/profiling"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
@@ -32,3 +21,4 @@ export DEST_ROOT="${S}"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "Profiling Utility Library"
+TI_PDK_COMP = "ti.utils.profiling"
diff --git a/recipes-bsp/utils-rtos/trace-rtos_git.bb b/recipes-bsp/utils-rtos/trace-rtos_git.bb
index 48b3bf2..c63bc17 100644
--- a/recipes-bsp/utils-rtos/trace-rtos_git.bb
+++ b/recipes-bsp/utils-rtos/trace-rtos_git.bb
@@ -2,7 +2,8 @@ SUMMARY = "TI RTOS Trace utility"
 
 DESCRIPTION = "This utility allows for tracing support in PDK drivers"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://tracever.h;beginline=19;endline=47;md5=983f531ecfc9fc8c4bc3af9333ab6696"
@@ -10,21 +11,9 @@ LIC_FILES_CHKSUM = "file://tracever.h;beginline=19;endline=47;md5=983f531ecfc9fc
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TRACE_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
-TRACE_GIT_PROTOCOL = "git"
-TRACE_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UTILS.01.00.00.09"
-TRACE_SRCREV = "84802d7a787a53f33a24254069c90208c5d87d1e"
-
-BRANCH = "${TRACE_GIT_BRANCH}"
-SRC_URI = "${TRACE_GIT_URI};protocol=${TRACE_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${TRACE_SRCREV}"
-PV = "01.00.00.09"
 PR = "r0"
 
-S = "${WORKDIR}/git/trace"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
@@ -34,3 +23,4 @@ export DEST_ROOT="${S}"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "Trace Utility"
+TI_PDK_COMP = "ti.utils.trace"
-- 
2.7.4


