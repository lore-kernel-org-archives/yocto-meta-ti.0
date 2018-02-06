Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C311EE00E7B; Mon,  5 Feb 2018 18:14:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A0C4E00DB7
	for <meta-ti@yoctoproject.org>; Mon,  5 Feb 2018 18:14:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C537320B05;
	Tue,  6 Feb 2018 02:14:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mPiADrBWLZQK; Tue,  6 Feb 2018 02:14:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DBE3208FD;
	Tue,  6 Feb 2018 02:14:52 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2A61B1631FD;
	Mon,  5 Feb 2018 21:14:52 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon,  5 Feb 2018 21:14:51 -0500
Message-Id: <1517883291-24104-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] ti-cg-xml: inhibit all stripping
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
X-List-Received-Date: Tue, 06 Feb 2018 02:14:55 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/ti-cg-xml_2.41.00.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
index a0387b7..d3c3ffe 100644
--- a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
+++ b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
@@ -34,4 +34,8 @@ FILES_${PN} += "${CG_XML_INSTALL_DIR_RECIPE}"
 
 INSANE_SKIP_${PN} = "arch ldflags"
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


