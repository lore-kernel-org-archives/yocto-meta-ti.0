Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.20764.1643238559539686258
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0068240CC3;
	Wed, 26 Jan 2022 23:09:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCu0iLagNucu; Wed, 26 Jan 2022 23:09:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2F9140CBF;
	Wed, 26 Jan 2022 23:09:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B90A717472E;
	Wed, 26 Jan 2022 18:09:16 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 6/7] meta-ti: move cuia to meta-ti-extras
Date: Wed, 26 Jan 2022 18:09:09 -0500
Message-Id: <1643238550-20765-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238550-20765-1-git-send-email-denis@denix.org>
References: <1643238550-20765-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Move TI Unified Instrumentation Architecture in C (cUIA) to meta-ti-extras under
recipes-devtools.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp => meta-ti-extras/recipes-devtools}/cuia/cuia_1.0.0.13.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-ti-bsp/recipes-bsp => meta-ti-extras/recipes-devtools}/cuia/cuia_1.0.0.13.bb (100%)

diff --git a/meta-ti-bsp/recipes-bsp/cuia/cuia_1.0.0.13.bb b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/cuia/cuia_1.0.0.13.bb
rename to meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
-- 
2.7.4

