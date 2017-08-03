Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AC17E00C3A; Thu,  3 Aug 2017 14:50:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79AB4E00C32
	for <meta-ti@yoctoproject.org>; Thu,  3 Aug 2017 14:50:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v73LoG5D031763
	for <meta-ti@yoctoproject.org>; Thu, 3 Aug 2017 16:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501797016;
	bh=7E5NGKANBczJ/ppJz69B4dF+8VASUJ5ZQq1Jr6/Q7B8=;
	h=From:To:CC:Subject:Date;
	b=AbMYSsHI+1bUS436BqNbQ+y/sVBxi6ry7qXI9cJP+k0jIYCFkZ4TQ96Xm38kuO+hX
	f8ZbjAw7h+Xp6TaWtfFbSnYK93aYDkcUqsNvwzMNNjWCSBaspASV+nsZpWZqxXadkw
	qsom/CHCRG0llkPBjTsDiheQ/1XbjYwbQRP6vFcE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v73LoGhB007335
	for <meta-ti@yoctoproject.org>; Thu, 3 Aug 2017 16:50:16 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 3 Aug 2017 16:50:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 3 Aug 2017 16:50:16 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v73LoFhi008010;
	Thu, 3 Aug 2017 16:50:15 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 3 Aug 2017 17:50:01 -0400
Message-ID: <1501797001-35113-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-pdk-bbclass: Enabling support for pru firmware builds
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
X-List-Received-Date: Thu, 03 Aug 2017 21:50:18 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/ti-pdk.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 62a4b06..1753969 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -5,7 +5,10 @@ inherit perlnative
 
 DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-pdk-build-rtos"
 
-DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
+DEPENDS_append_omap-a15 = " ti-cgt-arm-native ti-cgt-pru-native"
+DEPENDS_append_k2g = "ti-cgt-pru-native"
+DEPENDS_append_ti33x = "ti-cgt-pru-native"
+DEPENDS_append_ti43x = "ti-cgt-pru-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
 DEPENDS_remove_ti43x = "ti-cgt6x-native"
 DEPENDS_append_omapl1 = " ti-cgt-arm-native"
@@ -41,6 +44,7 @@ export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
 export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
 export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
 export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
 
 export ROOTDIR = "${B}"
 export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
@@ -53,7 +57,7 @@ export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
 TI_PDK_XDCMAKE ?= "1"
 
 # By default, only build the cores with available toolchains
-TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host"
+TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1"
 TI_PDK_LIMIT_SOCS ?= ""
 TI_PDK_LIMIT_BOARDS ?= ""
 TI_PDK_MAKE_TARGET ?= "release"
-- 
1.9.1


