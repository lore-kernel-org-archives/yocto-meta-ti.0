Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8AC4E0142B
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:00 -0700 (PDT)
Received: by mail-ey0-f176.google.com with SMTP id b14so971369eaa.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0sIjPpxeTFr7iD2u2lVdBG+9zyBw7HcOZ5Tr2qlu/yA=;
	b=lGI6ugK6dWecVnKbsVu21BULCZuD/Iz+hOA9cn3Fr+dnHmefdRnBOz0tfokzhaqpbR
	WTMZ5AoeY/0hJjIKo+R87FNh0d3fJV4s4nsJlHKGjTBsgQmuBOI8VqGHX6+wn3TNIizC
	11dUpjUCYO+KZit34WCMzZ3ApEbQbAe6NRoVjAXTccFTpfbbNnuQobzWcl6rKpQXBdQG
	sgSXIrDJ3EuU7f8IVyfGREtkomm+zu3O1+p73D1aetryxSP5CjvoC2w7OGDyh425KMgD
	rr22hSVvax7oXnz59Uyx8sJOD9n+7Vsnlr06/se3p9ju+Ic4vpVQaI+D8fwzAbH9hhHp
	lJgQ==
Received: by 10.14.201.2 with SMTP id a2mr9132391eeo.10.1343581740358;
	Sun, 29 Jul 2012 10:09:00 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 9sm1934368eei.12.2012.07.29.10.08.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:08:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:24 +0200
Message-Id: <1343581714-20397-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlvbz78yTpgV4TZ+wkVywos+EXpPgCdqijpd+VMhcXhxeTB7mHXjw6yaciNRGU5Mud3PXC/
Subject: [PATCH][for-denzil 02/12] beaglebone-tester: re-enable pmic test
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
X-List-Received-Date: Sun, 29 Jul 2012 17:09:01 -0000

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


