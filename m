Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4620E01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 11:47:57 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IIlu4M015579;
	Mon, 18 Mar 2013 13:47:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IIluj7028126;
	Mon, 18 Mar 2013 13:47:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 18 Mar 2013 13:47:56 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2IIludO000517;
	Mon, 18 Mar 2013 13:47:56 -0500
Date: Mon, 18 Mar 2013 14:47:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130318184755.GL32759@edge>
References: <1363632040-22025-1-git-send-email-denis@denix.org>
	<1363632040-22025-2-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED10159481CCE@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159481CCE@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/3] am335x, beaglebone: switch default preference to ti-staging tree
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 18:47:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 18, 2013 at 06:45:19PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, March 18, 2013 1:41 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH 2/3] am335x, beaglebone: switch default
> > preference to ti-staging tree
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > SDKs or other users of meta-ti can still use one of the older 3.2
> > recipes for
> > stability or featureset, by setting PREFERRED_PROVIDER in distro
> > or local config.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  conf/machine/am335x-evm.conf | 2 +-
> >  conf/machine/beaglebone.conf | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-
> > evm.conf
> > index 91f7e54..77dbced 100644
> > --- a/conf/machine/am335x-evm.conf
> > +++ b/conf/machine/am335x-evm.conf
> > @@ -13,7 +13,7 @@ IMAGE_FSTYPES += "ubi tar.gz"
> > 
> >  SERIAL_CONSOLE = "115200 ttyO0"
> > 
> > -PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
> > +PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
> 
> I would probably change the one in include/ti33x.inc and remove these 
> settings from the machine conf files.  Or at least fix ti33x.inc as well.

Good point. I was first modifying only am335x-evm, but decided to change 
beaglebone as well at the last second... :) Will send v2 shortly.

-- 
Denys

