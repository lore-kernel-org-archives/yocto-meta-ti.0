Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 862CCE00AE0
	for <meta-ti@yoctoproject.org>; Thu,  6 Mar 2014 03:03:45 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s26B3igR019318
	for <meta-ti@yoctoproject.org>; Thu, 6 Mar 2014 05:03:44 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s26B3hHi017856
	for <meta-ti@yoctoproject.org>; Thu, 6 Mar 2014 05:03:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 6 Mar 2014 05:03:43 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s26B3hv8007650;	Thu, 6 Mar 2014 05:03:43 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Mar 2014 06:03:42 -0500
Message-ID: <1394103822-10926-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] keystone-evm: Update NAND size to 256 MB
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
X-List-Received-Date: Thu, 06 Mar 2014 11:03:46 -0000
Content-Type: text/plain

- The keystone-evm actually has 256 MB Nand
   ( Changing from previous size of 128 MB)
- LEB calculated with reserved 10 MB for boot and 20 MB
  for receovery image

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 conf/machine/keystone-evm.conf |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index c878d52..4095d7e 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -15,13 +15,12 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: smallest flash I/O unit:    2048
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
-# UBI device number 0, total 857 LEBs
-# MKUBIFS_ARGS = "-m 2048 -e 129024 -c 857"
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 857"
+# UBI device number 0, total 1764 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 1764"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
 # UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: physical eraseblock size:   262144 bytes (256 KiB)
 # UBI: sub-page size:              2048
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
-- 
1.7.9.5


