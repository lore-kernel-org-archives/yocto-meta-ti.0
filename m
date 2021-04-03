Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.24622.1617408632820182145
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 503CA40C8E;
	Sat,  3 Apr 2021 00:10:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fg_KRChZ7jEW; Sat,  3 Apr 2021 00:10:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C43740C5E;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3081B174581;
	Fri,  2 Apr 2021 20:10:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 09/11] edma3-lld: suppress ldflags QA error
Date: Fri,  2 Apr 2021 20:10:01 -0400
Message-Id: <1617408603-2482-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Resolves:
QA Issue: File /usr/lib/libedma3rm.so.1.0.0 in package edma3-lld doesn't have GNU_HASH (didn't pass LDFLAGS?)
QA Issue: File /usr/lib/libedma3.so.1.0.0 in package edma3-lld doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
QA Issue: File /usr/bin/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg in package edma3-lld-test doesn't have GNU_HASH (didn't pass LDFLAGS?)
QA Issue: File /usr/bin/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg in package edma3-lld-test doesn't have GNU_HASH (didn't pass LDFLAGS?)
QA Issue: File /usr/bin/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg in package edma3-lld-test doesn't have GNU_HASH (didn't pass LDFLAGS?)
QA Issue: File /usr/bin/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg in package edma3-lld-test doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/edma3-lld/edma3-lld_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
index 38db2e2..886f060 100644
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -73,3 +73,6 @@ do_install () {
 	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg \
 		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
 }
+
+INSANE_SKIP_${PN} += "ldflags"
+INSANE_SKIP_${PN}-test += "ldflags"
-- 
2.7.4

