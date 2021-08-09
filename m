Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.24269.1628522618107288917
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 08:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA31640C1D;
	Mon,  9 Aug 2021 15:23:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olxxNEHhaM-e; Mon,  9 Aug 2021 15:23:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C77F940BEC;
	Mon,  9 Aug 2021 15:23:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3835F174651; Mon,  9 Aug 2021 11:23:34 -0400 (EDT)
Date: Mon, 9 Aug 2021 11:23:34 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Paul Barker <paul.barker@sancloud.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][PATCH v2] meta-ti: convert to new override syntax in honister
Message-ID: <20210809152334.GD1528@denix.org>
References: <1628032287-44000-1-git-send-email-denis@denix.org>
 <20210807110733.701b873a.paul.barker@sancloud.com>
MIME-Version: 1.0
In-Reply-To: <20210807110733.701b873a.paul.barker@sancloud.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 07, 2021 at 11:07:33AM +0100, Paul Barker wrote:
> On Tue,  3 Aug 2021 19:11:27 -0400
> "Denys Dmytriyenko" <denis@denix.org> wrote:
> 
> > From: Denys Dmytriyenko <denys@konsulko.com>
> > 
> > Upcoming "honister" release changes the override syntax to improve usability,
> > speed and memory footprint. Update recipes with the new syntax and set layer
> > compatibility to honister.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> > v2 - more thorough pass to catch nested and machine overrides
> 
> I'm currently converting meta-sancloud to the new override syntax and
> our layer depends on meta-ti. So I tested with this patch, the build
> was good and we got a bootable image. Thanks for posting the conversion.

Thanks Paul! Care to add your Tested-by: then?

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
