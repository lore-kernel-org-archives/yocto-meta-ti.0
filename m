Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F409E013DB
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 23:22:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3EB1A52A60; Fri, 23 Mar 2012 06:22:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120323062218.3EB1A52A60@arago-project.org>
Date: Fri, 23 Mar 2012 06:22:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omap4: remove D_P = "-1" as it's the only kernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 06:22:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0a92342b2970ad99ede78acae84060e6259017f5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0a92342b2970ad99ede78acae84060e6259017f5

Author: Denys Dmytriyenko <denis@denix.org>
Date:   Thu Mar 22 23:26:07 2012 -0400

linux-omap4: remove D_P = "-1" as it's the only kernel

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-omap4_3.1.0.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-omap4_3.1.0.bb b/recipes-kernel/linux/linux-omap4_3.1.0.bb
index 3cc48be..c57d034 100644
--- a/recipes-kernel/linux/linux-omap4_3.1.0.bb
+++ b/recipes-kernel/linux/linux-omap4_3.1.0.bb
@@ -1,7 +1,5 @@
 COMPATIBLE_MACHINE = "pandaboard"
 
-DEFAULT_PREFERENCE = "-1"
-
 require linux.inc
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap4 see conf/machine/include/omap4.inc


