Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92F9AE004AB
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 00:19:44 -0700 (PDT)
Received: by eabd1 with SMTP id d1so865788eab.35
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 00:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=GFKpHLFwgJ+PMJWHTzU2SwFzgtnagVfX6hV268enM4s=;
	b=BB0e5bABsqSrzVXCyLheqhlwW/1VgpwWEBoTfdI+Lv11BLS5FFlBoVK4QeOeOs62YU
	S0P21432g/dJoRnZeI2CqktkGfmE9LsS9cU4S3knguAlVRWxd0HAyi4I4jEy61Tviw/G
	Jx1vJE2QgwwGp98KBAUHN72B6qCT7dnPF70vCYiZsjcbiPWdFeGD5Yp/S5Z+r/w1QUxC
	jVwtTMcJvNvCdiHTb9ir/cZyzc+1D4l2SB+1bbkpslXKI4dCQSRX+ZKyLz3botIDC3zL
	A7zb8EuX2Gn97DT1gtaOJUemnmcmLMgByYICgNh1M8iZcK+8QENqtzh/Zc89zbnfWBeV
	UEdg==
Received: by 10.14.4.201 with SMTP id 49mr9854492eej.0.1346397581548;
	Fri, 31 Aug 2012 00:19:41 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id u47sm10898053eeo.9.2012.08.31.00.19.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 00:19:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Fri, 31 Aug 2012 09:19:27 +0200
Message-Id: <1346397567-21825-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346397567-21825-1-git-send-email-koen@dominion.thruhere.net>
References: <1346397567-21825-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmmFWlLffgHLZ93MUvieMOAjUOlGMM1hfMtkrs/1ZyzoydkYglutGlTxhgV2aqMB9TClgsC
Subject: [PATCH 2/2] beaglebone tester: bump SRCREV for FTDI test
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
X-List-Received-Date: Fri, 31 Aug 2012 07:19:45 -0000

An extra test for the FTDI eeprom was added to catch programming errors that would break CCS.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 138fbc6..7512e76 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r18"
+PR = "r19"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "168a9604e170931d9de228f0d774f4fbda58aa37"
+SRCREV = "bb93cdaa95173eb4a772523a37fe0bf8bd62d78f"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10


