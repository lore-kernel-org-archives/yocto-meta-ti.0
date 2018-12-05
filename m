Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D7CBE00C12; Wed,  5 Dec 2018 09:58:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46E54E00AC5
	for <meta-ti@yoctoproject.org>; Wed,  5 Dec 2018 09:58:23 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB5HwMqk007568
	for <meta-ti@yoctoproject.org>; Wed, 5 Dec 2018 11:58:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544032702;
	bh=2PLbhzNzMXws4FSIwfEwdGvxF0XQHdi7Ll0i1qypCOI=;
	h=From:To:CC:Subject:Date;
	b=KCZJW+SQngxqRNnIntEmaCBbKdBkZCfxQwOBsqdmoX+AGT/tZ1PjidgpfdLLiP7ch
	qZLDxlSzZwPCH3cDxTn4ygLzlfyg3O/jIbl62id11xqqKwKenRkcZKx/a9F7OS6IAG
	9Ej1GCnpZJXdH5tuv656R6quaq2uQF3iinNI5TuM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB5HwMPs099788
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 5 Dec 2018 11:58:22 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 5 Dec 2018 11:58:22 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 5 Dec 2018 11:58:22 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB5HwMsQ026081;
	Wed, 5 Dec 2018 11:58:22 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Dec 2018 12:46:00 -0500
Message-ID: <1544031960-9784-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] linux: cmem: add am574x injection for am57xx-hs-evm
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
X-List-Received-Date: Wed, 05 Dec 2018 17:58:24 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/cmem.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index b17ca9d..0327557 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -3,7 +3,7 @@
 # Use these for temporary overrides
 CMEM_MACHINE = "${MACHINE}"
 CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
-CMEM_MACHINE_am57xx-hs-evm = "am571x am572x"
+CMEM_MACHINE_am57xx-hs-evm = "am571x am572x am574x"
 CMEM_MACHINE_dra7xx-evm = "dra71x dra72x dra74x"
 CMEM_MACHINE_dra7xx-hs-evm = "dra71x dra72x dra74x"
 
-- 
2.7.4


