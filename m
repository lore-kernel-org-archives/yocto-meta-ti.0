Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09C9CE0078E; Fri, 10 Oct 2014 12:16:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18D0DE00781
	for <meta-ti@yoctoproject.org>; Fri, 10 Oct 2014 12:16:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 00046529CD; Fri, 10 Oct 2014 19:16:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141010191631.00046529CD@arago-project.org>
Date: Fri, 10 Oct 2014 19:16:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : Revert "dra7xx: add "mmip" to MACHINE_FEATURES"
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
X-List-Received-Date: Fri, 10 Oct 2014 19:16:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: ae064c55f3da416df7e37db3c339834ef13656ac
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ae064c55f3da416df7e37db3c339834ef13656ac

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Oct 10 14:55:44 2014 -0400

Revert "dra7xx: add "mmip" to MACHINE_FEATURES"

Results in gstreamer conflicts in SDK.

This reverts commit 2dce435ff1dc09637d62f59d179fb89c468c0818.

---

 conf/machine/include/dra7xx.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
index a7c8782..857e1b3 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,4 +1,4 @@
 require conf/machine/include/omap-a15.inc
 SOC_FAMILY_append = ":dra7xx"
 
-MACHINE_FEATURES += "pci mmip"
+MACHINE_FEATURES += "pci"


