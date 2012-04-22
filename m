Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06DDCE013D9
	for <meta-ti@yoctoproject.org>; Sun, 22 Apr 2012 05:50:13 -0700 (PDT)
Received: by werc1 with SMTP id c1so9440787wer.35
	for <meta-ti@yoctoproject.org>; Sun, 22 Apr 2012 05:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=3fSOkqvVq81YerR/Rt2BGyeORxauMlqPX7Kqzh1ijU8=;
	b=Tq4Ek6PTeQApGfms4r9pLr/yL+tffuGHm+EOnpZCIgwPCsuLfeAUnm80sds+aGJNJ7
	kr4oHq07InDJpcc0MOVg4+f7DBv+sSXTXxJbHFEyo9SBoCS2be7TB3khEQ8ZY/jkXZX+
	OBoMGkhTXT38Achw5T9dWd+Wr1SfTFUdCM+cS+SElodJEsz2F6+OM74VvoDMkJ07ujW/
	4eJDzL9JUIWgbZxRXJBMas1FMVCVWO3sAdsg/Lc/rv94HJLsQ42Uegh3vTX8/xpvESq5
	K4jI/DOLg+5LlJUUDHOsXRcN+NQxpIMk82ysUweI5JvfdtDR0s8yvXjEvf0crzhgDrhD
	V04g==
Received: by 10.180.106.9 with SMTP id gq9mr13056047wib.17.1335099013020;
	Sun, 22 Apr 2012 05:50:13 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id j3sm22320121wiw.1.2012.04.22.05.50.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Apr 2012 05:50:12 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 22 Apr 2012 14:50:06 +0200
Message-Id: <1335099006-27041-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335099006-27041-1-git-send-email-koen@dominion.thruhere.net>
References: <1335099006-27041-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmntsM0LcT3o15N/+kwJptIs3f/RSx6iRoLs3TBuyBc3kzz1HeWwoJ9dDxHVyxPULlnwJcb
Cc: denys@ti.com
Subject: [PATCH 2/2] bonescript: update to latest git
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
X-List-Received-Date: Sun, 22 Apr 2012 12:50:14 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/bonescript.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
index b1e92df..72bcab0 100644
--- a/recipes-misc/payload/bonescript.bb
+++ b/recipes-misc/payload/bonescript.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
 
-PR = "r14"
+PR = "r15"
 
 inherit systemd
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=659ee0c98db2664403c769d6b9ab50eb"
 
-SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-ca0f663083cea4e434864aa276d46ff79d471dff.tar.bz2 \
+SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-6af82b41178c37644399b19039ea7e80c1dbf8ee.tar.bz2 \
            file://bonescript-git \
            file://bone101.service \
           "
-SRC_URI[md5sum] = "2b7edd83a752eaf0be0c7488d32c7e72"
-SRC_URI[sha256sum] = "839ee1147b83924f259dc5e373d73eb0eaa6ece76322dc156a6b04113fa89a91"
+SRC_URI[md5sum] = "e5e214857afbd2e59b52171e60810be2"
+SRC_URI[sha256sum] = "e703416a63406c8b6c89fb1079406833ce6a9eb0ae1ba0a55fe3802b83186c50"
 
 S = "${WORKDIR}/bonescript"
 
-- 
1.7.10


