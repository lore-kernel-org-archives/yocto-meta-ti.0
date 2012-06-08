Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15B90E0044A
	for <meta-ti@yoctoproject.org>; Fri,  8 Jun 2012 02:37:50 -0700 (PDT)
Received: by eekb45 with SMTP id b45so1140079eek.35
	for <meta-ti@yoctoproject.org>; Fri, 08 Jun 2012 02:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=XKR+VrrBumHmsYNaJVMIod+3T6zr0Eqejj32STE7ha0=;
	b=RM4im5k5vc5FcHoFU/TPoESpTMpn8UvpCojpbYwmOpalGcDf3xX7IoDRZRxVO/eP8x
	a7cvFH7Ku1wDqVcETyqgtMyUtyrNSoXOtumVepkPnLj6JiK1z1bBONIwR21/waQE0JtV
	3x/rjOzaflt+P/noy2jPaXKAVZsUgSSshyiFZqMcyKPXIzjsSxkfXhB57K9mk5FXxlMe
	AdYe/T+nWCcBrwADMZFMPt4PdC14p+nDtw2tCJTk7coUv8NmRWWZjb3LfHW+hzBbh2Cn
	NpwwpNMzrWYwipnOjwRnhPP/hsUcLbtFHkE+1JXXmyk/EKo1xAlXIwKuXRNv0MkxWro1
	aSMQ==
Received: by 10.14.53.65 with SMTP id f41mr3371035eec.179.1339148269600;
	Fri, 08 Jun 2012 02:37:49 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id x52sm20171073eea.11.2012.06.08.02.37.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:37:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Fri,  8 Jun 2012 11:37:44 +0200
Message-Id: <1339148264-8774-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlRu1U7vQ5zNJ6sv0K9rasNlI7x/Cxv92DPu/eHsmbxCbbTdQajq0InVApDqQqoXIht85Qn
Cc: denys@ti.com
Subject: [PATCH] beaglebone-tester: bump SRCREV to fix failure reporting
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
X-List-Received-Date: Fri, 08 Jun 2012 09:37:51 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 6bb598a..b5e3081 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r14"
+PR = "r15"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "1a13257030c497920243062c65068c89840d8b6e"
+SRCREV = "3b19f1caf8c616e3f4a25abacca28b2239d3ec82"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10


