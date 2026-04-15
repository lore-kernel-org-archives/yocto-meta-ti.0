Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0BBF41996
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 11:58:32 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17191.1776254306958157528
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 04:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=H0qAnZvC;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2ABFD1FFA6;
	Wed, 15 Apr 2026 13:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1776254304;
	bh=6dT4fNZhcUDjvEiVPha2qvGNMYHT4d7zmE2xPKg1lpU=; h=From:To:Subject;
	b=H0qAnZvCAkdxB4N1w4XPJ2nIOEuKph5MCNkul8Xiv0ElCwcz02ijJvSkzO2/J43vV
	 f1eMP1pK0CfWqdYLPUd3ytzV6HnP2IaNc+FmwFsxs+aH6jD8g3Mp8ZJoMPiAVgstHF
	 /WKxrRmVF3t7HgImaPK41tX+LkLw0T035kYO3JcKZpw+ppxL/oEa+3dAYZkG/vQFG2
	 iF2LXxzBW4mgUJQDTf/W5imjT96cPuAaaWPEO0sXh9CSEA6Lkkxa0OrWgptc4r0lc+
	 14vOaEnyuUzfYaJV6V7myd/nX+/YlEmMMltyZxJmpDIO5bs8zrVcgsp6pyqZlzIyf2
	 00TUwyW45ghJQ==
Date: Wed, 15 Apr 2026 13:58:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org,
	Franz Schnyder <franz.schnyder@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Franz Schnyder <fra.schnyder@gmail.com>
Subject: Re: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move
 ti-eth-fw-j784s4 to EVM conf
Message-ID: <20260415115820.GA26023@francesco-nb>
References: <20260415114107.1643556-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415114107.1643556-1-fra.schnyder@gmail.com>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 11:58:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19845

+Andrew

Hello Ryan,

On Wed, Apr 15, 2026 at 01:41:04PM +0200, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
> 
> The `ti-eth-fw-j784s4` firmware is added in the generic J784s4 SoC
> include, which is therefore used for all the J784s4-based machines.
> That firmware seems to be developed specifically for the EVM, as it
> takes control of pins used for the Ethernet board setup on the EVM. On
> non-EVM boards, like the Aquila-AM69, those signals are used for other
> functions, so enabling the firmware in the SoC include is too broad
> and breaks functionality.
> 
> Move the machine-essential recommend from the SoC include
> to the EVM configuration.
> 
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

This seems to be the 3rd time, in a relatively short time, in which
we are affected by your decision to put into the SoC file, configuration
that are not about the SOC

 1 - the initramfs topic [https://lore.kernel.org/yocto-meta-ti/78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com/]
 2 - the console uart [https://lore.kernel.org/yocto-meta-ti/4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com/]
 3 - this firmware 


Can I ask TI once more to rethink this considering that meta-ti is used
by users of your SoC, but not of your EVK/SK ?

Thanks,
Francesco


