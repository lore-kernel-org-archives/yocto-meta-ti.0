Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79261E00566; Tue,  9 Sep 2014 19:30:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1FA9E0054C
	for <meta-ti@yoctoproject.org>; Tue,  9 Sep 2014 19:30:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBN00LNGYY9VMK0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 09 Sep 2014 21:30:25 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B42E220086; Tue,
	09 Sep 2014 22:30:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 09 Sep 2014 22:30:09 -0400
Message-id: <1410316209-7539-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] dra7xx: add "pci" to MACHINE_FEATURES
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
X-List-Received-Date: Wed, 10 Sep 2014 02:30:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/dra7xx.inc   | 2 ++
 conf/machine/include/omap-a15.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
index fd0ecfe..857e1b3 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,2 +1,4 @@
 require conf/machine/include/omap-a15.inc
 SOC_FAMILY_append = ":dra7xx"
+
+MACHINE_FEATURES += "pci"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index d7ddb62..3654c3a 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -5,7 +5,7 @@ DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r5"
+MACHINE_KERNEL_PR = "r6"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
-- 
2.0.4


