Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B80E8E00B23; Wed,  3 Oct 2018 10:37:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0E21E00A9B
	for <meta-ti@yoctoproject.org>; Wed,  3 Oct 2018 10:37:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w93HbX3V093340
	for <meta-ti@yoctoproject.org>; Wed, 3 Oct 2018 12:37:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538588253;
	bh=sM9ezPzxKY62zIlq32J9mMyTMHdOhuQNQ1fK4hqc1sk=;
	h=From:To:CC:Subject:Date;
	b=Zs6iq6hiR29xuLOkAJq3adDef+iyzZl8cSjWuiDm37oLR5bmhjwj+/+9AjkNrRSkR
	HGDz79TsysAbjUF1LfKJ9ZOWfygljZibdvYNiEeSI1AfB3ZusmWde0CadRsZoQn4hz
	c4nj35apJsyNsXfLTXD1YCubQuU28AHomgMRq3gc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93HbXMv012397
	for <meta-ti@yoctoproject.org>; Wed, 3 Oct 2018 12:37:33 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 3 Oct 2018 12:37:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 3 Oct 2018 12:37:32 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93HbVhc010907;
	Wed, 3 Oct 2018 12:37:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 3 Oct 2018 13:25:02 -0400
Message-ID: <1538587502-26700-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] ti-cgt-arm: "clean" library in do_configure
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
X-List-Received-Date: Wed, 03 Oct 2018 17:37:34 -0000
Content-Type: text/plain

* Prevent a potential error as mklib will return an error if the
  library already exists.
* The error encountered is the following:

| >> ERROR: mklib: destination library .../work/x86_64-linux/ti-cgt-arm-native/16.9.2-r1/ti-cgt-arm-16.9.2/ti-cgt-arm_16.9.2.LTS/lib/rtsv7R4_A_le_v3D16_eabi.lib already exists
| WARNING: .../work/x86_64-linux/ti-cgt-arm-native/16.9.2-r1/temp/run.do_compile.13758:1 exit 1 from 'lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib'

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cgt-arm.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
index b9f7566..d55b55b 100644
--- a/recipes-ti/devtools/ti-cgt-arm.inc
+++ b/recipes-ti/devtools/ti-cgt-arm.inc
@@ -9,7 +9,7 @@ require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/ti-cgt-arm-${PV}"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
 
@@ -17,6 +17,12 @@ BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
+do_configure_append() {
+    # Remove the library if it exists to prevent an error when building the
+    # library in do_compile().
+    rm -f ./ti-cgt-arm_${PV}.LTS/lib/rtsv7R4_A_le_v3D16_eabi.lib
+}
+
 do_compile_append() {
     cd ${S}/ti-cgt-arm_${PV}.LTS
     export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
-- 
2.7.4


