Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.15766.1581974461596726532
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 13:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2482E01733; Mon, 17 Feb 2020 13:21:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE87DE00C82
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 13:20:59 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B89CC40BFD;
	Mon, 17 Feb 2020 21:20:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2bFqB-sAdFG; Mon, 17 Feb 2020 21:20:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 98152400E7;
	Mon, 17 Feb 2020 21:20:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4C3FD174406;
	Mon, 17 Feb 2020 16:20:57 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] k3conf: add diagnostic tool for K3 platforms
Date: Mon, 17 Feb 2020 16:20:57 -0500
Message-Id: <1581974457-4575-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-devtools/k3conf/k3conf_git.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-devtools/k3conf/k3conf_git.bb

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
new file mode 100644
index 0000000..52c2fcf
--- /dev/null
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Diagnostic tool for TI K3 processors"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://common/k3conf.c;beginline=1;endline=34;md5=37f4e460bd8501c6f02ce71f02bc7ccf"
+
+PV = "0.1+git${SRCPV}"
+
+COMPATIBLE_MACHINE = "k3"
+
+BRANCH ?= "master"
+SRCREV = "9199c3a3b6ec5603a2c4283410b4761e79e81e82"
+
+SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+    oe_runmake CC="${CC}" CROSS_COMPILE=${TARGET_PREFIX} all
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install ${S}/k3conf ${D}${bindir}
+}
-- 
2.7.4

