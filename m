Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93486E00C43; Mon, 24 Jul 2017 15:31:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDCA7E00C35
	for <meta-ti@yoctoproject.org>; Mon, 24 Jul 2017 15:31:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6OMVFuE002382
	for <meta-ti@yoctoproject.org>; Mon, 24 Jul 2017 17:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500935476;
	bh=DYb437UT8/cfHnVFVZmnMrdA2rY9mXwKT+vgcFqMRKo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ad+8ZL81llV1h6WzvNa+Qvf+I+ICTtPWFqBGWXJrD1g23Fqd4iunoyquqzUIjQIxg
	z7rEWlDoc/RDx9AKFeRaml3IBy0T/0YX/1MS9IPVWsimpfouwSSV196SDbGKS/hlQy
	NWA0Vxjaave+0n8+K6fVy7+VpDCbFoPImJ1SMqRU=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6OMVA96008020
	for <meta-ti@yoctoproject.org>; Mon, 24 Jul 2017 17:31:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Jul 2017 17:31:10 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6OMVAtN008103	for <meta-ti@yoctoproject.org>; Mon, 24 Jul 2017 17:31:10
	-0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 24 Jul 2017 17:31:08 -0500
Message-ID: <1500935470-11179-2-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500935470-11179-1-git-send-email-i-pang@ti.com>
References: <1500935470-11179-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] ti-cgt6x-7: added recipe for TI CGT6x 7.x.x
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
X-List-Received-Date: Mon, 24 Jul 2017 22:31:36 -0000
Content-Type: text/plain

This recipe specifically installs the 7.x.x series of TI CGT6x.

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb

diff --git a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
new file mode 100644
index 0000000..51d359e
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "TI DSP Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "TI"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+
+PE = "0"
+PR = "r0"
+
+S = "${WORKDIR}/c6000_7.4.16"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-unpack.inc
+
+BINFILE = "ti_cgt_c6000_7.4.16_linux_installer_x86.bin"
+BINFILE_NAME = "cgt6x_7.4.16_x86_installer"
+TI_BIN_UNPK_ARGS = "--prefix ${WORKDIR} --mode unattended"
+TI_BIN_UNPK_CMDS=""
+
+SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
+
+SRC_URI[cgt6x_7.4.16_x86_installer.md5sum] = "21ca55c5b1f6b2d8d4fb7570d5eb5513"
+SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] = "baa0d1ef20397383f99f45068a6d160963a01419d42fbbb851263b54c91df82f"
+
+do_install() {
+    install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
+    cp -r ${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN} += "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN} += "arch staticdev"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


