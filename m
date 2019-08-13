Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7868FE00DA5; Tue, 13 Aug 2019 12:49:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5B0DE00D46
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 12:49:06 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DJn6gj084744
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565725746;
	bh=Ro3LbRSuyTpcCZEaUg/GS6J1Rg22HLydOcgjwy0sq24=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BB0HROMNjhHXzgwLSXpv6AJAMbHPKVbESD+hEGpDFzX8zMn+gtDFuZhC1haU5+TYh
	t4mBHxY96ssdYUj3bgkNZgvoRnZchKyfTMsDAj1p1m7Yybh02WH5lXRekpOTsOAex9
	MYL6YK+WDpL2ZhQcSojLLWJnrvYdOKFbVnFlX+eE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DJn6cP122103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:49:06 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 13 Aug 2019 14:49:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 13 Aug 2019 14:49:06 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DJn3Wi018645
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:49:06 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Aug 2019 15:48:59 -0400
Message-ID: <1565725739-30469-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565725739-30469-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565725739-30469-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/2] ti-paths.inc: Adding install directory for ti-cgt-7x
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
X-List-Received-Date: Tue, 13 Aug 2019 19:49:07 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/includes/ti-paths.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 250074b..52a93cf 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -60,6 +60,8 @@ export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
 export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          = "${installdir}/gcc-linaro-baremetal"
 export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  = "${installdir}/gcc-linaro-baremetal-aarch64"
+export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
+
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
@@ -113,6 +115,7 @@ export MPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
 export TI_CGT6X_7_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
 export GCC_LINARO_BAREMETAL_TOOLCHAIN         =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}"
 export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}"
+export TI_CGT7X_INSTALL_DIR        = "${STAGING_DIR_NATIVE}${TI_CGT7X_INSTALL_DIR_RECIPE}"
 
 
 DSPSUFFIX_omapl137 = "x674"
-- 
1.9.1


