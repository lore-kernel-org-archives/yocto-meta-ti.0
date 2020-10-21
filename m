Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1288.1603317323031424575
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 14:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2BED640BD6;
	Wed, 21 Oct 2020 21:55:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bcz4myaP7SIf; Wed, 21 Oct 2020 21:55:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 16F2840C2B;
	Wed, 21 Oct 2020 21:55:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C8B671744AC;
	Wed, 21 Oct 2020 17:55:20 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 3/3] conf/machine: also build optee-os for legacy HS platforms
Date: Wed, 21 Oct 2020 17:55:09 -0400
Message-Id: <1603317309-52625-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603317309-52625-1-git-send-email-denis@denix.org>
References: <1603317309-52625-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Add build dependency on optee-os for legacy HS platforms in non-Arago setups.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am437x-hs-evm.conf | 2 ++
 conf/machine/am57xx-hs-evm.conf | 2 ++
 conf/machine/dra7xx-hs-evm.conf | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
index 0a8ca06..68b808d 100644
--- a/conf/machine/am437x-hs-evm.conf
+++ b/conf/machine/am437x-hs-evm.conf
@@ -16,3 +16,5 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
 OPTEEMACHINE = "ti-am43xx"
 OPTEEFLAVOR = "am43xx"
 OPTEEOUTPUTMACHINE = "ti"
+
+EXTRA_IMAGEDEPENDS += "optee-os"
diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index d4f6e09..5232cbd 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -17,3 +17,5 @@ OPTEEMACHINE = "ti-am57xx"
 OPTEEFLAVOR = "am57xx"
 OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
+
+EXTRA_IMAGEDEPENDS += "optee-os"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index da4000f..4963008 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -17,3 +17,5 @@ OPTEEMACHINE = "ti-dra7xx"
 OPTEEFLAVOR = "dra7xx"
 OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
+
+EXTRA_IMAGEDEPENDS += "optee-os"
-- 
2.7.4

