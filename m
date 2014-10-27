Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88D30E007C0; Mon, 27 Oct 2014 12:47:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25368E00796
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 12:47:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9RJlBeW000634
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 14:47:11 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9RJlB4w031982
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 14:47:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 27 Oct 2014 14:47:10 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9RJlAkG002524;	Mon, 27 Oct 2014 14:47:10 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Oct 2014 15:47:08 -0400
Message-ID: <1414439229-18776-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] u-boot-keystone: Update to latest tag 2013_01_14.09
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
X-List-Received-Date: Mon, 27 Oct 2014 19:47:19 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index 37f7738..a464d14 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -6,8 +6,8 @@ COMPATIBLE_MACHINE = "keystone"
 
 PR = "r5+gitr${SRCPV}"
 
-# Tag "K2_UBOOT_2013_01_14.05_16"
-SRCREV = "fee500417b989fc9906d86e377b4d3d96033d54e"
+# Tag "K2_UBOOT_2013_01_14.09"
+SRCREV = "f9bc365551ff8c685bf6134d795576713fec0917"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"
-- 
1.7.9.5


