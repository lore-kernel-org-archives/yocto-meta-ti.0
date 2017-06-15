Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35709E00B9E; Thu, 15 Jun 2017 08:58:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5BB0E00B99
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 08:58:50 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5FFwnXA002668
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 10:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497542329;
	bh=TDCMsbUtHdLkoaj5sJzrVlGFcTrNgWwT4F0f/gzOWDU=;
	h=From:To:CC:Subject:Date;
	b=GWZn3GiDSI3MH+CvzmVMRjYoHBBW6cinfun//j2hvvJh5NxHuxmtXr0IF3/7TI/hd
	MYkEs35Cn/Prrw3d8CtWa0ESLZA12DuH/K5/d1MOFyC2BmYjw9HcP3n6yzsh0QOLT5
	2KnilkwLFgrQGRglg9wU+MEQrXQ7QuAEYuolb9dk=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5FFwnbe025796
	for <meta-ti@yoctoproject.org>; Thu, 15 Jun 2017 10:58:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 10:58:49 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5FFwmti013721;	Thu, 15 Jun 2017 10:58:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Jun 2017 11:53:17 -0400
Message-ID: <1497541998-1014-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] ti-cgt6x: update to version 8.2.0
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
X-List-Received-Date: Thu, 15 Jun 2017 15:58:52 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/{ti-cgt6x_8.1.0.bb => ti-cgt6x_8.2.0.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename recipes-ti/devtools/{ti-cgt6x_8.1.0.bb => ti-cgt6x_8.2.0.bb} (86%)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb b/recipes-ti/devtools/ti-cgt6x_8.2.0.bb
similarity index 86%
rename from recipes-ti/devtools/ti-cgt6x_8.1.0.bb
rename to recipes-ti/devtools/ti-cgt6x_8.2.0.bb
index 79b562a..54af409 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.2.0.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "TI DSP Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.1.x_CodeGenerationTools_Manifest.htm;md5=458bf5fa55a865372515aeba0dfa9b72"
+LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.0.x_CodeGenerationTools_Manifest.htm;md5=0d1c662c65c3526fc0f4784a4e114ef4"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.0.x_CodeGenerationTools_Manifest.htm;md5=0d1c662c65c3526fc0f4784a4e114ef4"
 
 PE = "1"
 
@@ -37,11 +37,11 @@ BINFILE_NAME_class-target = "cgt6x_arm_installer"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt6x_x86_installer.md5sum] = "43d9a9a6307c7ba0933050e4ba1b0e56"
-SRC_URI[cgt6x_x86_installer.sha256sum] = "0ce82e2d338b8aab3c3d1eb52217d025bd07952ac40c8f5a9319652d0c8882ad"
+SRC_URI[cgt6x_x86_installer.md5sum] = "8f6d1cdb8c120e408fa6b4e1bb7b00d7"
+SRC_URI[cgt6x_x86_installer.sha256sum] = "36a05c453daa3261ada9e7681d008bf2bd844e84699c7a8445af80c629b5497b"
 
-SRC_URI[cgt6x_arm_installer.md5sum] = "52433a9ffdc6fbbb539a3c8e3e1c9ec0"
-SRC_URI[cgt6x_arm_installer.sha256sum] = "286a96e3082086c37129cbbc6c3665c76028b68975d02fc30375a6aaba00532a"
+SRC_URI[cgt6x_arm_installer.md5sum] = "6780b000adc4fd168f45a1776bb4dcf4"
+SRC_URI[cgt6x_arm_installer.sha256sum] = "13b84434e88a91316809c0377552ae2396499344ed1c5eb77f42cce1d6e2b0a8"
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.7.4


