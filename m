Return-Path: <s-das@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBA8CE00D17; Thu, 11 Jan 2018 11:14:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37971E008FB
	for <meta-ti@yoctoproject.org>; Thu, 11 Jan 2018 11:14:32 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0BJEWue032603
	for <meta-ti@yoctoproject.org>; Thu, 11 Jan 2018 13:14:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515698072;
	bh=iWs6R1wviMpIu6DZ8pmgfQS7g5D0hV5KuPhi/WJVPq0=;
	h=From:To:CC:Subject:Date;
	b=DQ0g3+4lBK79NL94wXsXm65/c046UAf+3VX4eRj8Oz4qe//14VmITcakxH3x4r3TZ
	Iwfudizo28Q63q9fDnaso0IvpnO7+mINagFxSCA+ih7qYoxpGueP66IzkNITEI/Eqi
	zwkXPNxJCTvpraWdlJRhY5NEsORtKcqePIX6uLOI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0BJEWBc022073
	for <meta-ti@yoctoproject.org>; Thu, 11 Jan 2018 13:14:32 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 11 Jan 2018 13:14:32 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 11 Jan 2018 13:14:32 -0600
Received: from uda0226011a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0BJEVCH001357;
	Thu, 11 Jan 2018 13:14:31 -0600
From: Suraj Das <s-das@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 11 Jan 2018 14:14:29 -0500
Message-ID: <1515698069-34902-1-git-send-email-s-das@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-cgt-pru: update toolchain to 2.2.1 version
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
X-List-Received-Date: Thu, 11 Jan 2018 19:14:40 -0000
Content-Type: text/plain

---
 .../devtools/{ti-cgt-pru_2.1.5.bb => ti-cgt-pru_2.2.1.bb}   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-pru_2.1.5.bb => ti-cgt-pru_2.2.1.bb} (74%)

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb b/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
similarity index 74%
rename from recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
rename to recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
index 5586d0f..c939a74 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "TI PRU Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.1.x_manifest.html;md5=d7fea45a7968939ff953ae8a1e6719f4"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.1.x_manifest.html;md5=d7fea45a7968939ff953ae8a1e6719f4"
+LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.2.x_manifest.html;md5=e84b4022808f66b075095cb896747758"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.2.x_manifest.html;md5=e84b4022808f66b075095cb896747758"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-unpack.inc
@@ -18,11 +18,11 @@ BINFILE_NAME_class-target = "cgt-pru-arm"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt-pru-x86.md5sum] = "06ac11b90a55ee787ac20fcca9a27013"
-SRC_URI[cgt-pru-x86.sha256sum] = "0f5b965ae1fda818ce5a81f1adbdae0a65047c6ae6cff1869e08e678122f8dff"
+SRC_URI[cgt-pru-x86.md5sum] = "749d75841eef7b465c7cb08beaa1d135"
+SRC_URI[cgt-pru-x86.sha256sum] = "7dc37fd689d1d506bf410d2a00af658b93a58d4bc10ac32c2210129dab617377"
 
-SRC_URI[cgt-pru-arm.md5sum] = "bedda3b31d8918d5d1d3c6d886821d0a"
-SRC_URI[cgt-pru-arm.sha256sum] = "f2711478f9160a73660a2b2f316ad446bc481141bb9889f1001441beccce3584"
+SRC_URI[cgt-pru-arm.md5sum] = "389eef56777e30e6dab337efca4af2bf"
+SRC_URI[cgt-pru-arm.sha256sum] = "b47a032f67cb3a3e5bea8ee3ed1908038f42938dd08e2ff72fc64f7aae2c1ff8"
 
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
@@ -47,3 +47,4 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN} += "arch staticdev already-stripped"
 
 BBCLASSEXTEND = "native nativesdk"
+
-- 
1.9.1


