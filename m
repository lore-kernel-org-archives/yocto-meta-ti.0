Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2745.1586205429958739326
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48C0640A3A;
	Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFrIwKzDdUSi; Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EA5F40BDF;
	Mon,  6 Apr 2020 20:37:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B1FEC1718FE;
	Mon,  6 Apr 2020 16:37:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 3/8] dspdce-fw: require dsp machine feature, cleanup
Date: Mon,  6 Apr 2020 16:37:00 -0400
Message-Id: <1586205425-55562-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586205425-55562-1-git-send-email-denis@denix.org>
References: <1586205425-55562-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 2756c2d..6ddbe68 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -1,9 +1,13 @@
-DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
+SUMMARY = "Firmware for DSP for an example application called copycodectest"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://src/ti/framework/dce/dce.c;startline=1;endline=31;md5=2c6e9aba6ed75f22b1a2b7544b1c809d"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+
 SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
 
 SRCREV = "de6e599f067b25c46cc0c8f74a22cc3b8aafbae8"
-- 
2.7.4

