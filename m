Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F40EE006B7
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 23:49:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 10D0852986; Fri, 22 Nov 2013 07:49:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122074947.10D0852986@arago-project.org>
Date: Fri, 22 Nov 2013 07:49:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-glsdk: omap5-sevm DTB no longer exists
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
X-List-Received-Date: Fri, 22 Nov 2013 07:49:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fe468b0dd52f198ea2159265fa1b2dec0d6115b2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fe468b0dd52f198ea2159265fa1b2dec0d6115b2

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov 22 02:46:52 2013 -0500

linux-ti-glsdk: omap5-sevm DTB no longer exists

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index a843272..17bee02 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -9,7 +9,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-KERNEL_DEVICETREE_omap5-evm = "omap5-sevm.dtb omap5-uevm.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
 
 COMPATIBLE_MACHINE = "omap-a15"


