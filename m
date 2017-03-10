Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB938E00A28; Fri, 10 Mar 2017 13:09:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28F74E00A08
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 13:08:58 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 41BBF20BC1;
	Fri, 10 Mar 2017 21:08:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 48KPusfrTiHc; Fri, 10 Mar 2017 21:08:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1D22020BBD;
	Fri, 10 Mar 2017 21:08:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 880D31623B8;
	Fri, 10 Mar 2017 16:08:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Mar 2017 16:08:40 -0500
Message-Id: <1489180123-138253-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489180123-138253-1-git-send-email-denis@denix.org>
References: <1489180123-138253-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] bt-fw: add version 8.7.1 (R8.7_SP1)
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
X-List-Received-Date: Fri, 10 Mar 2017 21:09:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previous versions were provided by meta-arago-extras, moving to meta-ti now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/bt-fw/bt-fw_git.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-bsp/bt-fw/bt-fw_git.bb

diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/recipes-bsp/bt-fw/bt-fw_git.bb
new file mode 100644
index 0000000..f3d740b
--- /dev/null
+++ b/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Firmware files for Bluetooth"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f39eac9f4573be5b012e8313831e72a9"
+
+PV = "8.7.1+git${SRCPV}"
+
+CLEANBROKEN = "1"
+
+SRCREV = "0ee619b598d023fffc77679f099bc2a4815510e4"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/ti-bt/service-packs.git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware/ti-connectivity
+    oe_runmake "DEST_DIR=${D}" "BASE_LIB_DIR=${base_libdir}" install
+}
+
+FILES_${PN} += "${base_libdir}/firmware/ti-connectivity/*"
-- 
2.7.4


