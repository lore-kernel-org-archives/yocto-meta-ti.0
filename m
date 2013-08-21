Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D4FCE01562
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 06:53:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7LDrm72024972
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 08:53:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7LDrmfU006441
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 08:53:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 21 Aug 2013 08:53:47 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7LDrlv0030517;
	Wed, 21 Aug 2013 08:53:47 -0500
Date: Wed, 21 Aug 2013 09:53:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20130821135346.GA24491@edge>
References: <CF956B779D819D41BBC043B7082161D544493F@DBDE04.ent.ti.com>
	<20130820164111.GC8481@edge>
	<CF956B779D819D41BBC043B7082161D5444B02@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D5444B02@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Timeout issue
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
X-List-Received-Date: Wed, 21 Aug 2013 13:53:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 21, 2013 at 01:21:57AM -0400, Hingolikar, Mrinmayee wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, August 20, 2013 10:11 PM
> > To: Hingolikar, Mrinmayee
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] Timeout issue
> > 
> > On Tue, Aug 20, 2013 at 09:33:15AM +0000, Hingolikar, Mrinmayee wrote:
> > > Hi all,
> > >
> > > During yocto build many times the fetch times out resulting in a
> > > fetcher failure. The same command for fetch when run with a larger
> > > timeout for wget succeeds.
> > > Where can we modify the arguments to wget so that the build doesn't
> > > halt due to a fetcher failure?
> > 
> > Mrinmayee,
> > 
> > Please also raise this issue with the IT department from your side -
> > we've seen the proxies timing out lately for other teams and the more
> > people complain, the faster it should get resolved... Thanks.
> > 
> Yes we have raised this issue with the IT department for the omapzoom server 
> as of now. Thanks.

This is not a problem with any specific server, it's a problem with the Proxy!

-- 
Denys

