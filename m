Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91EBEE006D5; Tue,  1 Jul 2014 06:36:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59E89E0053A
	for <meta-ti@yoctoproject.org>; Tue,  1 Jul 2014 06:36:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61DaIkx016523
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 08:36:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61DaIOH011190
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 08:36:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 08:36:18 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s61DaAUh019441;	Tue, 1 Jul 2014 08:36:16 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Jul 2014 08:36:08 -0500
Message-ID: <1404221769-7903-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
References: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] dra7xx-evm: Use dra7xx include
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
X-List-Received-Date: Tue, 01 Jul 2014 13:36:27 -0000
Content-Type: text/plain

* Update the include file used to the dra7xx.inc file which
  brings access to the dra7xx SOC_FAMILY

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/dra7xx-evm.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 14253cf..7069b44 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: DRA7xx EVM
 #@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
 
-require conf/machine/include/omap-a15.inc
+require conf/machine/include/dra7xx.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
 
-- 
1.7.9.5


