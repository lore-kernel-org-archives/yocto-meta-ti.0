Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC35CC83F21
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 13:38:47 +0000 (UTC)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by mx.groups.io with SMTP id smtpd.web11.6615.1752581187679473712
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 05:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rf0MruiN;
 spf=pass (domain: bootlin.com, ip: 217.70.178.249, mailfrom: miguel.gazquez@bootlin.com)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [IPv6:2001:4b98:dc4:8::235])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id BA96358767A
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 11:35:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0922543186;
	Tue, 15 Jul 2025 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752579344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7lM0sjOwt5pONJhQ8UlHabOvxyAhDIg3myK8BvR/TI=;
	b=Rf0MruiNKquyZ4cIXd8PXtuLX00P/g2bXPREi616c4ML49/pO8Vq60dDYsBZV6BbzksIyJ
	PudAj962Wlc1Qodz+gkslbnuiSCjY0G6mvI/85q89oMbhpzqywTmAZhdkD8PgCNSv0Iyht
	dP6Nvb9cWOfmju51WGVE6WgBjE74MROjOzwQnHw0E8rHKY1sMCO54Ug3GgpK+XA7+HNCde
	7XPpUUKEsWHZVHU4FqT/O9lbS7sin5SZ/JbGiM4hQgQQB+xwCA/Q88QutHZeScrSTyj23z
	yiCk+sRqMCEMfe8WUtEcSQ5mzdWPymNCSexI9YNLP8MNtByCjsOrYm0EhP+SHg==
From: Miguel Gazquez <miguel.gazquez@bootlin.com>
Date: Tue, 15 Jul 2025 13:34:54 +0200
Subject: [PATCH 1/2] conf: machine: add BeagleBone Green Eco to KERNEL_DEVICETREE
MIME-Version: 1.0
Message-Id: <20250715-bbg_eco_machine-v1-1-6d1581129203@bootlin.com>
References: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
In-Reply-To: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
To: meta-ti@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com, praneeth@ti.com, 
 romain.gantois@bootlin.com, kory.maincent@bootlin.com, 
 thomas.bonnefille@bootlin.com, denys@konsulko.com, reatmon@ti.com, 
 robertcnelson@gmail.com, Miguel Gazquez <miguel.gazquez@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752579298; l=851;
 i=miguel.gazquez@bootlin.com; s=20250708; h=from:subject:message-id;
 bh=3iWe4tdDkM9vgTZhF5LB3OQ7+gzOM+lOgBmBXZvAUmE=;
 b=rk3fsfZfJg2ssmFr/YRYawft1C70zkNua2UXNwHV0UqvFTvQXrJgX5ZdhYa2obgQiScOoq019
 W0M8d/ul/k7CoXR+hC5GxdHuGACwJTaVk1gVmQJzIM+JUZwutbo/J1y
X-Developer-Key: i=miguel.gazquez@bootlin.com; a=ed25519;
 pk=k/2KI9jkmayaF0ghZ8QYUH9Wm/kFHDhl8QoZ0RHbr4w=
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhighhuvghlucfirgiiqhhuvgiiuceomhhighhuvghlrdhgrgiiqhhuvgiisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejlefgveeguefgvdelgfekiedvhffhkeegteegieejheeuvdelgffhheeihefgudenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvvdgnpdhmrghilhhfrhhomhepmhhighhuvghlrdhgrgiiqhhuvgiisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehmvghtrgdqthhisehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvnhihsheskhhonhhsuhhlkhhordgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhgvrghtmhhonhesthhirdgtohhmpdhrtghpthhtohept
 hhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 13:38:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18784

Add am335x-bonegreen-eco devicetree to KERNEL_DEVICETREE in ti33x.inc

Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
---
 meta-ti-bsp/conf/machine/include/ti33x.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 7e9eb48c52737e74750565e639956334162432e2..0a0730eae104371d65548588b3333839857a3a50 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -28,6 +28,7 @@ KERNEL_DEVICETREE = " \
     ti/omap/am335x-boneblack.dtb \
     ti/omap/am335x-boneblue.dtb \
     ti/omap/am335x-bonegreen-wireless.dtb \
+    ti/omap/am335x-bonegreen-eco.dtb \
     ti/omap/am335x-bonegreen.dtb \
     ti/omap/am335x-chiliboard.dtb \
     ti/omap/am335x-cm-t335.dtb \

-- 
2.50.0


