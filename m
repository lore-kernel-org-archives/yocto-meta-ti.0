Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.24623.1617408633881947235
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5FF3840A77;
	Sat,  3 Apr 2021 00:10:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCo4utTyU0lw; Sat,  3 Apr 2021 00:10:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C87740C82;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 47CB7174583;
	Fri,  2 Apr 2021 20:10:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 11/11] cuia: suppress installed-vs-shipped QA error
Date: Fri,  2 Apr 2021 20:10:03 -0400
Message-Id: <1617408603-2482-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes:
ERROR: cuia-1.0.0.13-r0 do_package: QA Issue: cuia: Files/directories were installed but not shipped in any package:
  /usr/lib/gnu.targets.arm.rtsv5T.av5T
  /usr/lib/syscalls.am3g
  /usr/lib/gnu.targets.codesourcery.rtsv5T.a470MV
  /usr/lib/syscalls.am4g
  /usr/lib/gnu.targets.codesourcery.rtsv6.av6
  /usr/lib/gnu.targets.arm.rtsv7A.av7A
  /usr/lib/syscalls.am4fg
  /usr/lib/gnu.targets.arm.rtsv7M.am4fg
  /usr/lib/gnu.targets.arm.rtsv7M.am4g
  /usr/lib/boot.am3g
  /usr/lib/gnu.targets.arm.rtsv7M.am3g
  /usr/lib/gnu.targets.arm.rtsv6.av6
  /usr/lib/boot.am4fg
  /usr/lib/boot.am4g
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
cuia: 14 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/cuia/cuia_1.0.0.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.0.13.bb
index 0422b0e..3efacb1 100644
--- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
+++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
@@ -27,4 +27,4 @@ do_install() {
 COMPATIBLE_HOST ?= "null"
 COMPATIBLE_HOST_ti-soc = "(.*)"
 
-INSANE_SKIP_${PN} += "textrel"
+INSANE_SKIP_${PN} += "textrel installed-vs-shipped"
-- 
2.7.4

