Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F536E01308
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 11:29:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3TITlFY013611
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 13:29:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3TITlYp002294
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 13:29:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 29 Apr 2013 13:29:47 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3TITlJn019113;
	Mon, 29 Apr 2013 13:29:47 -0500
Date: Mon, 29 Apr 2013 14:29:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130429182946.GI27211@edge>
References: <1367245658-15077-1-git-send-email-fcooper@ti.com>
	<1367245658-15077-2-git-send-email-fcooper@ti.com>
	<20130429181635.GG27211@edge>
	<8F29D6B095ED194EA1980491A5E029710C439A3B@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C439A3B@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] linux-am335x-psp: Correct recipe name typo
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
X-List-Received-Date: Mon, 29 Apr 2013 18:29:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 29, 2013 at 02:18:58PM -0400, Cooper Jr., Franklin wrote:
> What's the issue?

It was fixed 3 days ago:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=5e6fb2bcf1fff597ebb0334bbf4a36ab027965d2


> I can't find 1 kernel recipe where the kernel version is a part of the PN 
> and not PV.
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, April 29, 2013 1:17 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH 2/2] linux-am335x-psp: Correct recipe name typo
> > 
> > NAK.
> > 
> > On Mon, Apr 29, 2013 at 09:27:38AM -0500, Franklin S. Cooper Jr wrote:
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  ...x-am335x-psp-3.2.bb => linux-am335x-psp_3.2.bb} |    0
> > >  1 files changed, 0 insertions(+), 0 deletions(-)  rename
> > > recipes-kernel/linux/{linux-am335x-psp-3.2.bb =>
> > > linux-am335x-psp_3.2.bb} (100%)
> > >
> > > diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2.bb
> > > b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> > > similarity index 100%
> > > rename from recipes-kernel/linux/linux-am335x-psp-3.2.bb
> > > rename to recipes-kernel/linux/linux-am335x-psp_3.2.bb
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

