Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FDE3E00283
	for <meta-ti@yoctoproject.org>; Sat,  1 Sep 2012 04:50:44 -0700 (PDT)
Received: by wibhn17 with SMTP id hn17so1998866wib.11
	for <meta-ti@yoctoproject.org>; Sat, 01 Sep 2012 04:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ApY++trkpu8txFc9x1Vj7aTAcma0xi8+oH6AxJnY+NY=;
	b=CiBWnPkkkDtnXzdaaTEMWz6gy7tveSmSOZlVF5xztgYRoO9tFgjG1ZL2736iDNBhMJ
	csJ9slzKJLCCFoZJk3bNfLkMu4glWQCQIMcfJp6mPREod1WsN0eX7ZUGTqI8xI7yft4/
	8mO6QZjLpQnw9UwypJyP78WP3LP+hdaIQEpiJ5ZzOPmwfGskxb3kvWGTjiZDK1zVbDRL
	LbnfscHmB8NvDLwVflGzL3YvPQXqhx4okfa5b9lb5KgQ44NuxdKoV1qqwZNgV0b9+w2S
	RjMQxv2v/+BRx2sT2sIvaFyeQg0FEK1TQd8JIeMwt3/tMGdwASnUfxU1ghLudPscES5W
	YGsA==
Received: by 10.180.86.133 with SMTP id p5mr10799871wiz.17.1346500240771;
	Sat, 01 Sep 2012 04:50:40 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id q4sm6527622wix.9.2012.09.01.04.50.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Sep 2012 04:50:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sat,  1 Sep 2012 13:50:21 +0200
Message-Id: <1346500221-24295-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQm8qc84KgqD4LftWSdqqwG+qllTo5bZ+H57nRXhW9THNzM141qBdaBoQxcHnVivihmesdJx
Subject: [PATCH] beaglebone-tester: FTDI eeprom test, v2
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
X-List-Received-Date: Sat, 01 Sep 2012 11:50:45 -0000

Check descriptor instead of VID/PID

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 7512e76..66b98a4 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r19"
+PR = "r20"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "bb93cdaa95173eb4a772523a37fe0bf8bd62d78f"
+SRCREV = "487a13e2e4faaafa40ba5430600e6aeecf9581a8"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.7.6


