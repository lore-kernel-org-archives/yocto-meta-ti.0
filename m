Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC5C3E01422
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 10:38:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7AHcLWH012688;
	Sat, 10 Aug 2013 12:38:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7AHcLHC029972;
	Sat, 10 Aug 2013 12:38:21 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 10 Aug 2013 12:38:20 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7AHcKq3028576;
	Sat, 10 Aug 2013 12:38:20 -0500
Date: Sat, 10 Aug 2013 13:38:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Kovesdi Gyorgy <kgy@teledigit.eu>
Message-ID: <20130810173820.GC27433@edge>
References: <1554710.Rp68v4FIpQ@kgy-pc>
MIME-Version: 1.0
In-Reply-To: <1554710.Rp68v4FIpQ@kgy-pc>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Problem compiling libgles-omap3_4.09.00.01
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
X-List-Received-Date: Sat, 10 Aug 2013 17:38:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Aug 10, 2013 at 06:30:10PM +0200, Kovesdi Gyorgy wrote:
> Hi,
> 
> I have no luck with libgles-omap3 too :-(
> Trying to use the recent versions of meta-ti and poky, i got the following 
> error:
> 
> ERROR: QA Issue: File '/usr/lib/libsrv_init.so.1.9.2188537' from libgles-omap3 
> was already stripped, this will prevent future debugging!
> ....... (a lot of other similar files are mentioned here) .......
> Summary: 1 task failed:
>   /home/kgy/work/Yocto/poky/meta-ti/recipes-graphics/libgles/libgles-
> omap3_4.09.00.01.bb, do_package
> 
> Some time ago, this kind of QA problems was treated as warnings - as far as i 
> remember. Currently i don't care about debugging, so it would also good if i 
> could ignore these errors or at least switch them to warning. Is it possible?

This seems to be Poky-specific issue. Those are still warnings in 
oe-core/master when built in distro-less setup, as well as in Arago distro. 

You need to disable that specific QA check in your distro or local.conf to get 
through. Unfortunately, most of the libraries in libgles are proprietary and 
shipped in binary form that are already stripped, so this QA check will always 
complain, but needs to be non fatal...

-- 
Denys

