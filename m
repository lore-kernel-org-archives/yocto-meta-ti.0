Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53224E0048B
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 10:54:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7AHsUNP013585;
	Sat, 10 Aug 2013 12:54:30 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7AHsUKI013745;
	Sat, 10 Aug 2013 12:54:30 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 10 Aug 2013 12:54:30 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7AHsUnJ006695;
	Sat, 10 Aug 2013 12:54:30 -0500
Date: Sat, 10 Aug 2013 13:54:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Kovesdi Gyorgy <kgy@teledigit.eu>
Message-ID: <20130810175429.GF27433@edge>
References: <1554710.Rp68v4FIpQ@kgy-pc>
 <20130810173820.GC27433@edge>
MIME-Version: 1.0
In-Reply-To: <20130810173820.GC27433@edge>
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
X-List-Received-Date: Sat, 10 Aug 2013 17:54:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Aug 10, 2013 at 01:38:20PM -0400, Denys Dmytriyenko wrote:
> On Sat, Aug 10, 2013 at 06:30:10PM +0200, Kovesdi Gyorgy wrote:
> > Hi,
> > 
> > I have no luck with libgles-omap3 too :-(
> > Trying to use the recent versions of meta-ti and poky, i got the following 
> > error:
> > 
> > ERROR: QA Issue: File '/usr/lib/libsrv_init.so.1.9.2188537' from libgles-omap3 
> > was already stripped, this will prevent future debugging!
> > ....... (a lot of other similar files are mentioned here) .......
> > Summary: 1 task failed:
> >   /home/kgy/work/Yocto/poky/meta-ti/recipes-graphics/libgles/libgles-
> > omap3_4.09.00.01.bb, do_package
> > 
> > Some time ago, this kind of QA problems was treated as warnings - as far as i 
> > remember. Currently i don't care about debugging, so it would also good if i 
> > could ignore these errors or at least switch them to warning. Is it possible?
> 
> This seems to be Poky-specific issue. Those are still warnings in 
> oe-core/master when built in distro-less setup, as well as in Arago distro. 
> 
> You need to disable that specific QA check in your distro or local.conf to get 
> through. Unfortunately, most of the libraries in libgles are proprietary and 
> shipped in binary form that are already stripped, so this QA check will always 
> complain, but needs to be non fatal...

Here's a pointer:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/distro/poky.conf#n102

# QA check settings - a little stricter than the OE-Core defaults

And "already-stripped" should be in WARN_QA instead of ERROR_QA.

-- 
Denys

