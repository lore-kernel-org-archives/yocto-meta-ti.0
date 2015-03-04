Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BEFFE00853; Wed,  4 Mar 2015 03:55:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B80E1E0076F
	for <meta-ti@yoctoproject.org>; Wed,  4 Mar 2015 03:55:30 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24BtQug028900
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2015 05:55:26 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24BtPuN014584
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2015 05:55:25 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 05:55:25 -0600
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24BtPSN002388;	Wed, 4 Mar 2015 05:55:25 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 4 Mar 2015 06:55:20 -0500
Message-ID: <1425470120-18627-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] sitara-linux-ti-staging: Update commit to fix touchscreen issues on AM335x SK
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
X-List-Received-Date: Wed, 04 Mar 2015 11:55:40 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../linux/sitara-linux-ti-staging_3.14.bb          |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
index 8cd2c3f..31c1223 100644
--- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
@@ -35,11 +35,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "sitara-ti-linux-3.14.y"
 
-SRCREV = "99b50bfb0f3fb0e43de31a6735989d31660b0835"
+SRCREV = "2489c022b2932432606f897741a71b712e6dbe77"
 PV = "3.14.26"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
-- 
1.7.9.5


