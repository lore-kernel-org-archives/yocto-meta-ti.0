Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9A30E00E31; Thu,  1 Mar 2018 12:13:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41784E0047F
	for <meta-ti@yoctoproject.org>; Thu,  1 Mar 2018 12:13:33 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 54CBB2086C;
	Thu,  1 Mar 2018 20:13:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WqVMXFb7wsdc; Thu,  1 Mar 2018 20:13:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 262FD20862;
	Thu,  1 Mar 2018 20:13:31 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5E3361632C1;
	Thu,  1 Mar 2018 15:13:31 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  1 Mar 2018 15:13:30 -0500
Message-Id: <1519935210-42085-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] eudev: simplify by using ti-soc override
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
X-List-Received-Date: Thu, 01 Mar 2018 20:13:34 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-core/udev/eudev_%.bbappend | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
index 620500b..fc68b90 100644
--- a/recipes-core/udev/eudev_%.bbappend
+++ b/recipes-core/udev/eudev_%.bbappend
@@ -7,23 +7,7 @@ SRC_URI_append = " \
 
 PR_append = ".3"
 
-install_ti_rules() {
+do_install_append_ti-soc() {
     install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
     install -m 0644 ${WORKDIR}/firmware.rules ${D}${sysconfdir}/udev/rules.d/
 }
-
-do_install_append_ti33x() {
-    install_ti_rules
-}
-
-do_install_append_ti43x() {
-    install_ti_rules
-}
-
-do_install_append_omap-a15() {
-    install_ti_rules
-}
-
-do_install_append_keystone() {
-    install_ti_rules
-}
-- 
2.7.4


