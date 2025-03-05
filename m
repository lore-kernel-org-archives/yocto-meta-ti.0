Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F648C282E5
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:52:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.18325.1741193569826655339
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 08:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p3tyaBh6;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525GqnAn3462210
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:52:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741193569;
	bh=Ym44Wp7GG9T0x2L6++87K4ZdR+BNkDP1VM4TOf7oj5Q=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=p3tyaBh6gLEKswHWxU8k6ezm2O3t4Kx7uJrDpD4IbSZ/UC+416+QB+j/+nW6L4dpu
	 tIkTwMQ9SCSHD8wha3s/6IVH98+2/YjlFxAi47e26fFDGDYglpph5/vkj1+yGmBnn7
	 oYj1NvAiUhLeah/SLZq99sFvi1kcv4BWoJujAXgE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525Gqnx1098529
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:52:49 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 10:52:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 10:52:49 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525GqmoH027729
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:52:48 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v3 2/3] recipes-graphics : port gc320 libs to work on kernel 6.12
Date: Wed, 5 Mar 2025 10:52:47 -0600
Message-ID: <20250305165248.354807-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305165248.354807-1-a-christidis@ti.com>
References: <20250305165248.354807-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Mar 2025 16:52:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18351

From: Antonios Christidis <a-christidis@ti.com>

The user mode libraries needed recompiling with the scarthgap revision of gcc to
remove all the warning about 32bit API usage during the linking stage, New SRCREV
and branch includes this changes. Versions of the libraries remain the same.

Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
---

v3:
- Removed commented lines and extra lib directory that was being created
  in do_install()

v2: ti-gc320-libs
- No longer include within the ${PN} package /usr/include files and symb link
  to library file. This is done by not changing the FILES/PACKAGES variables, thus creating a -dev
  package including the above.

 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 807f421c..28d29134 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -11,10 +11,10 @@ COMPATIBLE_MACHINE = "omap-a15"
 
 CLEANBROKEN = "1"
 
-BRANCH = "ti-${PV}"
+BRANCH = "ti-${PV}-scarthgap"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
+SRCREV = "85c175e8425c33dda6e272aeb45afe0f69a79096"
 
 RRECOMMENDS:${PN} = "ti-gc320-driver"
 
@@ -43,4 +43,4 @@ do_install() {
     chown -R root:root ${D}
 }
 
-INSANE_SKIP:${PN} += "ldflags"
+INSANE_SKIP:${PN} += "ldflags already-stripped dev-so"
-- 
2.34.1


