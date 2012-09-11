Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 652C4E00348
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2012 19:07:01 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so5146040obb.35
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2012 19:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=DWEC1flOs1vaK4HvRaYkhhS03rSPMxeruSOC7N4MeyE=;
	b=ZPIlA7V/mQTajoif9AlooLP9yAjJVBVnSxwuyQ5Gm800C/ChCJQRM9t/CarFvuCxz5
	9RMcm/xvJM2UlEfj4zsAak1/xIuktJ81PCVR942n+Y7e8WylyLLyhYFGkrwdJcWha/Qw
	B3W+BnlYA7Bpx+GVUkXVT4nJWJWTm7fz/k6ATFRF4bQEoHr7gSJdqW7PTFCnrGi+3Bha
	kvgz13vnJOKtyzOa4yRti8IWyyjFt0DhAvgT338Ryold/qrZgH4eT6uQUrLUNirxZsB3
	pAJMAfzJPlJbP6gyEzV1+8eOgLaqy9lvNpeHljwHRSb0uPoFohG3p5JhWJfifsu0JraU
	C7oA==
Received: by 10.182.144.104 with SMTP id sl8mr16249918obb.74.1347329220747;
	Mon, 10 Sep 2012 19:07:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ea6sm14922767obc.9.2012.09.10.19.06.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 19:06:59 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon, 10 Sep 2012 21:26:17 -0500
Message-Id: <1347330377-10755-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] am33x-cm3: Don't compile binary
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
X-List-Received-Date: Tue, 11 Sep 2012 02:07:01 -0000

* Building from source needs to be tested. For now use prebuilt binary
  which has been validated.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-bsp/ti/am33x-cm3_git.bb |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 247ba4d..2c65cd1 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -1,17 +1,23 @@
-DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
-
+DESCRIPTION = "Power Management firmware for TI33x Devices"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
-PV = "04.06.00.07"
+COMPATIBLE_MACHINE = "ti33x"
+
+PV = "04.06.00.08"
+PR = "r0"
+
+BRANCH ?= "master"
+
+# This SRCREV corresponds to tag AM335xPSP_04.06.00.08
 SRCREV = "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
 
-SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git"
+SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
 do_compile() {
-	make CC="${TARGET_CC}" CROSS_COMPILE="${TARGET_PREFIX}"
+    :
 }
 
 do_install() {
-- 
1.7.0.4


