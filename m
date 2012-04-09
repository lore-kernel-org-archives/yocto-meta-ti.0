Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FC78E013DC
	for <meta-ti@yoctoproject.org>; Mon,  9 Apr 2012 09:06:54 -0700 (PDT)
Received: by mail-we0-f176.google.com with SMTP id c1so3503536wer.35
	for <meta-ti@yoctoproject.org>; Mon, 09 Apr 2012 09:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=McWZGvr1A4tQA01TvcJKziNGqET0bnWnrX+NmW5Lok4=;
	b=e4iIjaiz4BkmPJ7EssD08es0QIPM+CNXvu76GYxOFjRuyeVOOfaie7Bzx2pwCu8P1E
	TiYVdnN2WQliBAunEh6/BNtakVGIC9tFCSrvN0dqZX/afZIjG568mVuAnKC5cX8mI36v
	vKFzOxAhZDQPYlWaUC0BaBXTR08YzNvIbsBj45KL559x4zQoF3yYXSPqjJkQsbYdUXa+
	SXwxOJ7IcBrsq7A31CM0mrL0WptQbe4idMWGUMEZLWeTDT/agBOu4KEULzmSALXd/qEe
	SKeNcY5oVJW6WIgENH0sIfN9qS0iOe8sdo+D6TZEq24ASOwUKDJCULlpohrNpDQ8/teY
	gnxw==
Received: by 10.180.81.135 with SMTP id a7mr17191037wiy.16.1333987613967;
	Mon, 09 Apr 2012 09:06:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm50533015wib.9.2012.04.09.09.06.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 09:06:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon,  9 Apr 2012 18:06:42 +0200
Message-Id: <1333987604-1614-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333987604-1614-1-git-send-email-koen@dominion.thruhere.net>
References: <1333987604-1614-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlqZ5GTk2NsuwuFfIMR+ooZgOZ0y5oKeaBmcJKUfCklrFqLKBn3XLRph1yGmDGYHRCFVHfA
Cc: denys@ti.com
Subject: [PATCH 3/5] beaglebone-tester: bump SRCREV to fix PMIC test
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
X-List-Received-Date: Mon, 09 Apr 2012 16:06:55 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 7a72547..6bb598a 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "dc89e2d6b2ac0238a7aa5a334d7c86d7b8613837"
+SRCREV = "1a13257030c497920243062c65068c89840d8b6e"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.2.5


