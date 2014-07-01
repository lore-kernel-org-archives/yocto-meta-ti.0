Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9ED56E006D1; Tue,  1 Jul 2014 06:36:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BB5BE0053B
	for <meta-ti@yoctoproject.org>; Tue,  1 Jul 2014 06:36:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61DaGKP006570
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 08:36:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61DaFki019999
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 08:36:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 08:36:15 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s61DaAUg019441;	Tue, 1 Jul 2014 08:36:14 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Jul 2014 08:36:07 -0500
Message-ID: <1404221769-7903-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
References: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] am57xx-evm: Add the AM57xx machine type
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

* Add the AM57xx machine type which is used to differentiate
  between the AM57xx and the DRA7xx which are derivative devices
  with different HW platforms and SoC capabilities.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/{dra7xx-evm.conf => am57xx-evm.conf} |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 copy conf/machine/{dra7xx-evm.conf => am57xx-evm.conf} (96%)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/am57xx-evm.conf
similarity index 96%
copy from conf/machine/dra7xx-evm.conf
copy to conf/machine/am57xx-evm.conf
index 14253cf..7069b44 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: DRA7xx EVM
 #@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
 
-require conf/machine/include/omap-a15.inc
+require conf/machine/include/dra7xx.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
 
-- 
1.7.9.5


