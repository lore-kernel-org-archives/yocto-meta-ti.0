Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 401D3E01206
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 09:02:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C30DB52AB1; Tue,  2 Jul 2013 16:02:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130702160251.C30DB52AB1@arago-project.org>
Date: Tue,  2 Jul 2013 16:02:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-am335x-psp: Update to PSP release 04.06.00.11
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
X-List-Received-Date: Tue, 02 Jul 2013 16:02:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 68c58484abe74377d905dc4407fbe286e2866a37
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=68c58484abe74377d905dc4407fbe286e2866a37

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Thu Jun 27 10:57:30 2013 -0500

linux-am335x-psp: Update to PSP release 04.06.00.11

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-am335x-psp_3.2.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
index f55fc4c..00c4b10 100644
--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
@@ -15,12 +15,11 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
-# SRCREV corresponds to the commit id of tag v3.2_AM335xPSP_04.06.00.10-rc3
-SRCREV = "18ce4a630452348b8308b922491130e8ce1e9134"
+SRCREV = "d5720d33bc7c434f9a023dbb62c795538f976b7a"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-am33x.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


