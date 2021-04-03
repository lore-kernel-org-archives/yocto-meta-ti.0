Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24546.1617408632046225027
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E84A40A77;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGbW0SmVFV-V; Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 39A7240C8E;
	Sat,  3 Apr 2021 00:10:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 24AB0174580;
	Fri,  2 Apr 2021 20:10:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 08/11] vis: suppress "ldflags" QA error
Date: Fri,  2 Apr 2021 20:10:00 -0400
Message-Id: <1617408603-2482-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

It is a pre-built binary, hence no control over passing correct LDFLAGS.
This used to be a warning and recently became an error. Fixes:
ERROR: vis-01.50.07.15-r1 do_package_qa: QA Issue: File /usr/bin/RadioApp in package vis doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/vis-fw/vis_01.50.07.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 6eaf8de..3cd5648 100644
--- a/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -29,6 +29,7 @@ RDEPENDS_${PN} += "${PN}-fw"
 
 FILES_${PN}-fw += "${base_libdir}/firmware/${DSPAPP}"
 
+INSANE_SKIP_${PN} = "ldflags"
 INSANE_SKIP_${PN}-fw = "arch"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.7.4

