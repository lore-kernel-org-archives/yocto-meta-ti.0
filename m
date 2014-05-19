Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CCFCE00B6C; Mon, 19 May 2014 06:44:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CF38E00B66
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 06:44:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JDiI90005419;
	Mon, 19 May 2014 08:44:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JDiIHO018377;
	Mon, 19 May 2014 08:44:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 08:44:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JDiIO5027193;
	Mon, 19 May 2014 08:44:18 -0500
Date: Mon, 19 May 2014 09:44:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: deepak vijay <deepakvijay2255@rediff.com>
Message-ID: <20140519134417.GP18053@edge>
References: <CAAxuRXhiK2cce86W7wWrahrOC=jaAqyVXaU_KCFwg2cQqJR0NQ@mail.gmail.com>
	<20140516174509.GB18053@edge>
	<CAAxuRXjVQfMfiVSc=0aG3Px75Ab0YYOd-gZd4DO8kQwrk8cNEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAxuRXjVQfMfiVSc=0aG3Px75Ab0YYOd-gZd4DO8kQwrk8cNEQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: boot fail in omap3 evm
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
X-List-Received-Date: Mon, 19 May 2014 13:44:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 19, 2014 at 05:28:59PM +0530, deepak vijay wrote:
> Hi Denys,
> I tried the lower version of yocto (1.2 denzil) but it was its not
> supporting the meta-ti layer which contains omap3evm support. It was

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/omap3evm.conf?h=denzil


> throwing some un known error and os incompatibility error also. So I
> dropped  the idea of using lower versions.
> So I was planing to move to next suggested option and I find out that only
> 2.6.x kernel recipe (linux-omap_2.6.37.bb) support omap3evm. Not the higher
> versions.
> Please help me to resolve this problem.
> How to add support for omap3evm to the higher kernel recipes in meta-ti
> layer.
> 
> All the responses are appreciated.
> 
> Regards,
> Deepak
> 
> 
> On Fri, May 16, 2014 at 11:15 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Fri, May 16, 2014 at 12:33:31PM +0530, deepak vijay wrote:
> > > Hi all,
> > > I am new to yocto project .
> > > I have downloaded the beaglebone-daisy-11.0.0 and add meta-ti layer
> > whith a
> > > commit id of 4e5bcb5712bf2f0587ceff908d75177e410de48f.
> > > And when I build it for omap3evm and boot the images of the build I am
> > > getting the following dump logs when I enable earlyprintk without
> > changing
> > > any other configurations.
> > >
> > > And one of the member suggested me that use lower version of gcc like gcc
> > > 4.3. But I didn't find any way to use it. Because only gcc 4.8.2 recipe
> > is
> > > there in the layer.
> >
> > You can grab one of the older Yocto releases, e.g. 1.2 denzil has gcc-4.6
> > Otherwise there were/are some layers still with gcc-4.5 support, at least
> > in
> > the external toolchain form...
> >
> > On the other hand, may I ask why do you want to build such an old kernel
> > with
> > the latest Yocto setup and the toolchain? Can you just use one of the
> > recent
> > 3.x kernels?
> >
> > --
> > Denys
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

