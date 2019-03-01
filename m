Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA246E009A0; Fri,  1 Mar 2019 09:18:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56538E0095C
	for <meta-ti@yoctoproject.org>; Fri,  1 Mar 2019 09:18:59 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A15F040B37;
	Fri,  1 Mar 2019 17:18:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zL0oHaiBvss4; Fri,  1 Mar 2019 17:18:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 84FA840A55;
	Fri,  1 Mar 2019 17:18:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BC1B016B126;
	Fri,  1 Mar 2019 12:18:56 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri,  1 Mar 2019 12:18:56 -0500
Message-Id: <1551460736-16483-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] gcc-arm-none-eabi: not supported on any target
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
X-List-Received-Date: Fri, 01 Mar 2019 17:18:59 -0000

This package is only meant for native and nativesdk usage.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
index ae3d1d7..d08dd2f 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
@@ -14,6 +14,7 @@ S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
 
 # only x86_64 is supported
 COMPATIBLE_HOST = "x86_64.*-linux"
+COMPATIBLE_HOST_class-target = "null"
 
 do_install() {
     install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
-- 
2.7.4


