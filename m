Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21484.1584552424022538713
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 10:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 64.68.198.64, mailfrom: denys@ti.com)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 14C6440C1E;
	Wed, 18 Mar 2020 17:27:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7zc-aDXpZGk; Wed, 18 Mar 2020 17:27:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E091940C0C;
	Wed, 18 Mar 2020 17:27:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 169B117126C;
	Wed, 18 Mar 2020 13:27:01 -0400 (EDT)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [thud][PATCH] am335x-evm, am437x-evm: bump max_leb_cnt
Date: Wed, 18 Mar 2020 13:27:00 -0400
Message-Id: <1584552420-31064-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf | 2 +-
 conf/machine/am437x-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 8bfbee8..3cb97d3 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -24,7 +24,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 9900"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 10200"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index e7d3a98..bd1053a 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 4800"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5000"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:
-- 
2.7.4

