Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4ED28E00E0B; Wed, 11 Sep 2019 12:24:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3E23E00E00
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 12:24:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D7DAF40BF9;
	Wed, 11 Sep 2019 19:24:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AYpj6gdUtZQd; Wed, 11 Sep 2019 19:24:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C161140BC4;
	Wed, 11 Sep 2019 19:24:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 79BED173B14;
	Wed, 11 Sep 2019 15:24:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Sep 2019 15:23:52 -0400
Message-Id: <1568229835-30920-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/4] jailhouse: ensure INITRAMFS_IMAGE is initialized, pass full CC var
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
X-List-Received-Date: Wed, 11 Sep 2019 19:24:03 -0000

* If both INITRAMFS_IMAGE and JH_RAMFS_IMAGE are unset, variables fail to
  expand, which leads to dependency errors.
* Passing full CC variable ensure all options are specified, especially
  --sysroot one for internal toolchains.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 0b52ecb..32aecf8 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -58,6 +58,7 @@ JH_SYSCONFIG_CELL ?= ""
 JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
 JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
 
+INITRAMFS_IMAGE ?= ""
 JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
 
 JH_CMDLINE ?= ""
@@ -78,10 +79,8 @@ USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
                     -I../driver'
 
 TOOLS_SRC_DIR = "${S}/tools"
-TOOLS_OBJ_DIR = "${S}/tools"
-
-EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR}"
 
+EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR}"
 
 do_compile() {
 	oe_runmake V=1
-- 
2.7.4


