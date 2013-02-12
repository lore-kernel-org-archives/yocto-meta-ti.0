Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id E61DBE002AB
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:51 -0800 (PST)
Received: by mail-oa0-f45.google.com with SMTP id o6so7028960oag.18
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=7DZDTUN193Tw4cqVTQw5iiByXzP+ejYsBZr8d5zKEgs=;
	b=RuujOnMM/t0Dl1q/xVLWWBG4DtyiBQpa481qtW/3xbKI7lpTJVO1ByB+YiMfDWfE6o
	PhXCijBnDNrZvgfieUdWr9ZjTg1ELzZag1Ad+9PIVkBAZtaLo849ia2cBpCeLYSDeFQl
	67dPVmIMl4AIcHvY0zzpT/tjXqTWLcjwKP4gko/JKqwTtBdfXocaHGdgcZgl8zY+YHZ5
	CaJJQZu13pQQw+kzd4R+ohiClr+aSwYINxCvzr2T6TfvWYCz6m6lvu1GiGN8tcemeQIH
	uhffbFt57/HCvl0SOdkilKe/UzU2NrNHIyL/i8oAHoHhx2SlL17h13kOUAJF5E+285Ey
	17SQ==
X-Received: by 10.60.169.229 with SMTP id ah5mr12412082oec.66.1360631090792;
	Mon, 11 Feb 2013 17:04:50 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v2sm51155307obl.10.2013.02.11.17.04.47
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 17:04:49 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Mon, 11 Feb 2013 19:04:36 -0600
Message-Id: <1360631082-29015-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 1/7] machine config: Correct SERIAL_CONSOLE variable for am3517-evm and am37x-evm
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
X-List-Received-Date: Tue, 12 Feb 2013 01:04:52 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* When testing on am37x-evm I noticed that no prompt to login was ever shown
  when connected via serial port.
* I finally noticed that the SERIAL_CONSOLE variable was set incorrectly and
  didn't match the value in the old Arago layer.
* After using the values specific in the machine file in the Arago layer I was
  able to login via serial port.
* This has been verified on both the am37x-evm and am3517-evm.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 conf/machine/am3517-evm.conf |    2 +-
 conf/machine/am37x-evm.conf  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index e817069..536d337 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -19,7 +19,7 @@ require conf/machine/include/omap3.inc
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLE = "115200 ttyO2"
 USE_VT = "2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index 9a1acb4..866abc5 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -19,7 +19,7 @@ require conf/machine/include/omap3.inc
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLE = "115200 ttyO0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
-- 
1.7.0.4


