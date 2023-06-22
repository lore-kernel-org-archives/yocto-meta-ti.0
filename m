Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE65EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:27:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7315.1687426071441867003
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 02:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gjHPK1jv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: kamlesh@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35M9RoMJ100080
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 04:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687426070;
	bh=gHzTzvMr2EiHhBsxZ2pChOe5LQcHdxKpGMrM+l/UxmA=;
	h=From:Date:Subject:To:CC;
	b=gjHPK1jvMo7ilhHWLRZZ4KVawv/z51dE2lXC20pni0yf8OhPqUBr18h1X6GbVtt3l
	 /hoEWnTZftevdPHxdAJGfpyV7XX/BC3SkO0ROmcoL6EDdGvMU4pZ4wo+/lRqXgy+ns
	 g62M7DsnAAmDU57q9IiWI7I7+/r3oNgo2aYYJkZ4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35M9Roa9025616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 04:27:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 04:27:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 04:27:50 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35M9RnrK126153;
	Thu, 22 Jun 2023 04:27:50 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Thu, 22 Jun 2023 14:57:45 +0530
Subject: [PATCH master/kirkstone] ti-k3-secdev: update to the latest commit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-core-sec-dev-bump-v1-1-988dbb925456@ti.com>
X-B4-Tracking: v=1; b=H4sIABAUlGQC/z2N3QqCQBBGX0XmuiFdw6xXiS725ysXcVdmTATx3
 dMuujxwDmclhUQo3YuVBHPUmNMO1akg39n0BsewM5nS1GVjDPssYIXngJndZxi5aeuqCjdczaW
 lvXNWwU5s8t1R9lF6nXICJyzTIYyCV1x+0wcNVifI+W/Rc9u+tqhPNpYAAAA=
To: <vigneshr@ti.com>, <praneeth@ti.com>, <afd@ti.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687426069; l=1043;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=PJLP+gTWMA9NuUFwOHY2tmDG1OFf+QkrOcOLuXFtpU8=;
 b=xTmXLZbV15l+Uhn6M67/Eqrz0a4AxN1hIX4s6JR/NeszjlYFuEKU+p8GrDXkntZAQqsPztNmo
 u2+0yxrIxe5Ajc3GR0JIwSMrGowDLgkSF9Fyo6hWaadeq2KUotfwSrJ
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 09:27:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16773

Update to the latest commit

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
index 87987ae0..e3267a23 100644
--- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -15,7 +15,7 @@ COMPATIBLE_MACHINE:class-nativesdk = "(.*)"
 GIT_URI = "git://git.ti.com/git/security-development-tools/core-secdev-k3.git"
 GIT_PROTOCOL = "https"
 GIT_BRANCH = "master"
-GIT_SRCREV = "bba9cabaeee96f7f287385188ff289b46769a4bf"
+GIT_SRCREV = "ed6951fd3877c6cac7f1237311f7278ac21634f3"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${GIT_BRANCH}"
 SRCREV = "${GIT_SRCREV}"

---
base-commit: e15df9d32c5fb5980e7cc04398396e7d1a380806
change-id: 20230622-core-sec-dev-bump-68311d9e7248

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


