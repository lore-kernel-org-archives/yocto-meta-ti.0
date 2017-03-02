Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1043E00887; Thu,  2 Mar 2017 15:17:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17702E0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 15:17:31 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C13AF20AC4;
	Thu,  2 Mar 2017 23:17:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qAEjeziqthdI; Thu,  2 Mar 2017 23:17:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A10692088F;
	Thu,  2 Mar 2017 23:17:29 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E1F6C1623A5;
	Thu,  2 Mar 2017 18:17:28 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  2 Mar 2017 18:17:28 -0500
Message-Id: <1488496648-61231-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] conf/machine: bump Keystone max_leb_cnt by 10% to fit debug images
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Mar 2017 23:17:34 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/k2e-evm.conf  | 2 +-
 conf/machine/k2g-evm.conf  | 2 +-
 conf/machine/k2hk-evm.conf | 2 +-
 conf/machine/k2l-evm.conf  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 95b0e42..bb6b5fb 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4400"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 458dfe4..997406b 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -26,7 +26,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1926 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2200"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 6adb016..88d1608 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4400"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index b4721d0..9b00a20 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1926 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2200"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
-- 
2.7.4


