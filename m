Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93465E00B74; Tue,  8 Sep 2015 07:38:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BD9BE00B5A
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 07:38:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t88Ecgi1009729
	for <meta-ti@yoctoproject.org>; Tue, 8 Sep 2015 09:38:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t88Ecg8x018398
	for <meta-ti@yoctoproject.org>; Tue, 8 Sep 2015 09:38:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Sep 2015 09:38:35 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t88Ecfuu012786;	Tue, 8 Sep 2015 09:38:41 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 8 Sep 2015 10:38:35 -0400
Message-ID: <1441723115-13540-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] omapdrm-pvr: Bump SRCREV for am4/k4.1 branch
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
X-List-Received-Date: Tue, 08 Sep 2015 14:38:45 -0000
Content-Type: text/plain

* Sync up with the current kernel code

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 0978b43..15ccb54 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -20,8 +20,8 @@ SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch
 S = "${WORKDIR}/git"
 
 SRCREV_omap-a15 = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
-SRCREV_ti33x = "696eaf6cff0e4ab6abedc3ff639ec158f8a6177f"
-SRCREV_ti43x = "696eaf6cff0e4ab6abedc3ff639ec158f8a6177f"
+SRCREV_ti33x = "ad7c4fa37897b59b6d9ddabb9aba03fd515ffa29"
+SRCREV_ti43x = "ad7c4fa37897b59b6d9ddabb9aba03fd515ffa29"
 
 PVR_NULLDRM_ti33x = "1"
 PVR_NULLDRM_ti43x = "1"
-- 
1.9.1


