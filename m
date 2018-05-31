Return-Path: <x0257345@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 484B3E00C59; Thu, 31 May 2018 06:30:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06775E00B5C
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2018 06:30:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4VDUDm1018564
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2018 08:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1527773413;
	bh=zpvQtttObvKWX+A/Ot7kZoxC+Y32UERg8CeeN3fe8Pc=;
	h=From:To:Subject:Date;
	b=puvR8C0S+lkatHRIGY7u9sFFh8/VuZFASeMLiCAIFIKMXeDNYhwSVIxiAZTqm5zit
	1UrnNpsqOCDnlrW1aiIZ6/4nZe+u9a2+BF5RxDA1em8oFGaMqEad2ziPX5L1owORu9
	SVS0qaMUvwG+ccDjpGjmnhQZnTraHwL68JFXb/vA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VDUDFD029045
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2018 08:30:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 31 May 2018 08:30:13 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 31 May 2018 08:30:13 -0500
Received: from LAP000354.mistral.in (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VDUAJl031892
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2018 08:30:12 -0500
From: Sinthu Raja <x0257345@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 31 May 2018 19:00:10 +0530
Message-ID: <20180531133010.12772-1-x0257345@ti.com>
X-Mailer: git-send-email 2.13.3.windows.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] update ti-pdk.bbclass file to include script packages for all components
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
X-List-Received-Date: Thu, 31 May 2018 13:30:15 -0000
Content-Type: text/plain

From: Sinthu Raja M <x0257345@ti.com>

 Export RULES_MAKE that points to packages/Rules.make
 Includes ti-pdk-setup to include script package for all components
---
 classes/ti-pdk.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 540a665c..ee2cc1e1 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -3,7 +3,10 @@ require recipes-ti/includes/ti-staging.inc
 
 inherit perlnative
 
-DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
+#Export RULES_MAKE that points to top level Rules.make
+export RULES_MAKE = "{PDK_INSTALL_DIR}/packages/Rules.make"
+
+DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos ti-pdk-setup doxygen-native"
 
 DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
-- 
2.13.3.windows.1



