Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3297.1637290745426388843
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF94840C60
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JlowqyhdgbC0 for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 51EC440C83
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 217371746D6
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 10/20] recipes-bsp: u-boot-ti-mainline: Update to v2021.10 release
Date: Thu, 18 Nov 2021 21:58:51 -0500
Message-Id: <1637290741-8603-11-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Amjad Ouled-Ameur <aouledameur@baylibre.com>

This introduces a critical fix for both AM335X EVM and AM43XX EVM, which
can no longer boot because "uuid" is undefined.

v2021.10 has these two fixes, one for each platform:
- commit ff8f277e9121 ("ti: am335x_evm: Switch to DISTRO_BOOT only")
- commit e0c91ae24e5b ("ti: am43xx_evm: Switch to DISTRO_BOOT only")

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 2db9899..76aaa4b 100644
--- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
 PR = "r0"
 
-PV = "2021.07"
+PV = "2021.10"
 
 # For the un-initiated:
 # The actual URL you'd use with a git clone for example would be:
@@ -15,4 +15,4 @@ PV = "2021.07"
 # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
-SRCREV = "840658b093976390e9537724f802281c9c8439f5"
+SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
-- 
2.7.4

