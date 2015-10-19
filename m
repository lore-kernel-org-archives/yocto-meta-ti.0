Return-Path: <sam.nelson@TI.COM>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DED53E0049B; Mon, 19 Oct 2015 12:34:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 314CDE00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:34:10 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJY9ZZ017652
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:34:09 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJY9A8028059
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:34:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:34:09 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJY9hd001076;	Mon, 19 Oct 2015 14:34:09 -0500
From: Sam Nelson <sam.nelson@TI.COM>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:34:08 -0400
Message-ID: <1445283248-9487-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] nwal-lld: Update to new version 2.1.0.8
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
X-List-Received-Date: Mon, 19 Oct 2015 19:34:10 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/nwal-lld/nwal-lld.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 2cdc9aa..247bfc0 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -6,9 +6,9 @@ COMPATIBLE_MACHINE = "keystone"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git;protocol=git;branch=${BRANCH}"
 
-# Below commit ID corresponds to "DEV.NWAL.02.01.00.06"
-SRCREV = "a3494c9aaa2808f438d26b2c3b8b091448ffc445"
-PV = "02.01.00.06"
+# Below commit ID corresponds to "DEV.NWAL.02.01.00.08"
+SRCREV = "e6df99e59a848c7afffe90fc9710b7dcb8067c31"
+PV = "02.01.00.08"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"
-- 
1.7.9.5


