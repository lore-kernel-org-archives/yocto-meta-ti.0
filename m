Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D8FC3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 19:35:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.918.1670355339657397099
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 11:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O0mklO94;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 41546E0006;
	Tue,  6 Dec 2022 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670355337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QEqR3zsRnAJA6d30x7ZgozOVUJmrv9XTw/qqofT4izM=;
	b=O0mklO94XOHU8gy6YdB25zP//EqS+1t/F1UKZW4PnHSh5MuugMoC5RvtNzFUS5bGMG7Aaf
	r8aWqGifEfVgQbCERtO3QkGjgoA1Tr46KRiMvwfqAqCte+cFsT2AYM7YhxX7iEWEN583mt
	BIolX7nkR6NPxwUno8qlygHmZN1QiTdsD4sGQZSmhgvIC+9PvUKvWFR5y5d6fhKEbW9DwP
	c51CyF99gVkGqywY84OoHCGcdAGbgGXGsIM51aTccBbsRVYZeY1xoSdNqbcXXVmP+Axi/r
	uXsIOT+KHD2xQf3MDPkW3p+X6gCE2hEhN0UiD4zaKFdl2H8u1AlfhZpHup0j7g==
Date: Tue, 6 Dec 2022 20:35:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <Y4+ZiIwxGu+YT4+v@mail.local>
References: <Y49uhpn5sKBKaElF@mail.local>
 <20221206182943.GZ22689@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206182943.GZ22689@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Dec 2022 19:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15417

On 06/12/2022 13:29:43-0500, Denys Dmytriyenko wrote:
> On Tue, Dec 06, 2022 at 05:32:06PM +0100, Alexandre Belloni via lists.yoctoproject.org wrote:
> > Hello,
> > 
> > meta-ti is currently failing check-layer-nightly:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#builders/121/builds/1046/steps/19/logs/stdio
> > 
> > Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:2: Could not include required file recipes-ti/includes/ti-paths.inc
> > ERROR: Parsing halted due to errors, see error messages above
> 
> The fix is already queued up in patchwork:
> https://patchwork.yoctoproject.org/project/ti/patch/20221118210749.2462011-1-denis@denix.org/
> 

Thanks!

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

