Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726DAC3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 16:32:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.52619.1670344329922653469
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 08:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CGoT9lq7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1B284E0010;
	Tue,  6 Dec 2022 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670344327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=wMrAHtupSAEPi4pXBrYDHZa53rUQKimURoW0WewYvXY=;
	b=CGoT9lq7rQghFhF58h0TkEpLKEQKbVCWw9GQGWtMw7IIAXT41jMTV9iAY7aZJTRKYe7HBw
	fQiTRMWRrYi1C46C9RAGGGnhcS3E2NmkvuAleYyupsI6UFo358M0uQLHhs5cUU5NggQMhS
	n/y6Nf5hJlyrMKitoIXCFMMiZKqH0PpVgYwnpwNM+WPPZkJzUKZ1tLVnK07zIDo5vAoP16
	b+7kkql3O2PnSRk9Gh8iJy1dBP5OOVln2lCLLRa/DXCtqHv3dWv3e2oWG3+XyJOo/SlMYX
	Pa8BJEr88s2/VJjPpDsTz0KfYQu3PJExv85su5w2fUAxqM3jqzm5ivwmoMFI9g==
Date: Tue, 6 Dec 2022 17:32:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: check-layer failures for meta-ti
Message-ID: <Y49uhpn5sKBKaElF@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Dec 2022 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15412

Hello,

meta-ti is currently failing check-layer-nightly:

https://autobuilder.yoctoproject.org/typhoon/#builders/121/builds/1046/steps/19/logs/stdio

Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:2: Could not include required file recipes-ti/includes/ti-paths.inc
ERROR: Parsing halted due to errors, see error messages above

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

