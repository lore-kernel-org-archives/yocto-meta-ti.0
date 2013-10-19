Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9900E0043A
	for <meta-ti@yoctoproject.org>; Sat, 19 Oct 2013 09:53:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9JGrGQp022095;
	Sat, 19 Oct 2013 11:53:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9JGrGwM015219;
	Sat, 19 Oct 2013 11:53:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 19 Oct 2013 11:53:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9JGrGbY018688;
	Sat, 19 Oct 2013 11:53:16 -0500
Date: Sat, 19 Oct 2013 12:53:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20131019165314.GL2127@edge>
References: <alpine.DEB.2.02.1310190646210.20906@oneiric>
	<alpine.DEB.2.02.1310190717170.9159@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1310190717170.9159@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: using yocto and meta-ti to build for beaglebone black?
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
X-List-Received-Date: Sat, 19 Oct 2013 16:53:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Oct 19, 2013 at 07:22:31AM -0400, Robert P. J. Day wrote:
> On Sat, 19 Oct 2013, Robert P. J. Day wrote:
> 
> >
> >   a couple quick questions. first, as an example for a tutorial, i
> > want to show using yocto and meta-ti to build a simple
> > (core-image-minimal?) for a BBB. it seems simple enough -- i just
> > configured a new build directory, added the meta-ti layer, set MACHINE
> > to "beaglebone" and it's cranking away on all 8 cores as we speak.
> >
> >   i'm well aware of the recent u-boot uImage->zImage switch, which
> > makes me happy. :-) so as long as i get valid artifacts dumped into
> > the images/ directory when this is over, i figure i can take it from
> > there. as i'm using the master branch for everything (oe-core,
> > meta-ti), should this just work?
> >
> >   also, i just noticed the meta-ti recipe for "x-load". isn't this
> > just for generating the "MLO" file required by a number of TI boards
> > that u-boot takes care of these days? what's the relationship between
> > those two? is x-load just for TI machines for which u-boot doesn't
> > generate an appropriate MLO file?

x-load is deprecated. It's kept for old platforms only.


>   at risk of adding another question to this earlier post, my build of
> a core-image-minimal worked, and among other generated artifacts in
> images/beaglebone/, i have the files:
> 
>  * MLO -> MLO-beaglebone-2013.10-r0+gitrAUTOINC+183acb7003
>  * u-boot-spl.bin-beaglebone-2013.10-r0+gitrAUTOINC+183acb7003
> 
> which are very close in size. i'm used to just installing the MLO
> file, so what's the difference here? what am i supposed to do with the
> "spl" file?

The second one is SPL/UART:

http://processors.wiki.ti.com/index.php/AM335x_U-Boot_User's_Guide#Boot_Over_UART

-- 
Denys

