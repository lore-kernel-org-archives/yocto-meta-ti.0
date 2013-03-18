Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1ACA7E01465
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 11:41:01 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV002UHD7W6LF2@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 13:40:45 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B9126200DD; Mon,
	18 Mar 2013 14:40:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 14:40:39 -0400
Message-id: <1363632040-22025-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363632040-22025-1-git-send-email-denis@denix.org>
References: <1363632040-22025-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] am335x, beaglebone: switch default preference to ti-staging tree
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
X-List-Received-Date: Mon, 18 Mar 2013 18:41:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

SDKs or other users of meta-ti can still use one of the older 3.2 recipes for
stability or featureset, by setting PREFERRED_PROVIDER in distro or local config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf | 2 +-
 conf/machine/beaglebone.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 91f7e54..77dbced 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -13,7 +13,7 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index f4112f5..005858f 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -7,7 +7,7 @@ require conf/machine/include/ti33x.inc
 # Only has DVI connector for external screen
 GUI_MACHINE_CLASS = "bigscreen"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 
 IMAGE_FSTYPES += "tar.gz"
 
-- 
1.8.1.5


