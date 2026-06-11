Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBC1CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 13:51:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45982.1781185895136108795
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 06:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 327E540C16;
	Thu, 11 Jun 2026 13:51:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FpzKkgV3-EaS; Thu, 11 Jun 2026 13:51:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0805F40BEC;
	Thu, 11 Jun 2026 13:51:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B468F17EE6C; Thu, 11 Jun 2026 09:51:32 -0400 (EDT)
Date: Thu, 11 Jun 2026 09:51:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti mailing list <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] want to clarify (simple) instructions to build for
 beagleplay
Message-ID: <20260611135132.GO23325@denix.org>
References: <fae8ab1f-e451-9357-de74-ba776a3ca658@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fae8ab1f-e451-9357-de74-ba776a3ca658@crashcourse.ca>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 13:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20024

On Thu, Jun 11, 2026 at 09:19:07AM -0400, Robert P. J. Day wrote:
> 
>   friend just got a beagleplay, asked me whether there was any
> complication in building a simple core-image-minimal with yocto
> project ... i did some quick research and, from what i read, it's as
> simple as:
> 
>   1) check out oe-core, meta-ti and meta-arm layers
>   2) add all the relevant layers to bblayers.conf
>   3) Set MACHINE = "beagleplay"
>   4) "bitbake core-image-minimal"
> 
> and one should get an appropriate wic image.
> 
>   one question -- are the "master" branches safe for all of the above,
> or should one play it safe and check out "wrynose" for all of the
> above?
> 
>   seems pretty straightforward.
> 
> rday

Robert,

You had already asked this back in January:

https://lists.yoctoproject.org/g/meta-ti/topic/117104047

You can simply use genericarm64 w/o meta-ti layers, per Nishanth.

My understanding is that genericarm64 uses pre-built FW binaries for 
low-level bootchain, such as SPL, ATF, OP-TEE, etc., while meta-ti 
builds those from sources.

From the kernel perspective, one uses vanilla upstream linux-yocto 
and the other uses patched TI kernel. From beagleplay perspective, 
the differences should be relatively minor.

-- 
Denys

