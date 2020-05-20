Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8612.1589962340640622851
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 17D8040C29;
	Wed, 20 May 2020 08:12:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piYVaTo9yo04; Wed, 20 May 2020 08:12:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F1F1F40C3E;
	Wed, 20 May 2020 08:12:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2A5E717320C;
	Wed, 20 May 2020 04:12:17 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 8/8] ti-pdk-fetch: update to 2020.5.18 tag REL.CORESDK.07.00.00.06
Date: Wed, 20 May 2020 04:11:48 -0400
Message-Id: <1589962308-54665-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589962308-54665-1-git-send-email-denis@denix.org>
References: <1589962308-54665-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 7a27e37..5047743 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
+TI_PDK_SRCREV ?= "933b714cb3f97454c6ac6950dca454e936866d47"
 
-TI_PDK_VERSION ?= "2020.5.6"
+TI_PDK_VERSION ?= "2020.5.18"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.7.4

