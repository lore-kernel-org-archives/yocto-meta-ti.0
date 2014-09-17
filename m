Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7BD1DE00853; Wed, 17 Sep 2014 13:57:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C659DE007AA
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 13:56:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8HKuwwd021714
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 15:56:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8HKuwFN013493
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 15:56:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 17 Sep 2014 15:56:58 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8HKuwaK011791;
	Wed, 17 Sep 2014 15:56:58 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1XUMHZ-0002vm-SC; Wed, 17 Sep 2014 16:56:57 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 17 Sep 2014 16:56:56 -0400
Message-ID: <1410987416-11236-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [Boot Monitor secure device 1/2] boot monitor: un-comment out commands to print sec block size
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
X-List-Received-Date: Wed, 17 Sep 2014 20:57:07 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 Docs/mksecuboot |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Docs/mksecuboot b/Docs/mksecuboot
index 22cc6bb..c99926e 100755
--- a/Docs/mksecuboot
+++ b/Docs/mksecuboot
@@ -59,7 +59,7 @@ $SECBIN -i $SEC_UBOOT_IMAGE \
 	-r $KEYPATH/privkey.pem \
 	-o $SIGNED_UBOOT_BM
 
-#echo -n "BM sec block size: ";
-#stat -c%s $BM_SEC_BLOCK;
+echo -n "BM sec block size: ";
+stat -c%s $BM_SEC_BLOCK;
 
 
-- 
1.7.9.5


