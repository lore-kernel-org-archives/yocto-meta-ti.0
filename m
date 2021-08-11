Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11040.1628704114069971723
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 10:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EF7A240C8E;
	Wed, 11 Aug 2021 17:48:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbqllgzaJ5yw; Wed, 11 Aug 2021 17:48:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D2FF7407FE;
	Wed, 11 Aug 2021 17:48:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A4EC174657; Wed, 11 Aug 2021 13:48:31 -0400 (EDT)
Date: Wed, 11 Aug 2021 13:48:31 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: nikhil.nd@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH v3] meta-ti: convert to new override syntax in honister
Message-ID: <20210811174831.GT1528@denix.org>
References: <1628637446-35725-1-git-send-email-denis@denix.org>
 <287ae2ec-e682-a561-fd29-00bae48d2ff1@ti.com>
MIME-Version: 1.0
In-Reply-To: <287ae2ec-e682-a561-fd29-00bae48d2ff1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2021 at 09:28:52PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> 
> Denys,
> 
> On 11/08/21 4:47 am, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Upcoming "honister" release changes the override syntax to improve usability,
> >speed and memory footprint. Update recipes with the new syntax and set layer
> >compatibility to honister.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >Tested-by: Paul Barker <paul.barker@sancloud.com>
> >---
> >v3:
> >makefile_armv7 is a false-positive and shouldn't be converted
> >pick up Paul's Tested-by: from v2
> 
> To do all the override changes without any human errors,
> is there a tool/script that you used? OR was it done manually?
> Please share how this can be done for other layers as well.

Nikhil,

There's a generic script in OE-Core under scripts/contrib/convert-overrides.py 
that does a bunch of regexps on a layer:
https://git.openembedded.org/openembedded-core/tree/scripts/contrib/convert-overrides.py

It is best suited for OE-Core, of course, as each layer usually brings tons of 
own overrides, especially BSP and Distro layers. So the script needs to be 
adjusted to each layer individually, but is a good start. And it usually takes 
several iterations and lots of reviews to get it almost right...

BTW, I'll be converting meta-arago next, but meta-ti is a high priority now 
and needs to be merged ASAP, as bitbake from master will refuse to parse most 
of the old override syntax.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
