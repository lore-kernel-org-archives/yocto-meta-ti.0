Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43BDEE00D35; Mon,  5 Aug 2019 11:02:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B0DBE0049C
	for <meta-ti@yoctoproject.org>; Mon,  5 Aug 2019 11:02:49 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x75I2mEb098829
	for <meta-ti@yoctoproject.org>; Mon, 5 Aug 2019 13:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565028168;
	bh=9/hnfckN0HfPH3WQOVayo4M9RSOJ6U6KWEWGFXWNXJ4=;
	h=From:To:Subject:Date;
	b=TJP1k5jPF+WBYN7gzBUP6gxJDvWtr2U8SakyHbxQe9uO+Iyy49IeZZUIkjcbtFtMU
	vdShrMUqo+ABT50dHYFad3FQbyo36ELWHXmL3ELEWFJvxIl4S308BJf1HlZgH4qxws
	P9tBq0nipMA3VJXZ8C2/exqbn6ESC2Yuk7iE7Vdw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x75I2mUF098093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 5 Aug 2019 13:02:48 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 5 Aug 2019 13:02:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 5 Aug 2019 13:02:48 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x75I2lcN011061
	for <meta-ti@yoctoproject.org>; Mon, 5 Aug 2019 13:02:48 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 5 Aug 2019 14:02:44 -0400
Message-ID: <1565028164-34658-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2] ti-cgt-pru: Update to version 2.3.2
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
X-List-Received-Date: Mon, 05 Aug 2019 18:02:50 -0000
Content-Type: text/plain

The License Checksum has changed due to version, the licenses have not
changed
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 -Fixed RDEPENDS & cgt-pru-arm md5sum & sha256sum

 .../devtools/{ti-cgt-pru_2.2.1.bb => ti-cgt-pru_2.3.2.bb}  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-pru_2.2.1.bb => ti-cgt-pru_2.3.2.bb} (71%)

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
similarity index 71%
rename from recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
rename to recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
index 8d3887e..ed10e27 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "TI PRU Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.2.x_manifest.html;md5=e84b4022808f66b075095cb896747758"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.2.x_manifest.html;md5=e84b4022808f66b075095cb896747758"
+LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-unpack.inc
@@ -18,11 +18,11 @@ BINFILE_NAME_class-target = "cgt-pru-arm"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt-pru-x86.md5sum] = "749d75841eef7b465c7cb08beaa1d135"
-SRC_URI[cgt-pru-x86.sha256sum] = "7dc37fd689d1d506bf410d2a00af658b93a58d4bc10ac32c2210129dab617377"
+SRC_URI[cgt-pru-x86.md5sum] = "270a0ecca383f66cad3a0e2a738c6ab0"
+SRC_URI[cgt-pru-x86.sha256sum] = "af1178a059d46d67d5672df053dd2fbebb0b89a513b17b8739dbe915b4a5d71a"
 
-SRC_URI[cgt-pru-arm.md5sum] = "389eef56777e30e6dab337efca4af2bf"
-SRC_URI[cgt-pru-arm.sha256sum] = "b47a032f67cb3a3e5bea8ee3ed1908038f42938dd08e2ff72fc64f7aae2c1ff8"
+SRC_URI[cgt-pru-arm.md5sum] = "fbf10083af1b0e5d69b018126603bb58"
+SRC_URI[cgt-pru-arm.sha256sum] = "75ac84775a5624ea7e4fad4efc1acb7e869c79160550d48ba780068a3dce879c"
 
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
@@ -44,6 +44,6 @@ INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INSANE_SKIP_${PN} += "arch staticdev already-stripped"
+INSANE_SKIP_${PN} += "arch staticdev already-stripped file-rdeps"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


