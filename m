Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA302E00957; Mon, 29 Jun 2015 09:56:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7987AE006C6
	for <meta-ti@yoctoproject.org>; Mon, 29 Jun 2015 09:56:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5TGuT23014081
	for <meta-ti@yoctoproject.org>; Mon, 29 Jun 2015 11:56:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5TGuTmr009903
	for <meta-ti@yoctoproject.org>; Mon, 29 Jun 2015 11:56:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 11:56:26 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t5TGuSVA024588;	Mon, 29 Jun 2015 11:56:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Jun 2015 12:56:23 -0400
Message-ID: <1435596983-10163-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] hyplnk-lld: Correct reference to k2l library
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
X-List-Received-Date: Mon, 29 Jun 2015 16:56:35 -0000
Content-Type: text/plain

- Hyperlink module is not present in k2l device.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh b/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
index fb65057..d6795f1 100755
--- a/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
+++ b/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
@@ -28,10 +28,6 @@ case "$compatible" in
 		device=k2hk
 		ln -sf libhyplnk_k2h.so.1.0.0 libhyplnk_device.so.1
 	;;
-	*k2l*)
-		device=k2l
-		ln -sf libhyplnk_k2l.so.1.0.0 libhyplnk_device.so.1
-	;;
 	*k2e*)
 		device=k2e
 		ln -sf libhyplnk_k2e.so.1.0.0 libhyplnk_device.so.1
-- 
1.7.9.5


