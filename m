Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1507.1639602665253683121
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85F4840C53
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMppEJrq9TFf for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7A51A40A3D
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6B163174719
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 01/11] pru-icss_git.bb: update to PSSP v6.0.1
Date: Wed, 15 Dec 2021 16:10:53 -0500
Message-Id: <1639602663-32787-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639602663-32787-1-git-send-email-denis@denix.org>
References: <1639602663-32787-1-git-send-email-denis@denix.org>

From: Nick Saulnier <nsaulnier@ti.com>

Found a bug in the PRU_ICSSG examples in PSSP v6.0.0, fixed in v6.0.1.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 8d550fd..b690291 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "acd8479d7f3bdbb4536ceca3cd6803662babaa5a"
+SRCREV = "8eee431384b6a1a9c96ae91a8e99485176b4d2b3"
 
-PV = "6.0.0"
+PV = "6.0.1"
 PR = "r0"
 
 require recipes-ti/includes/ti-paths.inc
-- 
2.7.4

