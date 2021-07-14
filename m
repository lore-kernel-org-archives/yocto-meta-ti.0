Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.65.1626292663584688309
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jul 2021 12:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D170540C2E;
	Wed, 14 Jul 2021 19:57:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nd5Em7eOCi4R; Wed, 14 Jul 2021 19:57:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB9D940AB7;
	Wed, 14 Jul 2021 19:57:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 072CB17463B; Wed, 14 Jul 2021 15:57:40 -0400 (EDT)
Date: Wed, 14 Jul 2021 15:57:39 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Yogesh Siraswar <yogeshs@ti.com>
Cc: Khem Raj <raj.khem@gmail.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] [meta-ti] Merge confict chunk
Message-ID: <20210714195739.GY1528@denix.org>
References: <CAMKF1srKvR3KrWyKtW18J6rqzLH2H2SaYQLLzSs+sa8QHQh+7w@mail.gmail.com>
 <5070d889-b8c6-e6b1-d86d-0dbc966d1707@ti.com>
MIME-Version: 1.0
In-Reply-To: <5070d889-b8c6-e6b1-d86d-0dbc966d1707@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yogesh,

You should not rebase master or release branches like dunfell.

It appears master already had a similar patch from March, which was never 
merged to dunfell. So master now tries to patch it twice...

I'll send a cleanup for master shortly.


On Wed, Jul 14, 2021 at 01:21:11PM -0500, Yogesh Siraswar wrote:
> Hi Raj,
> Thanks for pointing  it out. Have fixed the same. Will try to be
> more careful in future.
> 
> Thanks
> Yogesh
> 
>  more
> On 7/14/21 12:15 PM, Khem Raj wrote:
> >Hi Denys
> >
> >This commit
> >
> >https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=4c1d26f6282b9959b9ee10aa77b3e05ed56299fb
> >
> >has a merge anchor thats committed perhaps accidentally.
> >
> >Thanks
> >-Khem

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
