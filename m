Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6926CE002AC
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 14:15:40 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7ULFbnn016489;
	Thu, 30 Aug 2012 16:15:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7ULFb7e019089;
	Thu, 30 Aug 2012 16:15:37 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 30 Aug 2012 16:15:37 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7ULFbHw008147;
	Thu, 30 Aug 2012 16:15:37 -0500
Date: Thu, 30 Aug 2012 17:15:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Message-ID: <20120830211536.GA20931@edge>
References: <CALjj03Wphx5VuPkPxhYXsPJL9Pu-UsuFaCfxO17LVwTm-qO+mQ@mail.gmail.com>
	<20120830174807.GB26145@edge> <503FC4F8.9020509@r-finger.com>
	<20120830200833.GE26145@edge> <503FD378.9020003@r-finger.com>
MIME-Version: 1.0
In-Reply-To: <503FD378.9020003@r-finger.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Building a core-image-base
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
X-List-Received-Date: Thu, 30 Aug 2012 21:15:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 30, 2012 at 09:56:24PM +0100, Tomas Frydrych wrote:
> Hi,
> 
> On 30/08/12 21:08, Denys Dmytriyenko wrote:
> > For our TI SDK products and the new Arago "distribution", we are using said 
> > "denzil" branch of meta-ti. 
> 
> Having a branch is great, but 'branch' and 'release' are very different
> things; branch is a moving target, a release is a fixed point in time
> that was tested and approved, and consequently one can have a reasonable
> expectation (dare I say, a guarantee?), that it works. The current
> denzil release is 7.0.1; there isn't a meta-ti commit that works with
> this without jumping through hoops, is there? I think a BSP layer really
> needs to have formal releases.

There was a tag applied at the time of the Yocto Project release:

v2012.05-yocto1.2

[BTW, I'm not sure what 7.0.1 is - is it Poky versioning?]

That said, meta-ti was not ready to have a formal release at the time. 
Moreover, testing with Yocto/Poky release was not done - it was meant to be 
used with oe-core and possibly meta-oe and be Yocto-compatible. This may sound 
confusing, but since there's no better terminology available, that would do. 

Hopefully, by the next Yocto Project 1.3 release, we'll do better testing with 
just Yocto/Poky, but right now my focus is on bringing up the new Arago 
distro for our SDKs, while Koen is mostly interested in Angstrom. I do 
understand that we are getting more and more newcomers from a pure Yocto/Poky 
environment and making sure we have a smooth experience for them with meta-ti 
is important, but it will take some time...

-- 
Denys

