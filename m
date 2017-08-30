Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2171FE00970; Wed, 30 Aug 2017 13:45:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED201E008C8
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 13:45:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UKirDB019381
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 15:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504125893;
	bh=UZN4LItsuhKGFzyt3GRWPqo53aQg7Njk8S9ayTHIm1U=;
	h=From:To:Subject:Date;
	b=Vpt78h6CeTuhcdmy3oiDqy6iqDwzqi5v4ij0vrGN5RoGejPpOzb6A1HLNtboVCybF
	8N7ubMrRyYe7WgOODNuaIga+Qn7DJBapiwbkJNnLEpdSzxxw466cN02hBLM0BebYxX
	SOnbfqYD4txyNJHSkqJN6xr3w8S5kHR2E+2EiGTo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UKimaP032759
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 15:44:48 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 15:44:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 15:44:48 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UKimQB025060
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 15:44:48 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 30 Aug 2017 15:44:48 -0500
Message-ID: <1504125888-21711-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] wdtimer-rtos: added recipe for wdtimer
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
X-List-Received-Date: Wed, 30 Aug 2017 20:45:06 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-bsp/wdtimer/wdtimer-rtos_git.bb

diff --git a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
new file mode 100644
index 0000000..5e23dbd
--- /dev/null
+++ b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Watchdog Timer (wdtimer) test example"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://WatchdogTimer.xdc;beginline=1;endline=31;md5=837fb1761f89c7671e79bd5992bcf9e4"
+
+inherit ti-pdk
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+WATCHDOG_TIMER_GIT_URI = "git://git.ti.com/keystone-rtos/wdtimer.git"
+WATCHDOG_TIMER_GIT_PROTOCOL = "git"
+WATCHDOG_TIMER_GIT_BRANCH = "master"
+WATCHDOG_TIMER_GIT_DESTSUFFIX = "git/ti/instrumentation/wdtimer"
+
+# Below commit ID corresponds to "DEV.WDTIMER.01.00.00.03"
+WATCHDOG_TIMER_SRCREV = "db973cf8d71460537e2738af0ff094becc7ac454"
+
+BRANCH = "${WATCHDOG_TIMER_GIT_BRANCH}"
+SRC_URI = "${WATCHDOG_TIMER_GIT_URI};destsuffix=${WATCHDOG_TIMER_GIT_DESTSUFFIX};protocol=${WATCHDOG_TIMER_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${WATCHDOG_TIMER_SRCREV}"
+PV = "01.00.00.03"
+PR = "r0"
+
+S = "${WORKDIR}/git/ti/instrumentation/wdtimer"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "Watchdog Timer"
-- 
1.9.1


