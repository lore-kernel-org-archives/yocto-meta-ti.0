Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25EE8E00C08; Thu,  3 Mar 2016 15:45:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6F0BE00BEB
	for <meta-ti@yoctoproject.org>; Thu,  3 Mar 2016 15:45:34 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u23NjXSS004476
	for <meta-ti@yoctoproject.org>; Thu, 3 Mar 2016 17:45:33 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u23NjXQ3005112
	for <meta-ti@yoctoproject.org>; Thu, 3 Mar 2016 17:45:33 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Mar 2016 17:45:34 -0600
Received: from a0756824local (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u23NjXmq009823;
	Thu, 3 Mar 2016 17:45:33 -0600
Received: from a0866445 by a0756824local with local (Exim 4.80)	(envelope-from
	<jsobota@ti.com>)	id 1abcw0-0004RY-Sh;
	Thu, 03 Mar 2016 18:45:32 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 3 Mar 2016 18:45:25 -0500
Message-ID: <1457048726-16687-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2] ti-sysbios: Update to 6.45.01.29
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
X-List-Received-Date: Thu, 03 Mar 2016 23:45:41 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/bios/ti-sysbios_6.45.01.29.bb |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-ti/bios/ti-sysbios_6.45.01.29.bb

diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
new file mode 100644
index 0000000..6ab4e27
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
@@ -0,0 +1,12 @@
+require recipes-ti/bios/ti-sysbios.inc
+
+PV = "6_45_01_29"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
+
+SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
+SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
+
+TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.7.10.4


