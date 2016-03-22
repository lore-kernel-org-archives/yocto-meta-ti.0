Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F3C1E008B4; Tue, 22 Mar 2016 12:14:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F9A9E008C1
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 12:14:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7CC6E52AE2; Tue, 22 Mar 2016 19:14:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160322191437.7CC6E52AE2@arago-project.org>
Date: Tue, 22 Mar 2016 19:14:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : hplib: Upgrade to version 1.1.0.7
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
X-List-Received-Date: Tue, 22 Mar 2016 19:14:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f0692b8a7c125e09b79ec411a045275e910e79b8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f0692b8a7c125e09b79ec411a045275e910e79b8

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Mar 22 22:42:43 2016 +0000

hplib: Upgrade to version 1.1.0.7

* This version includes the following changes
  - Port to the 4.1 kernel
  - Fix the test linker options

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hplib/hplib.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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


