Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80C5AE01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:42:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV00J6IR7F3TJ1@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:42:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8B36C21BEB; Mon,
	18 Mar 2013 19:33:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:26 -0400
Message-id: <1363649547-4693-19-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 18/19] am3517-evm: switch default u-boot preference to machine-specific tree
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
X-List-Received-Date: Mon, 18 Mar 2013 23:42:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

SDKs or other users of meta-ti can still use one of the other recipes for
stability or featureset, by setting PREFERRED_PROVIDER in their config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am3517-evm.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index 0151fe9..097e797 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -17,6 +17,10 @@ USE_VT = "2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
+# Support for am3517 is in the same tree as am33x
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am33x"
+PREFERRED_PROVIDER_u-boot = "u-boot-am33x"
+
 UBOOT_MACHINE = "am3517_evm_config"
 XLOAD_MACHINE = "am3517evm_config"
 
-- 
1.8.1.5


