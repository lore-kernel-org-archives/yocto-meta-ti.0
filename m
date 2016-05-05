Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABC20E00DEF; Thu,  5 May 2016 07:47:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A31DE00DED
	for <meta-ti@yoctoproject.org>; Thu,  5 May 2016 07:47:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u45ElHkh019887
	for <meta-ti@yoctoproject.org>; Thu, 5 May 2016 09:47:17 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45ElHvk030724
	for <meta-ti@yoctoproject.org>; Thu, 5 May 2016 09:47:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 May 2016 09:47:17 -0500
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u45ElC9I030261;	Thu, 5 May 2016 09:47:16 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 5 May 2016 20:17:09 +0530
Message-ID: <1462459629-4450-2-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1462459629-4450-1-git-send-email-anandb@ti.com>
References: <1462459629-4450-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-sgx-ddk-km: update srcrev and branch name, bump PR
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
X-List-Received-Date: Thu, 05 May 2016 14:47:22 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 0e99791..18e6801 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -20,12 +20,12 @@ RPROVIDES_${PN} = "omapdrm-pvr"
 RREPLACES_${PN} = "omapdrm-pvr"
 RCONFLICTS_${PN} = "omapdrm-pvr"
 
-BRANCH = "ti-img-sgx/${PV}/k4.1"
+BRANCH = "ti-img-sgx/${PV}/k4.4"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "fed0756f1b8b9d526da2821635c7d742989d47c3"
+SRCREV = "c8d280c2842bf4b1fdc63f5efd89595807c0a254"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
-- 
1.7.9.5


