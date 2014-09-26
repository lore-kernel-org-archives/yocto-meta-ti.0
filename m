Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BA09E007B9; Fri, 26 Sep 2014 13:55:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3004E006DB
	for <meta-ti@yoctoproject.org>; Fri, 26 Sep 2014 13:55:24 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8QKtNeI016008
	for <meta-ti@yoctoproject.org>; Fri, 26 Sep 2014 15:55:23 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8QKtNm8003392
	for <meta-ti@yoctoproject.org>; Fri, 26 Sep 2014 15:55:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 26 Sep 2014 15:55:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8QKtMgR011278;
	Fri, 26 Sep 2014 15:55:22 -0500
Date: Fri, 26 Sep 2014 16:55:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140926205521.GH6303@edge>
References: <1410784339-25597-1-git-send-email-j-stiffler@ti.com>
	<4B26FB5A64EBA14C87266869E037F958140B2C3B@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C73F08B@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C73F08B@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy][PATCH] dra7xx: add "mmip" to MACHINE_FEATURES
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
X-List-Received-Date: Fri, 26 Sep 2014 20:55:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 26, 2014 at 08:33:39PM +0000, Cooper Jr., Franklin wrote:
> So this patch shouldn't be needed.
> 
> The only recipe that is using mmip is ipumm-fw. Currently the recipe has 
> COMPATIBLE_MACHINE set to only omap-a15. So why do we also need to add this 
> to the SOC family?

The above statement is not correct.

The flag mmip in MACHINE_FEATURES was introduced to handle cases of hardware 
accelerated multimedia, when some software components needs to be replaced 
with "forked" patched and modified versions. Take a look at gstreamer pieces 
in meta-arago...


> Honestly for ipumm-fw the below code should be removed.
> python __anonymous() {
>      features = bb.data.getVar("MACHINE_FEATURES", d, 1)
>      if not features:
>          return
>      if "mmip" not in features:
>          raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
>  }
> 
> Plus this patch will break things for am57xx-evm. By allowing this change 
> ipumm-fw would not be skipped for am57x evm and the current recipe will fail 
> because of it.

So, am57xx-evm should not build and load ipumm-fw is what you are saying?

-- 
Denys


> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> > Sent: Wednesday, September 24, 2014 9:42 AM
> > To: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [daisy][PATCH] dra7xx: add "mmip" to
> > MACHINE_FEATURES
> > 
> > ping
> > 
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Monday, September 15, 2014 8:32 AM
> > To: meta-ti@yoctoproject.org
> > Cc: Stiffler, Jacob
> > Subject: [daisy][PATCH] dra7xx: add "mmip" to MACHINE_FEATURES
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  conf/machine/include/dra7xx.inc |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/conf/machine/include/dra7xx.inc
> > b/conf/machine/include/dra7xx.inc index 857e1b3..a7c8782 100644
> > --- a/conf/machine/include/dra7xx.inc
> > +++ b/conf/machine/include/dra7xx.inc
> > @@ -1,4 +1,4 @@
> >  require conf/machine/include/omap-a15.inc  SOC_FAMILY_append =
> > ":dra7xx"
> > 
> > -MACHINE_FEATURES += "pci"
> > +MACHINE_FEATURES += "pci mmip"
> > --
> > 1.7.9.5
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

