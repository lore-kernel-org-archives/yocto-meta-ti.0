Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA1EDE00BD5; Mon, 24 Aug 2015 10:56:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06411E00927
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 10:56:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7OHu85m019921
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:56:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7OHu843016309
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:56:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 24 Aug 2015 12:56:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7OHu7a5002948	for
	<meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:56:08 -0500
Resent-From: Denys Dmytriyenko <denys@ti.com>
Resent-Date: Mon, 24 Aug 2015 13:55:52 -0400
Resent-Message-ID: <20150824175552.GS6542@edge>
Resent-To: <meta-ti@yoctoproject.org>
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Aug 2015 13:56:34 -0500
Received: from bangubntigfx (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76IuXC2026992;
	Thu, 6 Aug 2015 13:56:33 -0500
Received: from anand by bangubntigfx with local (Exim 4.72)	(envelope-from
	<anand@bangubntigfx>)	id 1ZNQE8-0000Kg-Pd;
	Fri, 07 Aug 2015 00:19:16 +0530
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <denys@ti.com>, <meta-ti@yoctoproject.org>
Message-ID: <1438886878-1165-2-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438886878-1165-1-git-send-email-anandb@ti.com>
References: <1438886878-1165-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] omapdrm-pvr: recipe update for SGX KM on 4.1 kernel
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
Date: Mon, 24 Aug 2015 17:56:12 -0000
X-Original-Date: Fri, 7 Aug 2015 00:17:57 +0530
X-List-Received-Date: Mon, 24 Aug 2015 17:56:12 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index e173557..95bf68e 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -8,12 +8,12 @@ inherit module
 MACHINE_KERNEL_PR_append = "f"
 PR = "${MACHINE_KERNEL_PR}"
 
-BRANCH = "next"
+BRANCH = "omap5/next"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "430673f78b79eccdf308a6bbfb524209b485d2cc"
+SRCREV = "285ce496cecfedcc1c1acc653e3ee4be32995281"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
 
-- 
1.7.9.5


