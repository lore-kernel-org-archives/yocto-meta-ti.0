Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FA60E00F25; Tue, 12 Jul 2016 06:24:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3986EE00F1A
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 06:24:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6CDOMhc005718
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 08:24:22 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6CDOMbk016832
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 08:24:22 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 12 Jul 2016 08:24:21 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6CDOL5V015898;	Tue, 12 Jul 2016 08:24:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 12 Jul 2016 09:23:44 -0400
Message-ID: <1468329824-28489-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] hplib: bump SRCREV to version 1.1.0.8
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
X-List-Received-Date: Tue, 12 Jul 2016 13:24:29 -0000
Content-Type: text/plain

* added performance improvement in find_slots routine to skip full bit
  map words in search

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/hplib/hplib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index aff38c9..fcc7191 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -9,12 +9,12 @@ HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
 HPLIB_GIT_PROTOCOL = "git"
 HPLIB_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.07"
-HPLIB_SRCREV = "74dde26bfcdeb248fae29eb883ac78db89263f9f"
+# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.08"
+HPLIB_SRCREV = "5e9b27854f5d6f9f37a0ed8d7516d4874427cd8b"
 
 BRANCH = "${HPLIB_GIT_BRANCH}"
 SRC_URI = "${HPLIB_GIT_URI};protocol=${HPLIB_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${HPLIB_SRCREV}"
 
-PV = "01.01.00.07+git${SRCPV}"
+PV = "01.01.00.08+git${SRCPV}"
 INC_PR = "r0"
-- 
2.7.4


