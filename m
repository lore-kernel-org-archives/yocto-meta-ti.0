Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3F8FE0097F; Fri,  4 Dec 2015 13:20:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEE6BE00948
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 13:20:26 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4LKP1X018220
	for <meta-ti@yoctoproject.org>; Fri, 4 Dec 2015 15:20:25 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4LKP3X032150
	for <meta-ti@yoctoproject.org>; Fri, 4 Dec 2015 15:20:25 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 15:20:24 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB4LKOAC014802;	Fri, 4 Dec 2015 15:20:24 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 4 Dec 2015 16:20:23 -0500
Message-ID: <1449264023-1540-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Update to new version 3.41.00.06_eng
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
X-List-Received-Date: Fri, 04 Dec 2015 21:20:29 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index d41796d..b29ac5b 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,11 +8,11 @@ BRANCH = "ipc-next"
 
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
 
-#Corresponds to 3.41.00.03_eng
-SRCREV = "354db7d3b6aa397e6ab4b86fdbd312746fd46a07"
+#Corresponds to 3.41.00.06_eng
+SRCREV = "795af8b9cec28bd6cdd1f00df1b9084b2a285cce"
 
 S = "${WORKDIR}/git"
-PV = "3.41.00.03"
+PV = "3.41.00.06"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


