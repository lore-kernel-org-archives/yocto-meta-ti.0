Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70E77E00BD2; Fri, 11 Dec 2015 01:19:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2331AE00BEC
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2015 01:19:54 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBB9JsbO027356
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2015 03:19:54 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBB9JsF7000587
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2015 03:19:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Dec 2015 03:19:53 -0600
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBB9JeV5027069;	Fri, 11 Dec 2015 03:19:53 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 11 Dec 2015 14:49:17 +0530
Message-ID: <1449825558-1294-2-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1449825558-1294-1-git-send-email-anandb@ti.com>
References: <1449825558-1294-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
Subject: [SGX AM57x/DRA7xx 1/2] omapdrm-pvr: bump SRCREV for AM57x/DRA7xx
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
X-List-Received-Date: Fri, 11 Dec 2015 09:19:58 -0000
Content-Type: text/plain

* Fix use of freed GEM object
* Disable debug options in release build

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 7683dbf..4552fe1 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -19,7 +19,7 @@ BRANCH_ti43x = "am4/k4.1"
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV_omap-a15 = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
+SRCREV_omap-a15 = "c53a5dfb9f4d5612c372ec8e252cb13a731c9c10"
 SRCREV_ti33x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
 SRCREV_ti43x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
 
-- 
1.7.9.5


