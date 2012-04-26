Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A76A0E0030B
	for <meta-ti@yoctoproject.org>; Wed, 25 Apr 2012 23:06:15 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so746949wib.11
	for <meta-ti@yoctoproject.org>; Wed, 25 Apr 2012 23:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Kf9i8WWXvwcvCq6uGhrAvBjZ37IDq3ZHEOpFV0yFCS0=;
	b=cedMowlekMYmFJhIgfc8Z9ElY+MpYrT6n/w0MIeZ4jO+77oHzSCCuInOOM2J3qaE5l
	9M+prN2UxiSSsonq6vc3uyFPq1Uz4PLbQJOi8si6uLRF51+4fiiq6gkr4j31ybl/8r9l
	bijLuL7ONbTez+SOA37B4YioziXxPI/HaggI8SVjMSw3hG9KogwDHmNGtvfV2ad2nkqU
	MyJNGWkJgEGkMz3IaVx3MS8rSFPOGocqpbKXqt0d3OS+jx1TkqRRFJBkOBCWHtB75hAu
	IGD2/bP6j6W4MjJRbzJiOFjiUjyIyeeEGPCSQdsjqZ1jvb/k+4NQuX9CKFybgKPK70Wm
	rHiA==
Received: by 10.216.134.2 with SMTP id r2mr3437171wei.31.1335420374019;
	Wed, 25 Apr 2012 23:06:14 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id o2sm7521561wiv.11.2012.04.25.23.06.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Apr 2012 23:06:12 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Apr 2012 08:06:03 +0200
Message-Id: <1335420363-8178-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmTD0q5rfwoy9nfupG2tUiCdt+lAcy7BbKzzhepDuzrRdcE4lCkidO3YqvB5YPjSMRQU0zP
Cc: denys@ti.com
Subject: [PATCH] libgles-omap3: add missing libdrm dependency
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
X-List-Received-Date: Thu, 26 Apr 2012 06:06:16 -0000

dpkg-deb -I shows:

 Package: libgles-omap3
 Version: 4.05.00.03-r26
 Depends: libgles-omap3-flipwsegl, devmem2, update-rc.d, libdrm2 (>= 2.4.31), libgles-omap3-linuxfbwsegl, fbset, libc6 (>= 2.12), libgles-omap3-blitwsegl, libgles-omap3-frontwsegl

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index fbd931f..93cb091 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,11 +3,11 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r26"
+PR = "r27"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
-DEPENDS = "virtual/libx11 libxau libxdmcp"
+DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
 
 PROVIDES += "virtual/egl"
 
-- 
1.7.10


