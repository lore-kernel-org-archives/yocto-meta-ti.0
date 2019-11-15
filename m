Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62C6EE00F67; Fri, 15 Nov 2019 07:34:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E32DEE00E85
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:23 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYNUY045799
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832063;
	bh=M1SPLsYCY4i+dCJIBOOS3iR+oHfaTu08jc/EqFv0tb8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=toTCbME31IpyvwSZCOyDF+VjbpbEGlbI4HEtFlQlfpPP++4n5s0Wb+xEgn1C1APl3
	zKpBmsnlORb3oaVZY9x3vIJGeBgH0A6L6VQovJkoTzuPRirDxVXYGYskuLD7Kjv9T9
	1bHGkatc4749/YD/YYYWN4fgMQISfzFOqHA/sq1c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYNGM010666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:23 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:23 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBg0041975;
	Fri, 15 Nov 2019 09:34:22 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:58 -0500
Message-ID: <1573830902-17409-39-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 38/42] utils-rtos: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:27 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb | 18 +++++-------------
 recipes-bsp/utils-rtos/trace-rtos_git.bb     | 18 +++++-------------
 2 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
index 134a0f9..9846804 100644
--- a/recipes-bsp/utils-rtos/profiling-rtos_git.bb
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
@@ -1,6 +1,10 @@
 SUMMARY = "TI RTOS profiling utilities"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.utils.profiling"
+
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://profilingver.h;beginline=1;endline=46;md5=974494ad60f33cfc0340e421c5a5a7a0"
@@ -8,21 +12,9 @@ LIC_FILES_CHKSUM = "file://profilingver.h;beginline=1;endline=46;md5=974494ad60f
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PROFILING_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
-PROFILING_GIT_PROTOCOL = "git"
-PROFILING_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.UTILS.01.00.00.10"
-PROFILING_SRCREV = "dbd2683d80326165d078282b1ef7dce44667e972"
-
-BRANCH = "${PROFILING_GIT_BRANCH}"
-SRC_URI = "${PROFILING_GIT_URI};protocol=${PROFILING_GIT_PROTOCOL};branch=${BRANCH}"
 
-SRCREV = "${PROFILING_SRCREV}"
-PV = "01.00.00.10"
 PR = "r0"
 
-S = "${WORKDIR}/git/profiling"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
diff --git a/recipes-bsp/utils-rtos/trace-rtos_git.bb b/recipes-bsp/utils-rtos/trace-rtos_git.bb
index 48b3bf2..249ffc7 100644
--- a/recipes-bsp/utils-rtos/trace-rtos_git.bb
+++ b/recipes-bsp/utils-rtos/trace-rtos_git.bb
@@ -2,7 +2,11 @@ SUMMARY = "TI RTOS Trace utility"
 
 DESCRIPTION = "This utility allows for tracing support in PDK drivers"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.utils.trace"
+
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://tracever.h;beginline=19;endline=47;md5=983f531ecfc9fc8c4bc3af9333ab6696"
@@ -10,21 +14,9 @@ LIC_FILES_CHKSUM = "file://tracever.h;beginline=19;endline=47;md5=983f531ecfc9fc
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TRACE_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
-TRACE_GIT_PROTOCOL = "git"
-TRACE_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.UTILS.01.00.00.09"
-TRACE_SRCREV = "84802d7a787a53f33a24254069c90208c5d87d1e"
-
-BRANCH = "${TRACE_GIT_BRANCH}"
-SRC_URI = "${TRACE_GIT_URI};protocol=${TRACE_GIT_PROTOCOL};branch=${BRANCH}"
 
-SRCREV = "${TRACE_SRCREV}"
-PV = "01.00.00.09"
 PR = "r0"
 
-S = "${WORKDIR}/git/trace"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
-- 
2.7.4


