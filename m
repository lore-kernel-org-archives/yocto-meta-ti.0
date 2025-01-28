Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E8CC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 19:40:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6214.1738093256215000528
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 11:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A05C40C1C;
	Tue, 28 Jan 2025 19:40:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2KISlsKKXyN; Tue, 28 Jan 2025 19:40:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C03440BD4;
	Tue, 28 Jan 2025 19:40:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1A30F1641AD; Tue, 28 Jan 2025 14:40:54 -0500 (EST)
Date: Tue, 28 Jan 2025 14:40:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Will Howe <willhowe235@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-arm] Failing to fetch beaglebone kernel from github
Message-ID: <20250128194054.GG21836@denix.org>
References: <lrnS.1737746847989365062.hDBY@lists.yoctoproject.org>
 <20250124215239.GB21836@denix.org>
 <CAMWH2H31xA76ciYOz6x_mqzW=ZSpmOBQAC_Q16khfECipqCszg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMWH2H31xA76ciYOz6x_mqzW=ZSpmOBQAC_Q16khfECipqCszg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jan 2025 19:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18238

On Fri, Jan 24, 2025 at 05:05:27PM -0500, Will Howe wrote:
> Thanks Denys,

It is always recommended to copy the mailing list in order to get faster 
response from others, as one person can get busy or unavailable...


> I attached the logs of the first error. It definitely seemed to me like it
> was a connectivity issue.

Relevant messages from the logs, indicating connectivity issues:

error: RPC failed;
+curl 92 HTTP/2 stream 5 was not closed cleanly: CANCEL (err 8)
error: 22969 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output


> But I'm not so sure since I'm wondering if it is
> a delta with the URI.
> 
> It seems like the delta is caused between "https://..." vs "git://...".
> Currently the recipe is using:
> 
> KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
> 
> Changing it to:
> 
> KERNEL_GIT_URI = "https://github.com/beagleboard/linux.git"
> 
> gives me the following new errors related to the license file:

Please don't do that, your change is incorrect - it tells Bitbake to use the 
wrong fetcher and instead of cloning git repository, it tries to download a 
Web file, which obviously fails. The recipe already sets the protocol to 
"https" to be used when cloning the git repository.

-- 
Denys

