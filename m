Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8EA9E00E08; Thu, 28 Apr 2016 12:00:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DF48E00E18
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 12:00:41 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 751B852A97; Thu, 28 Apr 2016 19:00:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160428190039.751B852A97@arago-project.org>
Date: Thu, 28 Apr 2016 19:00:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : vis: prevent sysroot stripping due to DSP firmware
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
X-List-Received-Date: Thu, 28 Apr 2016 19:00:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ca43376a8c0868e356c709571257f47f011c715e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ca43376a8c0868e356c709571257f47f011c715e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Apr 29 00:53:42 2016 +0000

vis: prevent sysroot stripping due to DSP firmware

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/vis-fw/vis_01.50.07.15.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index dfd2f41..5b9834c 100644
--- a/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -32,3 +32,4 @@ FILES_${PN}-fw += "${base_libdir}/firmware/${DSPAPP}"
 INSANE_SKIP_${PN}-fw = "arch"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"


