Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F71FE00A39; Fri, 14 Sep 2018 19:50:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E31CDE0090C
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2018 19:50:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8F2oBop059321
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2018 21:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536979811;
	bh=2/rmwMLSibPqpLWAvIkWiTiBHSIsRAqZKVN1GI6x1a4=;
	h=From:To:CC:Subject:Date;
	b=yw5Wf6X/nM8bmCl4gX4wImpB33UPIuK36pOZwbJA7P1xLg4otYJJ78PLJbNFSbQkO
	pxvawci3XEMprH4bfOd8GcUS5p3irPIC4/uwcq3y2yaLy7g/g/+rZXa4lvIEkBadcQ
	jJVFskpvOyvF3V7vxey1NUbZbSAvK+LOdczB0lz4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8F2oBa7000657
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2018 21:50:11 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 14 Sep 2018 21:50:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 14 Sep 2018 21:50:09 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8F2o985004240;
	Fri, 14 Sep 2018 21:50:09 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Sep 2018 22:50:05 -0400
Message-ID: <1536979805-18343-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] ti-cgt-arm: Update to add rtsv7R4_A_le_v3D16_eabi.lib
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
X-List-Received-Date: Sat, 15 Sep 2018 02:50:12 -0000
Content-Type: text/plain

rtsv7R4_A_le_v3D16_eabi.lib library is not included in the cgt package.
This library is built dynamically during linking during a single build.
Bu in case of parallel make, dynamic creation of libraries causes
failures.
Hence building and adding the library to the package.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>t
---
 recipes-ti/devtools/ti-cgt-arm.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
index 436fab1..b9f7566 100644
--- a/recipes-ti/devtools/ti-cgt-arm.inc
+++ b/recipes-ti/devtools/ti-cgt-arm.inc
@@ -9,12 +9,20 @@ require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/ti-cgt-arm-${PV}"
 
+PR = "r1"
+
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
 
 BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
+do_compile_append() {
+    cd ${S}/ti-cgt-arm_${PV}.LTS
+    export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
+    lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
+}
+
 do_install() {
     install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
     cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
-- 
1.9.1


