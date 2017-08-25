Return-Path: <jjhiblot@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D223DE00D57; Fri, 25 Aug 2017 14:39:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F94DE00D57
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 14:39:13 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PLd28c016326
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 16:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503697142;
	bh=R9hr4J1U+LDrjLjUpRKom2ioDvJRl9QoAQv+JApEF1Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=USCOrq1os1RlRMkD+b+rhsF5RqOeZhpEOpjwkFicmxMmHw20S+wH3HR5PJFQYfWnr
	0xwapeJIGd7DJQQhxWdDgrm8EbAeZ2LZ3cddwBRE2bmA7yd2VesdxndWVmg0GRubqh
	ONsp0re55fEeLsb4TRR9mNwAG2tirpN47DHw9vMI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PLcvFt018148
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 16:38:57 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 25 Aug 2017 16:38:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 25 Aug 2017 16:38:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PLcu8R018933;
	Fri, 25 Aug 2017 16:38:57 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 25 Aug 2017 23:38:48 +0200
Message-ID: <1503697128-6311-4-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1503697128-6311-1-git-send-email-jjhiblot@ti.com>
References: <1503697128-6311-1-git-send-email-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] [PATCH 3/3] linux-ti-staging 4.4: package the dtb for the dra76-evm platform
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
X-List-Received-Date: Fri, 25 Aug 2017 21:39:18 -0000
Content-Type: text/plain

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index e54399e..433f6e8 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -58,7 +58,8 @@ KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra7-evm-lcd-osd101t2587.dtb \
                                 dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb dra72-evm-lcd-osd101t2587.dtb \
                                 dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
-                                dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb"
+                                dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb \
+                                dra76-evm.dtb"
 KERNEL_DEVICETREE_dra7xx-hs-evm = "${KERNEL_DEVICETREE_dra7xx-evm}"
 KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
                                 am57xx-evm.dtb am57xx-evm-reva3.dtb \
-- 
1.9.1


