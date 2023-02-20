Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30583C61DA3
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 23:15:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.29171.1676934930201145801
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 15:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ILBloPXf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B98EAC0003;
	Mon, 20 Feb 2023 23:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676934928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=qD3/vvwewGptHU8Jo+2UQhG5fm3ZUQDVh2ZtScIx4CI=;
	b=ILBloPXfyIVyF6rI6yxcY1nSEbdaEQjOStgBm3zl+m2UhhsleF8t6yA4V8D/+p403IMoQW
	1iL51ySTWZ3qOmtAYHqi7WbJDDWD1tOH47bG1w7KcIhYfSKL89gTlGBZ48mHvGbwR0/VuO
	GXYJ3P7/962kKVwcx0VOCvck73Xn3JYCgX232NyJlEJsvW/ZQ8FWYH/7OhcP7ysnKCwr8c
	zDh/K4Eg+9UFgdwsx6TLVmJ4Nq5couLPvsM3hur8+8C4iSXz7VeekOn6xCaUwc3yQ6/IP1
	U3S5gEbJnR6sFL/k++z0AV1EdfVSN1XJO5vfMkURu0TNly2E57CAvRsF7ebupQ==
Date: Tue, 21 Feb 2023 00:15:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: check-layer failures for meta-ti
Message-ID: <Y/P/D7aUrHpMi5mR@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 23:15:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15886

Hello,

meta-ti is currently failing check-layer-nightly:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1191/steps/20/logs/stdio

ERROR: No recipes in default available for:
  /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
  /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

