Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D02F1E01471
	for <meta-ti@yoctoproject.org>; Wed, 10 Apr 2013 14:51:52 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3ALpo0f026004
	for <meta-ti@yoctoproject.org>; Wed, 10 Apr 2013 16:51:51 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALpnVA010398
	for <meta-ti@yoctoproject.org>; Thu, 11 Apr 2013 03:21:50 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Apr 2013 03:21:49 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALpjgq006205;
	Thu, 11 Apr 2013 03:21:47 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 10 Apr 2013 16:51:43 -0500
Message-ID: <1365630704-7324-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] setup-defconfig: allow using KERNEL_LOCALVERSION
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
X-List-Received-Date: Wed, 10 Apr 2013 21:51:53 -0000
Content-Type: text/plain

* Add capability to use KERNEL_LOCALVERSION to set an extra
  version string in the kernel.  This mimics functionality
  submitted to the kernel.bbclass but since this overwrites
  the do_configure it must be added here as well.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/setup-defconfig.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index fc5e18e..ed3bce2 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -1,3 +1,7 @@
+# KERNEL_LOCALVERSION can be set to add a tag to the end of the
+# kernel version string.  such as the commit id
+KERNEL_LOCALVERSION ?= ""
+
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
 
@@ -16,6 +20,8 @@ do_setup_defconfig() {
 #   3. else run yes '' | oe_runmake oldconfig like the default do_configure
 #      does
 do_configure() {
+    echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+    echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
     config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
     if [ "x${config}" != "x" ]
     then
-- 
1.7.0.4


