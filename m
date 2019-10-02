Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EA8CE00D16; Wed,  2 Oct 2019 14:34:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39426E00B9E
	for <meta-ti@yoctoproject.org>; Wed,  2 Oct 2019 14:34:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 621B040BF9;
	Wed,  2 Oct 2019 21:34:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RM5d6THdcXwE; Wed,  2 Oct 2019 21:34:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ECFDC40B37;
	Wed,  2 Oct 2019 21:34:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F3FBC171DFB;
	Wed,  2 Oct 2019 17:34:20 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  2 Oct 2019 17:34:20 -0400
Message-Id: <1570052060-33313-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] rwmem: moved to meta-oe, remove
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
X-List-Received-Date: Wed, 02 Oct 2019 21:34:25 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/rwmem/rwmem_1.2.bb | 27 ---------------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb

diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
deleted file mode 100644
index 0545b0c..0000000
--- a/recipes-bsp/rwmem/rwmem_1.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "A small tool to read/write memory"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS += "python3"
-
-PV .= "+git${SRCPV}"
-
-SRCREV_rwmem = "cc296c5366a35a4c4271cfa3cc9831f6f34bfd9d"
-SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
-SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
-
-SRCREV_FORMAT = "rwmem_inih_pybind11"
-
-SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
-           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
-           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
-           "
-
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig
-
-do_install() {
-	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
-	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
-}
-- 
2.7.4


