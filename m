Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AADEEE0140E
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 01:59:52 -0700 (PDT)
Received: by wibhn14 with SMTP id hn14so177015wib.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 01:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=8K0mIY4iWmZTtMw93sbWWwwGq3mrPQ/jVPictz1ZiZE=;
	b=ctMzCMmbIBwFy0SHLYyXxjCpAlD3dXMeGarc0+CwSzJDPrZCHIc1KmllAe2cETlF9R
	FHTbeAEc1t+6bmjkfzeJ8jU2Obw0j8yDN3GRj/IN4tR4kVE1Vn1cCdgf6Ol7yX3DrGOB
	ILe1OT626Y60S8JGFgddhXLhmZZ8wLyWxS7sEyF8iLDByHuVF2R6EqOO+uO50eAUt6U2
	o0gDPV+XUJg15mP6GPR4YjQe94q+SJ+euLi/T6ZcyBLnKvV2pwnbJ5FPWSb4BGB30z1t
	OXgdbEVP4W2rCoInUNNUpa4pDHB7dIhql6YcM5QaQQdtHkUkwY+/OWe5OV7CQSPoJxik
	Wu2g==
Received: by 10.180.98.137 with SMTP id ei9mr7643967wib.0.1336640390856;
	Thu, 10 May 2012 01:59:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 6sm1964868wiz.1.2012.05.10.01.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 01:59:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:23 +0200
Message-Id: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQma80JiKcAoHbhJzGhykGEo7MbXGZN5CK84dNOrgw4Vx0GetYlqRkQIrATAAqZLoFGg3zm3
Cc: denys@ti.com
Subject: [PATCH v3 01/13] sdcard_image bbclass: make ext4 the default
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
X-List-Received-Date: Thu, 10 May 2012 08:59:53 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 classes/sdcard_image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 519bd9a..f9b8d46 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -19,7 +19,7 @@ LOOPDEV_FS ?= "/dev/loop3"
 SDIMG_SIZE ?= "444" 
 
 # FS type for rootfs
-ROOTFSTYPE ?= "ext3"
+ROOTFSTYPE ?= "ext4"
 
 BOOTPARTNAME_beaglebone = "BEAGLE_BONE"
 BOOTPARTNAME ?= "${MACHINE}"
-- 
1.7.10


