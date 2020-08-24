Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.68.1598290259185384881
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EDE240C24;
	Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49_RlcXUXf00; Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8644640C27;
	Mon, 24 Aug 2020 17:30:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EF97117446C;
	Mon, 24 Aug 2020 13:30:55 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 03/14] Revert "ti-pdk-fetch: update to 07.00.00.34"
Date: Mon, 24 Aug 2020 13:30:38 -0400
Message-Id: <1598290249-23943-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 380d55bd0aee5105e16c996bd4e8d79357b8389f.
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index fae3230..e169a1f 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "0d2591302b03ddae9a25300818e03345658b9083"
+TI_PDK_SRCREV ?= "23c6a7730bee4db18fab03f5ea0b73a78e054cb6"
 
-TI_PDK_VERSION ?= "07.00.00.34"
+TI_PDK_VERSION ?= "07.00.00.24"
 
 PV = "${TI_PDK_VERSION}"
 PE = "1"
-- 
2.7.4

