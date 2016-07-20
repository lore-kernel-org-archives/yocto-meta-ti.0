Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85254E00D03; Tue, 19 Jul 2016 18:42:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9118E00CE8
	for <meta-ti@yoctoproject.org>; Tue, 19 Jul 2016 18:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9FF4D52AB2; Wed, 20 Jul 2016 01:42:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160720014224.9FF4D52AB2@arago-project.org>
Date: Wed, 20 Jul 2016 01:42:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : hplib: bump SRCREV to version 1.1.0.8
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
X-List-Received-Date: Wed, 20 Jul 2016 01:42:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 93a60d991dec6cfb80b0cdeeaaecbb034a7ab45a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=93a60d991dec6cfb80b0cdeeaaecbb034a7ab45a

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Jul 12 19:23:44 2016 +0000

hplib: bump SRCREV to version 1.1.0.8

* added performance improvement in find_slots routine to skip full bit
  map words in search

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hplib/hplib.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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


