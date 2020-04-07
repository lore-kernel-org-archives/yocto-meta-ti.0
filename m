Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.367.1586293948334203938
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 14:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7EC4140A9E;
	Tue,  7 Apr 2020 21:12:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmnksDKLI2gq; Tue,  7 Apr 2020 21:12:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 52A0B40A3A;
	Tue,  7 Apr 2020 21:12:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A969316E1CC;
	Tue,  7 Apr 2020 17:12:25 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] openmp-rtos: require dsp machine and openmp distro features
Date: Tue,  7 Apr 2020 17:12:25 -0400
Message-Id: <1586293945-31374-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/openmp-rtos/openmp-rtos_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 67d9edf..0c93f35 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -4,6 +4,11 @@ LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+REQUIRED_DISTRO_FEATURES = "openmp"
+
 PV = "2_06_03_00"
 PR = "r0"
 
-- 
2.7.4

