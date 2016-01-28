Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2BE6E00AF2; Thu, 28 Jan 2016 06:41:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 865F9E009C3
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 06:41:15 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SEfEpv018705
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SEfEC3018725
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:14 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 08:41:14 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0SEfDlD029208;	Thu, 28 Jan 2016 08:41:14 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Jan 2016 09:41:04 -0500
Message-ID: <1453992071-23149-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
References: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] iqn2-lld: Upgrade to version 1.0.0.10
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
X-List-Received-Date: Thu, 28 Jan 2016 14:41:17 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index 4a43a26..1d99d41 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -6,15 +6,15 @@ IQN2_LLD_GIT_PROTOCOL = "git"
 IQN2_LLD_GIT_BRANCH = "master"
 IQN2_LLD_GIT_DESTSUFFIX = "git/ti/drv/iqn2"
 
-# Following commit corresponds to DEV.IQN_LLD.01.00.00.08F
-IQN2_LLD_SRCREV = "29d5358b944f1447c024263f86e8c71784440b99"
+# Following commit corresponds to DEV.IQN_LLD.01.00.00.10
+IQN2_LLD_SRCREV = "dfc6bdd3b397b58e234f74eadda6d79ee399e682"
 
 BRANCH = "${IQN2_LLD_GIT_BRANCH}"
 SRC_URI = "${IQN2_LLD_GIT_URI};destsuffix=${IQN2_LLD_GIT_DESTSUFFIX};protocol=${IQN2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${IQN2_LLD_SRCREV}"
 
-PV = "1.0.0.8"
-INC_PR = "r1"
+PV = "1.0.0.10"
+INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 
-- 
1.9.1


