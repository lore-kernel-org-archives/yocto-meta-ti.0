Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57A7BE0084F; Tue, 23 Sep 2014 11:11:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5D0DE00786
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:11:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NIBP3l032628
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:11:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NIBPdn020803
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:11:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 13:11:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NIBORL026721;
	Tue, 23 Sep 2014 13:11:25 -0500
Date: Tue, 23 Sep 2014 14:11:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140923181124.GV6303@edge>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-6-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C73B941@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C73B941@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [for master 5/6] omap5-sgx-ddk-um-linux: Updated SRCREV	to include bugfixes
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
X-List-Received-Date: Tue, 23 Sep 2014 18:11:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is this a double-ack?

On Tue, Sep 23, 2014 at 06:07:22PM +0000, Cooper Jr., Franklin wrote:
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of R, Karthik
> > Sent: Tuesday, September 23, 2014 11:01 AM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [for master 5/6] omap5-sgx-ddk-um-linux: Updated
> > SRCREV to include bugfixes
> > 
> > * This version is compatible with version Kernel 3.12
> > 
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > index b875328..37ea088 100644
> > --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > @@ -4,9 +4,9 @@ LICENSE = "TI-TSPA"
> >  LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-
> > Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
> > 
> >  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-
> > linux.git;protocol=git"
> > -SRCREV = "994922a5655c63b05343a9238cb30e6ef61744be"
> > +SRCREV = "0af11b676900de5a3e5550728fe18acd88c29848"
> > 
> > -PR = "r2"
> > +PR = "r3"
> >  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
> > 
> >  RREPLACES_${PN} = "libegl libgles1 libgles2"
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

