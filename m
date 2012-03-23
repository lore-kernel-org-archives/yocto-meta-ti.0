Return-Path: <tom.rini@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD39DE013A3
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:37:01 -0700 (PDT)
Received: by ghbz10 with SMTP id z10so3820734ghb.35
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=p9B0A2+Z3WzjIVRuYr7gIjtyJYe7RpSbgtxo7G5baek=;
	b=nADWLiY+NlguX+YnkWdabZEd8h7s+l3WLfLXwjNHGOkCxdP4tPhSRPXicHSvJ9CX8J
	LkmMKMSr18lZaumzaovukWKC3HvFQKeAhBvto8RHPjRZi4t7s5KTjANzOtzFVw1FAo8e
	tHfx9sKNiUFiwcx5g2VigoZcUjVEX3ORaJ0ZygMPJxN0gCD2rssIPT2leqJp1NvtmXk0
	/rvemlfCdDomBHpdkg+3ABOXORGWsClTD/hX4t3Km18QodNvwSNLv/rWUkx+zyXjjxzT
	R8tjiXdZ3skPMl3r1F78pHmnvTg2gfvAeZrUod6lCyKjcWEU91Fhyu6DmWmot916Q1Gk
	A6zA==
Received: by 10.60.4.134 with SMTP id k6mr15677637oek.19.1332524221298;
	Fri, 23 Mar 2012 10:37:01 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id d9sm8324697obq.0.2012.03.23.10.37.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:37:00 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Mar 2012 10:36:57 -0700
Message-Id: <1332524217-27534-4-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331235244-5173-1-git-send-email-trini@ti.com>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
Subject: [PATCH v2 4/4] am335x-evm.conf: Add 'ubi' to IMAGE_FSTYPES, use '=' in assignment
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 17:37:02 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
a machine conf file should use '=' to set IMAGE_FSTYPES.  We also add
the required MKUBIFS_ARGS / UBINIZE_ARGS.  These are placed next to the
line that sets us to use the PSP kernel tree and reference the TI wiki
for the source of our info as well as dmesg / userland commands.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/am335x-evm.conf |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index eedf072..9111853 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -12,12 +12,33 @@ GUI_MACHINE_CLASS = "smallscreen"
 
 require conf/machine/include/ti33x.inc
 
-IMAGE_FSTYPES ?= "tar.bz2"
+IMAGE_FSTYPES = "ubi tar.bz2"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 
+# UBI information.  Note that this is board and kernel specific.  Changes
+# in your kernel port may require changes in these variables.  For more
+# details about this board please see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1988 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 1988"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 UBOOT_ARCH = "arm"
-- 
1.7.0.4


