Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.150.1596643928577306241
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 09:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E05F940C2B;
	Wed,  5 Aug 2020 16:12:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzWYbCAU374o; Wed,  5 Aug 2020 16:12:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53E9A40C2C;
	Wed,  5 Aug 2020 16:12:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F3813173BE2;
	Wed,  5 Aug 2020 12:12:04 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 3/4] ti-sci-fw: rename k2g specific version with PV in the name
Date: Wed,  5 Aug 2020 12:12:02 -0400
Message-Id: <1596643923-30297-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596643923-30297-1-git-send-email-denis@denix.org>
References: <1596643923-30297-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti-sci-fw/{ti-sci-fw_git.bb => ti-sci-fw_0.1.1.50.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw_git.bb => ti-sci-fw_0.1.1.50.bb} (100%)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
similarity index 100%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
-- 
2.7.4

