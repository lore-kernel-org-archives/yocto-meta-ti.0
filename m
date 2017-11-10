Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3A26E00CEF; Fri, 10 Nov 2017 10:35:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B656FE00CC4
	for <meta-ti@yoctoproject.org>; Fri, 10 Nov 2017 10:35:12 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E75B20A40;
	Fri, 10 Nov 2017 18:35:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0-70LCzYB6D0; Fri, 10 Nov 2017 18:35:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5380E204B1;
	Fri, 10 Nov 2017 18:35:10 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C9627162717;
	Fri, 10 Nov 2017 13:35:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Nov 2017 13:35:09 -0500
Message-Id: <1510338909-15798-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-ipc-examples-linux: explicitly depend on zip-native used during install
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
X-List-Received-Date: Fri, 10 Nov 2017 18:35:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc-examples-linux_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
index 2340206..4701eba 100644
--- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running bios"
 require ti-ipc-examples.inc
 
-DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos"
+DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos zip-native"
 
 do_compile_append() {
 
-- 
2.7.4


