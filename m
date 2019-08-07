Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04D5FE00D9E; Wed,  7 Aug 2019 07:57:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37BA0E00D9D
	for <meta-ti@yoctoproject.org>; Wed,  7 Aug 2019 07:57:31 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77EvV2r046531
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 09:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565189851;
	bh=hfyNXnX3/sXvSBEIb3S4kXz8GmCrDm46rH3Vf041kHk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MSUIDb6c0N+CebtT6nmrfnp30U/tdoALfrgAUAWfiCEsUQ74OfMBZehJM/09Coxtx
	2UKbZZGXhMcqV5ziP4Decog1YrLIr5pcDq8omPJiW+7CB+MN7eIZBWX3PSKTiIhIBW
	yJmkfWlnyrIGNIBE+FhlaEbN5UeIyL3q0TlIG/Xw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77EvVLF080254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 09:57:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 7 Aug 2019 09:57:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 7 Aug 2019 09:57:31 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77EvSj7085303
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 09:57:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 7 Aug 2019 10:57:25 -0400
Message-ID: <1565189845-7081-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565189845-7081-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565189845-7081-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] qmss-lld: SRCREV update to 02.01.00.16A
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
X-List-Received-Date: Wed, 07 Aug 2019 14:57:33 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/qmss-lld/qmss-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index d579dfa..f42f16e 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -9,14 +9,14 @@ QMSS_LLD_GIT_PROTOCOL = "git"
 QMSS_LLD_GIT_BRANCH = "master"
 QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
 
-# Below commit ID corresponding to "DEV.QMSS_LLD.02.01.00.16"
-QMSS_LLD_SRCREV = "7934ae59f545b302ede96482e61a1f79ff3518ce"
+# Below commit ID corresponding to "DEV.QMSS_LLD.02.01.00.16A"
+QMSS_LLD_SRCREV = "7ca6e92b2081bd2eb64fa3dc9ca33df78b3ce292"
 
 BRANCH ="${QMSS_LLD_GIT_BRANCH}"
 SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${QMSS_LLD_SRCREV}"
 
-PV = "02.01.00.16"
+PV = "02.01.00.16A"
 INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
-- 
1.9.1


