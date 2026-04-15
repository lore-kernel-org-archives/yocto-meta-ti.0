Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CC3F43847
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 15:16:39 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21574.1776266188962033297
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 08:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=lT7NzL8Q;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DF9E61F920;
	Wed, 15 Apr 2026 17:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1776266185;
	bh=xAjSpS2i/RxXOS52fq/F7xfdDQ8DsRPKB6kH+Wttans=; h=From:To:Subject;
	b=lT7NzL8QvZVe7OR9U3P7fBYc5oSTIeLfKvZEDF3hx+edKfpKBUauOllbw5hCdar2C
	 HjADezat9XuL5cN62dq+dIFPj0rPUFCdgveeprY3Dhhz4hTxytzLcG0rPS+TYx3Kgc
	 bfec2nbtd9H9XkGeZoxxm6E04M1RJmm18BooHWGaZ6k+kEG4aJ8hkusKRfJLoSkicA
	 H6iSEyaBdviHFmQfExTywTrocLVPjnbkhQus3J76cwBmjOO20S3VqGGGawJUBwSLIA
	 BBkTCXdvhpuaMZBoprfknRtuFdpcwraXc4eKnCnSPTJ9muqfdKQZp5SkdwcQ8QLuKZ
	 pR9Io9iRCpg1Q==
Date: Wed, 15 Apr 2026 17:16:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Davis <afd@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Franz Schnyder <franz.schnyder@toradex.com>,
	Franz Schnyder <fra.schnyder@gmail.com>
Subject: Re: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move
 ti-eth-fw-j784s4 to EVM conf
Message-ID: <20260415151621.GB26023@francesco-nb>
References: <20260415114107.1643556-1-fra.schnyder@gmail.com>
 <20260415115820.GA26023@francesco-nb>
 <6a59459c-9843-4a9c-9e43-b3697b7d4203@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a59459c-9843-4a9c-9e43-b3697b7d4203@ti.com>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 15:16:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19851

On Wed, Apr 15, 2026 at 09:43:31AM -0500, Andrew Davis wrote:
> On 4/15/26 6:58 AM, Francesco Dolcini wrote:
> > Can I ask TI once more to rethink this considering that meta-ti is used
> > by users of your SoC, but not of your EVK/SK ?
> > 
> 
> We do think a lot about external users of meta-ti, we even made a whole
> split out reference layer (meta-beagle) that we treat like a normal vendor
> layer so that we can more easily identify when we are making bad assumptions
> that only apply to our EVM/SK boards. Yes we do still sometimes get it wrong,
> and so we are very happy that you are providing the feedback that you have
> and helping point out those cases.
> 
> If I'm not mistaken the initramfs topic is the only outstanding case
> where what goes in the SoC file vs board files is still open and we
> should continue to try to find the best solution.
> 

Thanks a lot Andrew, I really appreciate this message. I do not mind at
all bugs or sending patches or having some temporary workaround in our
layers, I was concerned we were not on the same page on the main topic
here.

Your message solves all of these concerns.

In case you want to have a look at Toradex OE machine conf files
they are here [1], and here [2] you can find as an example verdin-am62.

Francesco


[1] https://git.toradex.com/meta-toradex-ti.git/tree/conf/machine
[2] https://git.toradex.com/meta-toradex-ti.git/tree/conf/machine/verdin-am62.conf

