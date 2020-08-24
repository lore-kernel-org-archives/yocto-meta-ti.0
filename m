Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.53.1598290259211356504
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ABEB040C27;
	Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CN4b-933n4Ai; Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9360040C4C;
	Mon, 24 Aug 2020 17:30:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0628617446D;
	Mon, 24 Aug 2020 13:30:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 04/14] Revert "ti-pdk-fetch: update to REL.CORESDK.07.00.00.24 tag"
Date: Mon, 24 Aug 2020 13:30:39 -0400
Message-Id: <1598290249-23943-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 1d66c14e43bc7a3737de296eb43b7d8672b45e90.
---
 classes/ti-pdk-fetch.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index e169a1f..7a27e37 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,12 +1,11 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "23c6a7730bee4db18fab03f5ea0b73a78e054cb6"
+TI_PDK_SRCREV ?= "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
 
-TI_PDK_VERSION ?= "07.00.00.24"
+TI_PDK_VERSION ?= "2020.5.6"
 
 PV = "${TI_PDK_VERSION}"
-PE = "1"
 
 TI_PDK_COMP ?= ""
 TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
-- 
2.7.4

