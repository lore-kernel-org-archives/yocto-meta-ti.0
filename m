Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3BABE0095D; Wed,  3 Jun 2015 17:24:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5131EE007B6
	for <meta-ti@yoctoproject.org>; Wed,  3 Jun 2015 17:24:36 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NPE007BA94ZZT20@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 03 Jun 2015 19:24:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=N5PUbDJB c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=eIhxMilvRf8A:10 a=0gcC27t9AAAA:8	a=oR5dmqMzAAAA:8 a=-9mUelKeXuEA:10
	a=XAFQembCKUMA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=rFoFbkrH39ev6EuT788A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D4BBD161A73;	Wed,
	3 Jun 2015 20:24:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 03 Jun 2015 20:24:34 -0400
Message-id: <1433377474-17120-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ipumm-fw: update to 3.00.08.01
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
X-List-Received-Date: Thu, 04 Jun 2015 00:24:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Note: this prebuilt FW image hasn't been released publicly yet - interim copy
It doesn't have the correct Manifest either.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
new file mode 100644
index 0000000..2e43584
--- /dev/null
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
@@ -0,0 +1,33 @@
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
+}
+
+DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
+LICENSE = "TI-TSPA"
+
+LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "libdce"
+
+SRC_URI = "http://arago-project.org/files/short-term/misc/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
+
+SRC_URI[md5sum] = "e770dce63fdf218bb19ceb748d9812c0"
+SRC_URI[sha256sum] = "044d49b77560660bdfc29894e669fe8f70dc467c66b4acb49b24722a0799baa1"
+
+S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
+
+TARGET = "dra7-ipu2-fw.xem4"
+
+do_install() {
+        mkdir -p ${D}${base_libdir}/firmware
+        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
-- 
2.2.0


