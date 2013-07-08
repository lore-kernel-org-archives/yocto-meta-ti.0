Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92621E01445
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 14:36:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r68LaDsh005280;
	Mon, 8 Jul 2013 16:36:13 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r68LaDBS025531;
	Mon, 8 Jul 2013 16:36:13 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Jul 2013 16:36:12 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r68LaCtp031757;
	Mon, 8 Jul 2013 16:36:12 -0500
Date: Mon, 8 Jul 2013 17:36:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130708213612.GE13909@edge>
References: <alpine.DEB.2.02.1307070755370.23001@oneiric>
	<20130708181457.GQ16630@bill-the-cat>
	<alpine.DEB.2.02.1307081427240.10955@oneiric>
	<20130708190716.GR16630@bill-the-cat>
	<alpine.DEB.2.02.1307081535070.12053@oneiric>
	<51DB242D.9070900@ti.com>
	<alpine.DEB.2.02.1307081723400.12738@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1307081723400.12738@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Tom Rini <trini@ti.com>, meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: proper recipe to build for BBB using the meta-ti layer?
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
X-List-Received-Date: Mon, 08 Jul 2013 21:36:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 08, 2013 at 05:25:48PM -0400, Robert P. J. Day wrote:
> 
>   i'm willing to follow some "official" recipe line by line to build a
> simple bootable SD card for my BBB using the meta-ti layer, just to
> see where things seem to go wrong.
> 
>   i just started a fresh build and the first thing i got was:
> 
> WARNING: Variable key FILES_${PN}-dev (${includedir}
> ${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig
> ${datadir}/pkgconfig ${datadir}/aclocal ${base_libdir}/*.o
> ${libdir}/${BPN}/*.la ${base_libdir}/*.la) replaces original key
> FILES_ti-ipc-dev (${libdir}/*).
> WARNING: Variable key FILES_${PN}-dev (${includedir}
> ${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig
> ${datadir}/pkgconfig ${datadir}/aclocal ${base_libdir}/*.o
> ${libdir}/${BPN}/*.la ${base_libdir}/*.la) replaces original key
> FILES_ti-syslink-dev (${libdir}/*).
> 
> is this expected, or is this an indication of an obvious error on my
> part in terms of layer selection or something?

These 2 warnings have nothing to do with your problem.


>   in any event, i'm going to take the build through to its conclusion
> and try again. open to suggestions ...
> 
> rday
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

