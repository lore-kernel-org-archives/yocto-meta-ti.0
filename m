Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.62.1580337502182010480
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 14:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7406E01661; Wed, 29 Jan 2020 14:38:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC111E0165D
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 14:38:19 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B4D4140A4E;
	Wed, 29 Jan 2020 22:38:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28jSSKLHFdOH; Wed, 29 Jan 2020 22:38:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 918DE4006B;
	Wed, 29 Jan 2020 22:38:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E016E1711A7;
	Wed, 29 Jan 2020 17:38:16 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] jailhouse: switch to Python3 dependencies
Date: Wed, 29 Jan 2020 17:38:16 -0500
Message-Id: <1580337496-16026-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

python-argparse is not available in oe-core, but meta-python provides a
drop-in replacement python3-configargparse, if needed. meta-ti does not
depend on meta-python for now - can be adjusted in the distro layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 4186dc3..ed23cde 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -18,18 +18,18 @@ SRC_URI = " \
     git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
 "
 
-DEPENDS = "virtual/kernel dtc-native python-mako-native python-mako make-native"
+DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
 RDEPENDS_${PN} += "\
-	python-curses\
-	python-datetime\
-	python-argparse\
-	python-mmap\
+	python3-curses\
+	python3-datetime\
+	python3-mmap\
 "
 
-S = "${WORKDIR}/git"
-
 require jailhouse-arch.inc
-inherit module pythonnative bash-completion deploy setuptools
+inherit module python3native bash-completion deploy setuptools3
+
+S = "${WORKDIR}/git"
+B = "${S}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "(ti-soc)"
@@ -88,7 +88,7 @@ do_compile() {
 
 do_install() {
 	# Install pyjailhouse python modules needed by the tools
-	distutils_do_install
+	distutils3_do_install
 
 	# We want to install the python tools, but we do not want to use pip...
 	# At least with v0.10, we can work around this with
@@ -141,8 +141,8 @@ FILES_${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /b
 FILES_pyjailhouse = "${PYTHON_SITEPACKAGES_DIR}"
 FILES_${PN}-tools = "${libexecdir}/${BPN}/${BPN}-*"
 
-RDEPENDS_${PN}-tools = "pyjailhouse python-mmap python-math python-argparse python-datetime python-curses python-compression"
-RDEPENDS_pyjailhouse = "python-core python-ctypes python-fcntl python-shell"
+RDEPENDS_${PN}-tools = "pyjailhouse python3-mmap python3-math python3-datetime python3-curses python3-compression"
+RDEPENDS_pyjailhouse = "python3-core python3-ctypes python3-fcntl python3-shell"
 
 RRECOMMENDS_${PN} = "${PN}-tools"
 
-- 
2.7.4

