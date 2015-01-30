Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92DD2E00873; Fri, 30 Jan 2015 14:43:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39136E00546
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 14:43:03 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMh2i9016378
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 16:43:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMh1ip032306
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 16:43:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 16:43:01 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UMh0JS022713;	Fri, 30 Jan 2015 16:43:01 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0UMgw9P009543;	Sat, 31 Jan 2015 04:12:58 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 30 Jan 2015 16:42:56 -0600
Message-ID: <1422657776-16399-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] sitara-linux-ti-staging_3.14.bb: Update commit to pull in suspend/standby fix
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
X-List-Received-Date: Fri, 30 Jan 2015 22:43:08 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2:
Bump PR

 .../linux/sitara-linux-ti-staging_3.14.bb          |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
index f9c4641..8cd2c3f 100644
--- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
@@ -35,11 +35,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "sitara-ti-linux-3.14.y"
 
-SRCREV = "2d7148a3a95a2811604611f6c66a8826a61b8b12"
+SRCREV = "99b50bfb0f3fb0e43de31a6735989d31660b0835"
 PV = "3.14.26"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
-- 
1.7.9.5


