Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 441A0E00348
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 07:44:50 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qADFijbg013318;
	Tue, 13 Nov 2012 09:44:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qADFijIo017223;
	Tue, 13 Nov 2012 09:44:45 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 13 Nov 2012 09:44:45 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qADFijnu021188;
	Tue, 13 Nov 2012 09:44:45 -0600
Date: Tue, 13 Nov 2012 10:44:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20121113154444.GB12650@edge>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
	<alpine.DEB.2.02.1211131041310.4591@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1211131041310.4591@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Tue, 13 Nov 2012 15:44:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 13, 2012 at 10:43:05AM -0500, Robert P. J. Day wrote:
> On Tue, 13 Nov 2012, Tomas Frydrych wrote:
> 
> > On 13/11/12 15:22, Denys Dmytriyenko wrote:
> > >> For Denzil it is not possible to arrange meta-yocto and meta-ti layers
> > >> in a way that would work; this has been fixed in Danny (in
> > >> meta-yocto-bsp). If you want to stick with Denzil, there are different
> > >> ways to work around it, easiest should be to delete the offending
> > >> beagleboard.conf from meta-yocto.
> > >
> > > Why can't you put meta-ti in front of meta-yocto in Denzil? Works just fine.
> >
> > Because meta-yocto layer.conf does:
> >
> >   BBPATH := "${LAYERDIR}:${BBPATH}"
> >
> > While meta-ti layer.conf does:
> >
> >   BBPATH .= ":${LAYERDIR}"
> >
> > So regardless how you order it, you get BBPATH that looks like:
> >
> >   meta-yocto:meta:meta-ti
> >
> > Which guarantees you the beagleboard.conf from meta-yocto.
> 
>   once upon a time, i pointed out on the yocto list the inconsistency
> of how different layer.conf files set BBPATH:

Yes, it was fixed already.

-- 
Denys

