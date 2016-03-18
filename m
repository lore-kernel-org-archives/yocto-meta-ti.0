Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66AC5E00C70; Fri, 18 Mar 2016 05:49:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26048E00C6B
	for <meta-ti@yoctoproject.org>; Fri, 18 Mar 2016 05:49:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2ICnWIC005070
	for <meta-ti@yoctoproject.org>; Fri, 18 Mar 2016 07:49:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2ICnWa3014684
	for <meta-ti@yoctoproject.org>; Fri, 18 Mar 2016 07:49:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Mar 2016 07:49:32 -0500
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2ICnVt3031256;	Fri, 18 Mar 2016 07:49:31 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 18 Mar 2016 08:49:30 -0400
Message-ID: <1458305370-30628-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] srio-lld-test: Add explicit dependency on uio-module-drv
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
X-List-Received-Date: Fri, 18 Mar 2016 12:49:38 -0000
Content-Type: text/plain

Test code uses uio driver for mapping peripheral registers and hence the
addition of dependency.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/srio-lld/srio-lld-test_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
index 6495a12..d2a0068 100644
--- a/recipes-bsp/srio-lld/srio-lld-test_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld-test_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI SRIO peripheral low level driver unit test and example binaries"
-DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem"
+DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem uio-module-drv"
 
 include srio-lld.inc
 
-- 
1.9.1


