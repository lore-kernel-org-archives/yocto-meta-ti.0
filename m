Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AEB2E013AD
	for <meta-ti@yoctoproject.org>; Sun, 22 Apr 2012 05:50:12 -0700 (PDT)
Received: by wibhr17 with SMTP id hr17so1928581wib.5
	for <meta-ti@yoctoproject.org>; Sun, 22 Apr 2012 05:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=UkERKr8j2sAEQ6g2r0qxSGBWAAb0cReCTXzT+4QF/pY=;
	b=mJMQShXT4Sul9X5Ds2Gd1mes7bafGx0x2IlaxwUUQ2q0kD5GYRwLM9m+JoENIDaoRc
	Zkv6Xm3qjCb3pWUwveUr8V1tbBghFv010V01VUT5z+lxj48LtGcYqhWm8v/jS1BH94tz
	R7LRbUtWVUBYAb8DD7vqmxn2efAT+HOi8zqP/MuSvNB6cnMreQ03pPseERQKjW6CKf/4
	zbZ7hvLqAABFvca/xkqGgh8W2wktbun2ExbtTZ4l/5MG32QQbxHRlGeJV1Hd7JrWEN2y
	1qnF0P0jyqOiaePfKvS7exnIdINclk1kBypwGgB/O8Gj3wtSDm2wVO30YWF9kEzxy7ir
	iaQg==
Received: by 10.216.136.72 with SMTP id v50mr7797755wei.73.1335099010605;
	Sun, 22 Apr 2012 05:50:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	ev10sm14360496wid.10.2012.04.22.05.50.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Apr 2012 05:50:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 22 Apr 2012 14:50:05 +0200
Message-Id: <1335099006-27041-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnAR3b9LZW0rwKymUEXkUcdE6OxlV6PoMABanoTT79qcyVXMyLlxkqLu5h/chFNQDE8n2IP
Cc: denys@ti.com
Subject: [PATCH 1/2] beaglebone-getting-started: updated to latest git
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
X-List-Received-Date: Sun, 22 Apr 2012 12:50:12 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index 548a9c0..ede7b3c 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r19"
+PR = "r20"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "4750e2bdd29ce037a045149b50ad73906d26999f"
+SRCREV = "7d1f070ab2e981a89db302b1b61e85562b949dac"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.10


