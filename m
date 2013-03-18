Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BDD0E0147F
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:43:02 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV0013FR7FM583@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:42:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F2B7021926; Mon,
	18 Mar 2013 19:33:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:23 -0400
Message-id: <1363649547-4693-16-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 15/19] keystone: switch default u-boot preference to machine-specific tree
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
X-List-Received-Date: Mon, 18 Mar 2013 23:43:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

SDKs or other users of meta-ti can still use one of the other recipes for
stability or featureset, by setting PREFERRED_PROVIDER in their config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 047cc18..72e71bf 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -4,10 +4,11 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa15.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
+PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r5"
+MACHINE_KERNEL_PR = "r6"
 
 KERNEL_IMAGETYPE = "uImage"
 
-- 
1.8.1.5


