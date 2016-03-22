Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F19FE006CA; Tue, 22 Mar 2016 09:42:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 392C6E0048B
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 09:42:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2MGglul028156
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 11:42:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2MGgl6T021566
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 11:42:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Mar 2016 11:42:47 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2MGglrf015115;	Tue, 22 Mar 2016 11:42:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 22 Mar 2016 12:42:43 -0400
Message-ID: <1458664963-27853-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] hplib: Upgrade to version 1.1.0.7
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
X-List-Received-Date: Tue, 22 Mar 2016 16:42:53 -0000
Content-Type: text/plain

* This version includes the following changes
  - Port to the 4.1 kernel
  - Fix the test linker options

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/hplib/hplib.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index e5fe567..aff38c9 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -9,12 +9,12 @@ HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
 HPLIB_GIT_PROTOCOL = "git"
 HPLIB_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.06"
-HPLIB_SRCREV = "1cbe6a41926c131d9cab63b40d43807c6e56e2fd"
+# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.07"
+HPLIB_SRCREV = "74dde26bfcdeb248fae29eb883ac78db89263f9f"
 
 BRANCH = "${HPLIB_GIT_BRANCH}"
 SRC_URI = "${HPLIB_GIT_URI};protocol=${HPLIB_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${HPLIB_SRCREV}"
 
-PV = "01.01.00.06+git${SRCPV}"
-INC_PR = "r1"
+PV = "01.01.00.07+git${SRCPV}"
+INC_PR = "r0"
-- 
1.9.1


