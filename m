Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EECF8E00563; Thu, 26 Jun 2014 10:31:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE171E0043B
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 10:31:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5QHVnSx018678;
	Thu, 26 Jun 2014 12:31:49 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5QHVnKo032136;
	Thu, 26 Jun 2014 12:31:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 26 Jun 2014 12:31:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5QHVmnq006643;
	Thu, 26 Jun 2014 12:31:48 -0500
Date: Thu, 26 Jun 2014 13:31:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tom Rini <trini@ti.com>
Message-ID: <20140626173148.GB6700@edge>
References: <1403712632-26072-1-git-send-email-denis@denix.org>
	<20140626133045.GN9006@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20140626133045.GN9006@bill-the-cat>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: disable SPL/MLO processing for omapl138 SOCs
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
X-List-Received-Date: Thu, 26 Jun 2014 17:31:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 26, 2014 at 09:30:45AM -0400, Tom Rini wrote:
> On Wed, Jun 25, 2014 at 12:10:32PM -0400, Denys Dmytriyenko wrote:
> 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-bsp/u-boot/u-boot_2014.07.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
> > index b326aa1..9da6f7d 100644
> > --- a/recipes-bsp/u-boot/u-boot_2014.07.bb
> > +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> > @@ -25,3 +25,6 @@ SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> >  
> >  SPL_BINARY = "MLO"
> >  SPL_UART_BINARY = "u-boot-spl.bin"
> > +
> > +SPL_BINARY_omapl138 = ""
> > +SPL_UART_BINARY_omapl138 = ""
> 
> omapl138 is am18xx right?  SPL supports that.  The only issue is that we
> need to ship u-boot.ais which is a combo image.  If I'm looking at the
> right branch, the problem(s) right now are we don't use the right config
> target (da850_am18xxevm_config is what we want) and UBOOT_SUFFIX to
> "ais" (in the omapl138.inc file).

What's the difference between da850_config and da850_am18xxevm_config? The 
first one is what we used previously. Is the second one set ups the building 
of "ais" image?

As of UBOOT_SUFFIX, with hierarchical inclusion of different .inc files, it 
would be overwritten if defined in the machine config. Usually we end up 
specifying it in the machine-specific u-boot recipe. Let me take a look at it 
and see if we can move that var to the machine config...

-- 
Denys

