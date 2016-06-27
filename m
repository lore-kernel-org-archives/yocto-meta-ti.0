Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF496E009CE; Mon, 27 Jun 2016 08:07:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFC6BE009A5
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 08:07:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5RF67aL015321
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 10:06:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RF781B032335
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 10:07:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Jun 2016 10:07:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RF77MY023442;
	Mon, 27 Jun 2016 10:07:08 -0500
Date: Mon, 27 Jun 2016 11:07:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>
Message-ID: <20160627150707.GA2177@edge>
References: <1467038074-1075-1-git-send-email-anandb@ti.com>
	<20160627144220.GY2177@edge>
	<05CF4794C98B244ABDC620C10903762275BA6628@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <05CF4794C98B244ABDC620C10903762275BA6628@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] ti-sgx-ddk-um: update srcrev and bump PR
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
X-List-Received-Date: Mon, 27 Jun 2016 15:07:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 27, 2016 at 11:06:38AM -0400, Balagopalakrishnan, Anand wrote:
> Denys,
> 
> I have submitted v2 of the patches with the update. 

Thanks!


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Monday, June 27, 2016 8:12 PM
> To: Balagopalakrishnan, Anand
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] ti-sgx-ddk-um: update srcrev and bump PR
> 
> Anand,
> 
> Would be nice to briefly summarize the changes in this update, if possible. 
> Thanks.
> 
> 
> On Mon, Jun 27, 2016 at 08:04:33PM +0530, Anand Balagopalakrishnan wrote:
> > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > ---
> >  .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb 
> > b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > index e5c5de6..b8adde0 100644
> > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > @@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  BRANCH = "ti-img-sgx/${PV}"
> >  
> >  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> > -SRCREV = "54ba970e33d3c13f726d7c035f3b5c3dcb74afdc"
> > +SRCREV = "4cdbb6b192fc5cac53695faca3c3f8be16ca871d"
> >  
> >  # There's only hardfp version available  python __anonymous() { @@ 
> > -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
> >  
> >  inherit update-rc.d
> >  
> > -PR = "r12"
> > +PR = "r13"
> >  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
> >  
> >  DEPENDS += "libdrm udev libgbm wayland libffi"
> > --
> > 1.7.9.5
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

