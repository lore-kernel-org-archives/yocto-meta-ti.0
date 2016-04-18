Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 391F0E00D6D; Mon, 18 Apr 2016 08:31:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 763B4E00C44
	for <meta-ti@yoctoproject.org>; Mon, 18 Apr 2016 08:31:08 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C0C33529DB; Mon, 18 Apr 2016 15:31:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160418153107.C0C33529DB@arago-project.org>
Date: Mon, 18 Apr 2016 15:31:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-softhsmv2: stop altering and expanding SELECTED_OPTIMIZATION variable
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
X-List-Received-Date: Mon, 18 Apr 2016 15:31:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f7e2920ba3e5d493120d992b366fb0ad382af971
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f7e2920ba3e5d493120d992b366fb0ad382af971

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Apr 18 21:28:48 2016 +0000

ti-softhsmv2: stop altering and expanding SELECTED_OPTIMIZATION variable

This var now contains staging paths and by expanding it early, sstate ends up
churning the package for each machine built.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index a863c3a..ea2eb3f 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=
 #Following commit corresponds to tag DEV.SOFTHSM-01.03.00.04
 SRCREV = "c2688afb9373309751e640088705cb739997665d"
 PV = "1.3.0.4"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
@@ -31,9 +32,6 @@ INITSCRIPT_PARAMS = "defaults 10"
 
 inherit update-rc.d
 
-SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-O2", "-O3")}"
-SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-ggdb2", "")}"
-
 FILES_${PN} += "${libdir}/softhsm/lib*.so.* ${mntdir}/*"
 FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
 FILES_${PN}-staticdev += "${libdir}/softhsm/*.a "


