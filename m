Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4010BE006C2
	for <meta-ti@yoctoproject.org>; Wed,  5 Jun 2013 11:13:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r55IDapv031336
	for <meta-ti@yoctoproject.org>; Wed, 5 Jun 2013 13:13:36 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r55IDaDH027744
	for <meta-ti@yoctoproject.org>; Wed, 5 Jun 2013 13:13:36 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Jun 2013 13:13:36 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r55IDXbu016363;
	Wed, 5 Jun 2013 13:13:34 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Jun 2013 13:19:48 -0500
Message-ID: <1370456388-24777-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] linux-ti-staging: update kernel SRCREV
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
X-List-Received-Date: Wed, 05 Jun 2013 18:13:37 -0000
Content-Type: text/plain

* Update the kernel SRCREV to pickup DSS fixes for the dra7xx
  devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index f62cbe2..39f0e31 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -27,11 +27,11 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.8.y"
 
 # This commit corresponds to ti2013.04.00 release tag
-SRCREV = "54d80897fd69e30702f3b6f115d77d37ad78f9ef"
+SRCREV = "e7460f2acdea5c9b766c7eb76bad5ab2ed7e566c"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
1.7.0.4


