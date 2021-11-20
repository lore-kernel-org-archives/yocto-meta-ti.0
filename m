Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3412.1637378779324188030
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CC1C240C56
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRclJZBUHR_P for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0C9C840C93
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C9F471746DC
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 26/26] j7-hs-evm: Correct image boot file causing build error
Date: Fri, 19 Nov 2021 22:26:11 -0500
Message-Id: <1637378771-24987-27-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Correct the boot image file that is causing build error

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/j7-hs-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index ab0fa47..f2e3ccf 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -23,7 +23,7 @@ BBMULTICONFIG += "k3r5-sr1-1"
 
 # Use default IMAGE_BOOT_FILES_LEGACY files
 # Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
-IMAGE_BOOT_FILES += "sysfw-j7-hs-evm.itb"
+IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
 
-- 
2.7.4

