Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5D6C83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 13:38:47 +0000 (UTC)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by mx.groups.io with SMTP id smtpd.web11.6616.1752581187772642892
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 05:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GToE21Oh;
 spf=pass (domain: bootlin.com, ip: 217.70.178.249, mailfrom: miguel.gazquez@bootlin.com)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [IPv6:2001:4b98:dc4:8::235])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 85B4858767E
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 11:35:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9429D44211;
	Tue, 15 Jul 2025 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752579345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TCSsUKrezDBRFfoJ+9LPVclLHQUSV78yXbH379GL2Rg=;
	b=GToE21OhHrn6l7byNMAb89r57DtgE1KnVVlA6q6BSkPr0lWIs8Dbvyv592thNsp8ffMVAA
	B/YarfFV39/lCdIBVvHK/wzxhAVRwBjE8e3N2Tl2ZZiVAb4c/radbOMK/X+MgzbVLofEvM
	vlBiTYIkgoPImTbRXZgUXQ/jscnuxJDFMBVx3dpZWMQaUXv4f84bvGgn2IclURqqF3MFGD
	gJzbXXqoumKom45lWyDj5+AmCWT1PN7EhOa53UtaCKvgSkN4WJcjnLqyJ4o5s9CSjJsUxd
	C8QrsslKwBvtKgkUCG+heLlmKgVxyTqGraIOIMSeltYEvX7/rBdCiajybmDZ1g==
From: Miguel Gazquez <miguel.gazquez@bootlin.com>
Date: Tue, 15 Jul 2025 13:34:55 +0200
Subject: [PATCH 2/2] conf: machine: add new BeagleBone Green Eco machine
MIME-Version: 1.0
Message-Id: <20250715-bbg_eco_machine-v1-2-6d1581129203@bootlin.com>
References: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
In-Reply-To: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
To: meta-ti@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com, praneeth@ti.com, 
 romain.gantois@bootlin.com, kory.maincent@bootlin.com, 
 thomas.bonnefille@bootlin.com, denys@konsulko.com, reatmon@ti.com, 
 robertcnelson@gmail.com, Miguel Gazquez <miguel.gazquez@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752579298; l=929;
 i=miguel.gazquez@bootlin.com; s=20250708; h=from:subject:message-id;
 bh=vdCa/6thJhBxC9MjNzwNX0ze5Uo76WvXswQyFdJ7rD4=;
 b=7geEZQUqZW7hazeP21kMIujOiI1YZ84ko7imJA6xW4+F5Iz1nAtLOVy9z8HAdpMj6FyCAbghl
 oiVxdonzmnjCiEPbEDSKtwWrM7Z4+i86pPG6ojLXAORq58Yn2AdWEfj
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18785

Add a new machine file for the BeagleBone Green Eco board.
`ti33x.inc` takes care of much of the configuration, so not much is
needed in this file.

Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
---
 meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf b/meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf
new file mode 100644
index 0000000000000000000000000000000000000000..c0756b53690a492c44c1289f045587d91264ce05
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf
@@ -0,0 +1,9 @@
+#@TYPE: Machine
+#@NAME: BeagleBone Green Eco
+#@DESCRIPTION: Machine configuration for the BeagleBone Green Eco board
+
+require conf/machine/include/ti33x.inc
+
+SERIAL_CONSOLES = "115200;ttyS0"
+
+KERNEL_DEVICETREE = "ti/omap/am335x-bonegreen-eco.dtb"

-- 
2.50.0


