Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1176.1614886215101464968
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 11:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id BCE2338C0845
	for <meta-ti@yoctoproject.org>; Thu,  4 Mar 2021 19:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA32E40BEA;
	Thu,  4 Mar 2021 19:30:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 210cp81PtcC6; Thu,  4 Mar 2021 19:30:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 913CD40AB7;
	Thu,  4 Mar 2021 19:30:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F144E174524; Thu,  4 Mar 2021 14:30:09 -0500 (EST)
Date: Thu, 4 Mar 2021 14:30:09 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: "meta-ti @ yoctoproject . org" <meta-ti@yoctoproject.org>,
	"Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [PATCH dunfell/dunfell-next/master 0/2] linux-ti-mainline: Move Linux to v5.11
Message-ID: <20210304193009.GG4892@denix.org>
References: <20210304042808.9389-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210304042808.9389-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the subject, -next is implied. It is part of the process (and is up to 
the maintainer to follow), but you just specify the target branches you need 
this in - dunfell and master.


On Wed, Mar 03, 2021 at 10:28:06PM -0600, Nishanth Menon wrote:
> Hi,
> 
> A series of minimal patches to bump up recision to the latest kernel ->

Recision? You probably meant revision? :)


> we will need to maintain upstream-tools and kernel in sync on all
> branches involved ofcourse.
> 
> NOTE: with kernels > 5.9 (aka 5.10, 5.11...) we do have problems with
> cryptodev and kernel - we will have to try and see how best to integrate
> those as well. This is solved in master of oe-core[1] by moving to 1.12,
> however gatesgarth, dunfell are on 1.11 and 1.10 revs respectively
> which wont work since the PR integrated version is 1.12

PV, not PR.


> Nishanth Menon (2):
>   linux-ti-mainline: Bump up ti-upstream-tools SRCREV
>   linux-ti-mainline: Bump kernel version to v5.11

Ok, as long as you are not bumping linux-ti-staging, which is still the 
default kernel in meta-ti and 5.4 is being preferred, you should be fine 
with cryptodev "fix" in meta-arago.

Will need to revisit that later, if/when 5.10 LTS is ready to become the 
default in meta-ti dunfell...


>  recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> [1] http://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/cryptodev?h=master
> [2] https://github.com/cryptodev-linux/cryptodev-linux/pull/55
> -- 
> 2.25.1.377.g2d2118b814c1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
