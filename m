Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C59D8E002AC
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2012 02:58:42 -0700 (PDT)
Received: by eekb45 with SMTP id b45so346309eek.35
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2012 02:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0sIjPpxeTFr7iD2u2lVdBG+9zyBw7HcOZ5Tr2qlu/yA=;
	b=B8mEYnH3aWWWEIXl0TzQta5xURUfm0Kd/Jym1eUk/iS8EwFuEHB/j/PlUR67mIrsPX
	f35C8OPZ5gzcbp0ai0/klO7Qaa+v89yXA/9RD4uU2njANubL+T/xC+AmyuF/xUk1tBTP
	e+GCXKate3QaH3s6PGZnsAipBzGitkFldmlLZN34zDYoK2cMhzwr5VWdNzHUgggbSZGJ
	QMGAA4rKIzyuWPorvzeR3UIRuIM5/OgTIKU7OcAO4P1cVIFeqJlcGIEnzGYpd0kXUBhp
	brBNXP3t0xR4SoXV9aB7VsX48/wOB/DgNCSMM+U1kByxq+qnV0E1Z5QX0iL4m7kd8Xej
	mMUA==
Received: by 10.14.27.137 with SMTP id e9mr10845811eea.105.1342000721446;
	Wed, 11 Jul 2012 02:58:41 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a16sm4253035eeg.0.2012.07.11.02.58.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 02:58:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Jul 2012 11:58:25 +0200
Message-Id: <1342000711-18346-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342000711-18346-1-git-send-email-koen@dominion.thruhere.net>
References: <1342000711-18346-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnYUMdEbROO255zAeGOpgOJIULHsfXk59fSG70EcrhcnhiSSJt38UGGuQthwbYB4JnKpYky
Subject: [PATCH 2/8] beaglebone-tester: re-enable pmic test
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
X-List-Received-Date: Wed, 11 Jul 2012 09:58:43 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 9995556..82c5a83 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r16"
+PR = "r17"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "4f6335aedf520917a0bc0c83e9c1ac1135b8a2af"
+SRCREV = "c748d157b9afbb71e6eadf1dca7a787a456c0149"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10


