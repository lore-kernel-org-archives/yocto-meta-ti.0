Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC5AC83F21
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 13:38:37 +0000 (UTC)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by mx.groups.io with SMTP id smtpd.web10.6741.1752581187687014850
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 05:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mcZy4cGe;
 spf=pass (domain: bootlin.com, ip: 217.70.178.249, mailfrom: miguel.gazquez@bootlin.com)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id EA28858767B
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 11:35:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CBA34323C;
	Tue, 15 Jul 2025 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752579343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4P7/o+TjXUEWb22MP+aytJuvSG+aiWrLpODM+nlmODw=;
	b=mcZy4cGexQKaeAPmQR8IHThXM6DyNZrhCSMjs0crDII+4E0qsT51C+ibVnkBafHOGSQQeM
	1Gwquu+kaN4TH2xjMrWTUeHnm9LVpDvUwzyKozo4X93OWa4fDeHjbIv8Ugg3bR0Y98bTwe
	MfgzNrGGZYN49x27M2+0zZ8IE4iRwdEr4wYrfr21FGCwa3h1rOxlXF4/915YuYo5Kp7Rcp
	zUBrJD+GjcmvqDMaNHuoqclBwBH0JN9j38+jy50IuFHnt+cOzdKcNOqhIds0nK/P/qAJnX
	2N60XiD1ro9hYnXGXcToEru6D4IQwUqMh10Dc3N+uL9QJj0DGRiR4MRuJ0/rag==
From: Miguel Gazquez <miguel.gazquez@bootlin.com>
Subject: [PATCH 0/2] conf: machine: Add machine for BeagleBone Green Eco board
Date: Tue, 15 Jul 2025 13:34:53 +0200
Message-Id: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN08dmgC/3WNywqDMBBFf0Vm3ZQk4CNd9T+KiJmMOlCTkkhoE
 f+9qfsuz4F77g6JIlOCW7VDpMyJgy+gLhXgMvqZBLvCoKWuZauUsHYeCMOwjriwJ1FbjdrUztk
 WoaxekSZ+n8VHX3jhtIX4OQ+y+tn/rayEFLJpOuyMtNNk7jaE7cn+imGF/jiOL6W5pVGwAAAA
X-Change-ID: 20250711-bbg_eco_machine-5b2c295ddb7c
To: meta-ti@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com, praneeth@ti.com, 
 romain.gantois@bootlin.com, kory.maincent@bootlin.com, 
 thomas.bonnefille@bootlin.com, denys@konsulko.com, reatmon@ti.com, 
 robertcnelson@gmail.com, Miguel Gazquez <miguel.gazquez@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752579298; l=1513;
 i=miguel.gazquez@bootlin.com; s=20250708; h=from:subject:message-id;
 bh=JNudQr/tOMTHN0dPvbHVpsnhTRDQUrA5zixhkN34uHk=;
 b=SxEkU893+oQc3ZbmVLjKATV3BlZGKuwtUAN/pwDUv3HtDmiCau0Ft1azM3oAnBUzAx3rBc3my
 6zpy/bTFgYFCGczzGWPjLJpCA9+UvDBVP3KtGpxZCmb4/bpE1aqo9Yt
X-Developer-Key: i=miguel.gazquez@bootlin.com; a=ed25519;
 pk=k/2KI9jkmayaF0ghZ8QYUH9Wm/kFHDhl8QoZ0RHbr4w=
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepofhighhuvghlucfirgiiqhhuvgiiuceomhhighhuvghlrdhgrgiiqhhuvgiisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevjeejffdttdfhffevffeuhffgjeegheefvddtgfffudeufeekffeguefgvedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvvdgnpdhmrghilhhfrhhomhepmhhighhuvghlrdhgrgiiqhhuvgiisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehmvghtrgdqthhisehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvnhihsheskhhonhhsuhhlkhhordgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhgvrghtmhhonhesthhirdgtohhmpdhrtghpthhtohepthhho
 hhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 13:38:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18783

This series add support for the BeagleBone Green Eco board in the
meta-ti-bsp layer.

Ethernet support in u-boot is still on ti-u-boot-2025.01-next, but it
seems that update to the revision used for u-boot is done automatically,
so I didn't change it.

As I added the bbge device tree in the KERNEL_DEVICETREE list in `ti33x.inc`,
the machine works even without specifying the exact device-tree in
beaglebonegreen-eco-ti.conf, but I thought that it is not necessary to
compile all others devicetrees if we know the one we are going to need.

I previously sent this by mistake to linux-patch-review@list.ti.com, I
just changed the capitalization of the BeagleBone Green Eco.

To: meta-ti@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com
Cc: praneeth@ti.com
Cc: romain.gantois@bootlin.com
Cc: kory.maincent@bootlin.com
Cc: thomas.bonnefille@bootlin.com
Cc: denys@konsulko.com
Cc: reatmon@ti.com
Cc: robertcnelson@gmail.com

Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
---
Miguel Gazquez (2):
      conf: machine:  add BeagleBone Green Eco to KERNEL_DEVICETREE
      conf: machine: add new BeagleBone Green Eco machine

 meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf | 9 +++++++++
 meta-ti-bsp/conf/machine/include/ti33x.inc           | 1 +
 2 files changed, 10 insertions(+)
---
base-commit: 5edda0fa24819e8a9122143732db6fc91786431e
change-id: 20250711-bbg_eco_machine-5b2c295ddb7c

Best regards,
-- 
Miguel Gazquez <miguel.gazquez@bootlin.com>


