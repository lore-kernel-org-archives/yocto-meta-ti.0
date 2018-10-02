Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9523E00A4F; Tue,  2 Oct 2018 04:48:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6006E00950
	for <meta-ti@yoctoproject.org>; Tue,  2 Oct 2018 04:48:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w92Bmanj111571
	for <meta-ti@yoctoproject.org>; Tue, 2 Oct 2018 06:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538480916;
	bh=4ubggWY5ZoZufdsFIk1fRw6d8yZcrZ2BcjZe12iRbUg=;
	h=From:To:CC:Subject:Date;
	b=nxE5MgAqEVOlJgo2NrlbbXrV4e1p+r36Rxdizppzm4PVZBDulM9wS06BUUI13xcta
	REQwilgHBmPczNBWbtq0OagosAAtA++AbUmfp55O81L1hhoFpHNe+HvUNDZomjfejh
	5gd+mDs4c30jvzchjBxSt3p4qKYH7rLnKRyFeXy0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w92BmaAf028493
	for <meta-ti@yoctoproject.org>; Tue, 2 Oct 2018 06:48:36 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 2 Oct 2018 06:48:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 2 Oct 2018 06:48:36 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w92BmZb7012432;
	Tue, 2 Oct 2018 06:48:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 2 Oct 2018 07:36:07 -0400
Message-ID: <1538480167-12075-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [ti2018.03/rocko/master][PATCH] ti-cgt-arm: prevent build of existing library
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
X-List-Received-Date: Tue, 02 Oct 2018 11:48:37 -0000
Content-Type: text/plain

* Prevent a potential error as mklib will return an error if the
  library already exists.
* The error encountered is the following:

| >> ERROR: mklib: destination library .../work/x86_64-linux/ti-cgt-arm-native/16.9.2-r1/ti-cgt-arm-16.9.2/ti-cgt-arm_16.9.2.LTS/lib/rtsv7R4_A_le_v3D16_eabi.lib already exists
| WARNING: .../work/x86_64-linux/ti-cgt-arm-native/16.9.2-r1/temp/run.do_compile.13758:1 exit 1 from 'lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib'

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cgt-arm.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
index b9f7566..e83973b 100644
--- a/recipes-ti/devtools/ti-cgt-arm.inc
+++ b/recipes-ti/devtools/ti-cgt-arm.inc
@@ -9,7 +9,7 @@ require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/ti-cgt-arm-${PV}"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
 
@@ -19,8 +19,12 @@ TI_BIN_UNPK_CMDS = ""
 
 do_compile_append() {
     cd ${S}/ti-cgt-arm_${PV}.LTS
-    export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
-    lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
+
+    if [ ! -f "./lib/rtsv7R4_A_le_v3D16_eabi.lib" ]
+    then
+        export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
+        lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
+    fi
 }
 
 do_install() {
-- 
2.7.4


