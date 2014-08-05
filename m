Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D4A6E00799; Mon,  4 Aug 2014 19:29:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2CBFE004F1
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 19:29:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s752Ta9Z013018;
	Mon, 4 Aug 2014 21:29:36 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s752TaPp005287;
	Mon, 4 Aug 2014 21:29:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 4 Aug 2014 21:29:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s752TX2e008208;
	Mon, 4 Aug 2014 21:29:35 -0500
Date: Mon, 4 Aug 2014 22:29:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140805022929.GB23523@edge>
References: <1406684113-18232-1-git-send-email-denis@denix.org>
	<CAP71WjwdFhrz=c-RJHyte7vLRVSex1DxBX=4nR7DHJVHY64BXA@mail.gmail.com>
	<20140805002000.GB2572@denix.org> <20140805022236.GA3867@haswell>
MIME-Version: 1.0
In-Reply-To: <20140805022236.GA3867@haswell>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-ti-staging: add Darren's SGX patches to make graphics work with 3.14
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
X-List-Received-Date: Tue, 05 Aug 2014 02:29:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 04, 2014 at 07:22:36PM -0700, Khem Raj wrote:
> On 14-08-04 20:20:00, Denys Dmytriyenko wrote:
> > On Tue, Aug 05, 2014 at 01:24:18AM +0200, Nicolas Dechesne wrote:
> > > Hi,
> > > 
> > > On Wed, Jul 30, 2014 at 3:35 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > > > index b505640..c223c88 100644
> > > > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > > > +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > > > @@ -3,8 +3,6 @@ DESCRIPTION = "Linux kernel for TI devices"
> > > >  LICENSE = "GPLv2"
> > > >  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > > >
> > > > -DEFAULT_PREFERENCE = "-1"
> > > > -
> > > 
> > > i just noticed this change ^^. Was this intentional? This is a big
> > > change which could have been in its own commit, or at least should
> > > have been mentioned in the commit log... as it is it was lost in the
> > > noise..
> > 
> > Yes, it was intentional.
> > 
> 
> Wouldnt hurt if it was mentioned in commit log

Ok, will try to remember next time :)

Which SoC are you guys using?

-- 
Denys

