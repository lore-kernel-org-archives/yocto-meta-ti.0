Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80568E00B26
	for <meta-ti@yoctoproject.org>; Fri,  7 Mar 2014 13:53:24 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27LrO7h017719
	for <meta-ti@yoctoproject.org>; Fri, 7 Mar 2014 15:53:24 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27LrNxh016720
	for <meta-ti@yoctoproject.org>; Fri, 7 Mar 2014 15:53:24 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 15:53:23 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s27LrNh5030325;	Fri, 7 Mar 2014 15:53:23 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 7 Mar 2014 16:53:22 -0500
Message-ID: <1394229202-23032-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] keystone-evm: Update NAND size to 512 MB
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
X-List-Received-Date: Fri, 07 Mar 2014 21:53:25 -0000
Content-Type: text/plain

- The keystone-evm actually has 512 MB Nand
   ( Changing from previous size of 128 MB)
- LEB calculated with reserved 10 MB for boot and 20 MB
  for receovery image

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
* Corrected actual size from 256 MB to 512 MB
* Reverted back Erase block size
---
---
 conf/machine/keystone-evm.conf |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index c878d52..088e524 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -15,9 +15,8 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: smallest flash I/O unit:    2048
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
-# UBI device number 0, total 857 LEBs
-# MKUBIFS_ARGS = "-m 2048 -e 129024 -c 857"
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 857"
+# UBI device number 0, total 3856 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
-- 
1.7.9.5


