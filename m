Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4FF0E00B36; Thu, 28 Jan 2016 06:41:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0272E00AB7
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 06:41:15 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SEfF6k012852
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:15 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SEfF6b018728
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 08:41:15 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0SEfDlE029208;	Thu, 28 Jan 2016 08:41:14 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Jan 2016 09:41:05 -0500
Message-ID: <1453992071-23149-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
References: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] mmap-lld: Upgrade to version 2.0.0.6
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
X-List-Received-Date: Thu, 28 Jan 2016 14:41:19 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/mmap-lld/mmap-lld.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index 9a6a4a5..37bd0bd 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -9,14 +9,14 @@ MMAP_LLD_GIT_PROTOCOL = "git"
 MMAP_LLD_GIT_BRANCH = "master"
 MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
 
-# Commit correspond to DEV.MMAP.02.00.00.04
-MMAP_LLD_SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
+# Commit correspond to DEV.MMAP.02.00.00.06
+MMAP_LLD_SRCREV = "70c10fbce809a3ed1cd67c9da2e2a47d3de8f832"
 
 BRANCH="${MMAP_LLD_GIT_BRANCH}"
 SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${MMAP_LLD_SRCREV}"
 
-PV = "2.0.0.4"
-INC_PR = "r4"
+PV = "2.0.0.6"
+INC_PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"
-- 
1.9.1


