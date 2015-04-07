Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 934DEE00952; Tue,  7 Apr 2015 09:41:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67684E00830
	for <meta-ti@yoctoproject.org>; Tue,  7 Apr 2015 09:41:26 -0700 (PDT)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMG00B2W3P1BU10@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 07 Apr 2015 11:41:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OqT4EJ7o c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8	a=WG_rYCaziNVVhayWXqMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 55E5E200F4;	Tue,
	7 Apr 2015 12:41:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 07 Apr 2015 12:41:25 -0400
Message-id: <1428424885-30699-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] rwmem: add rwmem tool
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
X-List-Received-Date: Tue, 07 Apr 2015 16:41:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

https://github.com/tomba/rwmem

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/rwmem/rwmem_1.1.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-bsp/rwmem/rwmem_1.1.bb

diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
new file mode 100644
index 0000000..1825e18
--- /dev/null
+++ b/recipes-bsp/rwmem/rwmem_1.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A small tool to read/write memory"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
+SRC_URI = "git://github.com/tomba/rwmem.git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 rwmem ${D}${bindir}
+}
-- 
2.2.0


