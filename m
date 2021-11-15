Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.72.1637007887313450885
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 12:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF8A640BEB
	for <meta-ti@lists.yoctoproject.org>; Mon, 15 Nov 2021 20:24:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1VwT0OQ5LNq for <meta-ti@lists.yoctoproject.org>;
	Mon, 15 Nov 2021 20:24:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC851400CF
	for <meta-ti@lists.yoctoproject.org>; Mon, 15 Nov 2021 20:24:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2AF121746CD; Mon, 15 Nov 2021 15:24:45 -0500 (EST)
Date: Mon, 15 Nov 2021 15:24:45 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] mpm-transport: Do not use append with += operator
Message-ID: <20211115202445.GV10132@denix.org>
References: <20211104172934.4088591-1-raj.khem@gmail.com>
 <16B46967FE386BDB.15444@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16B46967FE386BDB.15444@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 04, 2021 at 01:54:16PM -0400, Denys Dmytriyenko wrote:
> On Thu, Nov 04, 2021 at 10:29:34AM -0700, Khem Raj wrote:
> > this is undefined behaviour, mant times devs used them together to get
> > the missing space at the beginning of string which append/prepend needs
> > but thats not intended behaviour
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> Acked-by: Denys Dmytriyenko <denys@konsulko.com>

Yogesh,

I don't believe this patch has made it into master...


> > ---
> >  recipes-ti/mpm-transport/mpm-transport_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > index 38aefc24..3b80af34 100644
> > --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > @@ -21,8 +21,8 @@ PR = "r0"
> >  
> >  CC += "-fcommon"
> >  EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
> > -EXTRA_OEMAKE:append:k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> > -EXTRA_OEMAKE:append:k2e += "HYPLNK_TRANSPORT=true"
> > +EXTRA_OEMAKE:append:k2hk = " HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> > +EXTRA_OEMAKE:append:k2e = " HYPLNK_TRANSPORT=true"
> >  INSANE_SKIP:${PN} += "ldflags"
> >  
> >  S = "${WORKDIR}/git"
> > -- 
> > 2.33.1
> > 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
