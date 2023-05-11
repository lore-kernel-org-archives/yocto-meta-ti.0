Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81601C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 14:50:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.61190.1683816642794977917
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 07:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KkJYDRu1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF5C6C0006;
	Thu, 11 May 2023 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683816640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4365QfXnBOO4NiGdOcw8KHzhc3rWxRIXAqE1zFXEXw=;
	b=KkJYDRu1OC98KHxGg7rUnS+w+GVXH6uLplKHq40kD309FXX19pEcNaAgUlEp779mWhBCAA
	o1qJ4frt8FJlYpI6jwA0Axs7Wfjc1/q0kmdZZtPALAho5LRN7voA8CfllQK3s0zlhOt0jW
	PKI8MLmy2dXzpf4cWwpDMfCLcxTGfmeW15IpfBN50q9ATCIohBanGryv7uHT3MbvZLi/0V
	qgU18BKL6nzoC2An/q6ThaCyDPFuzPupeLLavoyY7hR+bisQZ2pH08XXxoA/drOXv31TiA
	zCLYQBEHcHZqWz+FIvMoxHRGMmVQ1mNFVr4qSah5YNP8B7S44507UKUzswZ1MA==
Date: Thu, 11 May 2023 16:50:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <202305111450394ec6a4fb@mail.local>
References: <202305021517546e066d50@mail.local>
 <20230502194743.GD9226@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502194743.GD9226@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 14:50:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16508

Hello,

Did you make any progress? The plan is to disable testing meta-ti next
week if this isn't fixed by then.

On 02/05/2023 15:47:43-0400, Denys Dmytriyenko wrote:
> On Tue, May 02, 2023 at 05:17:54PM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> > Hello,
> > 
> > meta-ti is currently failing check-layer-nightly:
> 
> Yeah, I think I know what's going on and it's a bit more complicated... I'll 
> take a look at it.
> 
> -- 
> Denys

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

