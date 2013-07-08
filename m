Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDDBAE01445
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 14:25:55 -0700 (PDT)
Received: from [174.115.5.73] (port=56642 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UwIwV-0006CP-03; Mon, 08 Jul 2013 17:25:55 -0400
Date: Mon, 8 Jul 2013 17:25:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Tom Rini <trini@ti.com>
In-Reply-To: <51DB242D.9070900@ti.com>
Message-ID: <alpine.DEB.2.02.1307081723400.12738@oneiric>
References: <alpine.DEB.2.02.1307070755370.23001@oneiric>
	<20130708181457.GQ16630@bill-the-cat>
	<alpine.DEB.2.02.1307081427240.10955@oneiric>
	<20130708190716.GR16630@bill-the-cat>
	<alpine.DEB.2.02.1307081535070.12053@oneiric>
	<51DB242D.9070900@ti.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Mon, 08 Jul 2013 21:25:56 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm willing to follow some "official" recipe line by line to build a
simple bootable SD card for my BBB using the meta-ti layer, just to
see where things seem to go wrong.

  i just started a fresh build and the first thing i got was:

WARNING: Variable key FILES_${PN}-dev (${includedir}
${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig
${datadir}/pkgconfig ${datadir}/aclocal ${base_libdir}/*.o
${libdir}/${BPN}/*.la ${base_libdir}/*.la) replaces original key
FILES_ti-ipc-dev (${libdir}/*).
WARNING: Variable key FILES_${PN}-dev (${includedir}
${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig
${datadir}/pkgconfig ${datadir}/aclocal ${base_libdir}/*.o
${libdir}/${BPN}/*.la ${base_libdir}/*.la) replaces original key
FILES_ti-syslink-dev (${libdir}/*).

is this expected, or is this an indication of an obvious error on my
part in terms of layer selection or something?

  in any event, i'm going to take the build through to its conclusion
and try again. open to suggestions ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

