Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68D44E008D0; Mon,  3 Nov 2014 18:00:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 458CDE0087C
	for <meta-ti@yoctoproject.org>; Mon,  3 Nov 2014 18:00:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9AED452A66; Tue,  4 Nov 2014 02:00:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141104020032.9AED452A66@arago-project.org>
Date: Tue,  4 Nov 2014 02:00:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : dra7xx: add "mmip" to MACHINE_FEATURES
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
X-List-Received-Date: Tue, 04 Nov 2014 02:00:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 733cf9f484a7593e997b7d69b9f028108b94985a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=733cf9f484a7593e997b7d69b9f028108b94985a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov  3 20:38:41 2014 -0500

dra7xx: add "mmip" to MACHINE_FEATURES

This reverts commit ae064c55f3da416df7e37db3c339834ef13656ac.

---

 conf/machine/include/dra7xx.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
index 857e1b3..a7c8782 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,4 +1,4 @@
 require conf/machine/include/omap-a15.inc
 SOC_FAMILY_append = ":dra7xx"
 
-MACHINE_FEATURES += "pci"
+MACHINE_FEATURES += "pci mmip"


