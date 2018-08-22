Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20DE7E00546; Wed, 22 Aug 2018 14:18:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94CC3E00474
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 14:18:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7MLIpmA084128
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 16:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534972731;
	bh=iJZ1Bf/z4FF5EAmK2vEdr1TAQHoBa2r0CHJWulXrzKg=;
	h=From:To:CC:Subject:Date;
	b=il0QoMTjCVixHRq2dkHTXYajBIJLN7BKH7Ml3Bk4RegxX4si+f/hsvIG6/wpnKxq6
	InySbgHEGH/KGkkQ/KhdozYOMZw53QtzQx6oQ5ALlaW1tMiizq91rU6Pbn3tskIK7s
	yVgxeIeioBF+YVmllyOznoaryc8fJmqMuj7smaAg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MLIpnM003994
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 16:18:51 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 16:18:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 16:18:51 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MLIphK029822;
	Wed, 22 Aug 2018 16:18:51 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <hzhang@ti.com>
Date: Wed, 22 Aug 2018 17:18:50 -0400
Message-ID: <1534972730-13639-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] ti-pdk: Add tool chain dependencies for am65xx platform
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
X-List-Received-Date: Wed, 22 Aug 2018 21:18:53 -0000
Content-Type: text/plain

Adds the dependency on toolchain needed for A53 and R5 cores

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 classes/ti-pdk.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 7ad6205..f0d14a7 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -9,6 +9,8 @@ DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
 DEPENDS_remove_ti43x = "ti-cgt6x-native"
 DEPENDS_append_omapl1 = " ti-cgt-arm-native"
+DEPENDS_remove_am65xx-evm = "gcc-arm-none-eabi-native ti-cgt6x-native"
+DEPENDS_append_am65xx-evm = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
@@ -42,6 +44,8 @@ export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
 export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
 export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
+export TOOLCHAIN_PATH_GCC_ARCH64 = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}"
+export TOOLCHAIN_PATH_R5 = "${M4_TOOLCHAIN_INSTALL_DIR}"
 
 export ROOTDIR = "${B}"
 export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
-- 
1.9.1


