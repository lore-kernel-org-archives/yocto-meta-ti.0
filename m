Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE43C761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:18:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.24761.1680182279485605579
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 06:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oVwJb3Di;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C2140E000A;
	Thu, 30 Mar 2023 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680182277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=5cZnsBtHsA2go3yuRgb7ga2j+1ltFZkLS8EPsDfjkDI=;
	b=oVwJb3DiTmyQbPA3KryXCdJvMbV+Cq1J4gNdJzJFgVeST7vTgaBLG9QmASM3uJnyQPy29T
	zIleqKvPLtPlBtlWBITNpjFgVDqGXX2sAbNStaYqZI+fnFrYJKDpIyd0/DxEorTbOtzqwN
	8x3+hdSfsQkQG4KtP6iD8gh+/weOSVhaBhV7y7at/G66XKR0y+BJ0L55sHEqANNcffZhGU
	n1cPXxFVsMxh7z5cgr7Zn5ZH5uKSOe5Y89//TpCBlBluZ2VzgN8sVhEZqKICkUq4wUXumu
	nzXWHJ4+1SUvZUPymb7N8B8fSjxKdr9FRLRv9lenn+Qnwg6gHF9tHQFjQk8vSg==
Date: Thu, 30 Mar 2023 15:17:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: check-layer failures for meta-ti
Message-ID: <20230330131756f58d9658@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 13:18:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16254

Hello,

meta-ti is currently failing check-layer-nightly:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1264/steps/20/logs/stdio

ERROR: No recipes in default available for:
  /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
  /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

