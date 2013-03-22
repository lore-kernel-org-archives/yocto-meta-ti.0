Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B33C3E006D6
	for <meta-ti@yoctoproject.org>; Fri, 22 Mar 2013 12:25:56 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2MJPsW8028993
	for <meta-ti@yoctoproject.org>; Fri, 22 Mar 2013 14:25:55 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2MJPrRC023413
	for <meta-ti@yoctoproject.org>; Sat, 23 Mar 2013 00:55:54 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 23 Mar 2013 00:55:53 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2MJPoFY010587;
	Sat, 23 Mar 2013 00:55:52 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 22 Mar 2013 14:25:47 -0500
Message-ID: <1363980348-22578-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] linux-ti-staging: Update to latest staging kernel
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
X-List-Received-Date: Fri, 22 Mar 2013 19:25:56 -0000
Content-Type: text/plain

* Update to the latest 3.8.4 based staging kernel

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 3ff038d..3dc2001 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -40,8 +40,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "ed93a28fb0b1dc28cc252ee87f6fce3e07bf23fe"
-PV = "3.8.3"
+SRCREV = "a91f8e121dbe0b5fb84000d9ae14fac8880c44a7"
+PV = "3.8.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
-- 
1.7.0.4


