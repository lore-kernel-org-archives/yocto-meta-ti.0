Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C924E0032E
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 07:22:41 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qADFMcYl010731;
	Tue, 13 Nov 2012 09:22:38 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qADFMcvh030992;
	Tue, 13 Nov 2012 09:22:38 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 13 Nov 2012 09:22:38 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qADFMch4014864;
	Tue, 13 Nov 2012 09:22:38 -0600
Date: Tue, 13 Nov 2012 10:22:38 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Message-ID: <20121113152237.GA12650@edge>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com>
MIME-Version: 1.0
In-Reply-To: <50A26410.5030405@r-finger.com>
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
X-List-Received-Date: Tue, 13 Nov 2012 15:22:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 13, 2012 at 03:15:28PM +0000, Tomas Frydrych wrote:
> Hi,
> 
> On 13/11/12 13:46, Flavio Castro Alves Filho wrote:
> > Hello all,
> > 
> > I'm using Yocto Project and meta-ti to build an embedded Linux distribution
> > for BeagleBoard-xM.
> > 
> > I need to add gstreamer-ti into the project, and I'm having problems in
> > building this package with my configuration.
> > 
> > NOTE: package ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b: task
> > do_fetch: Started
> 
> My guess would be that your layers are not set up correctly, you can see
> in the error output that the ${MACHINE_KERNEL_PR} variable is not
> getting expanded; this is defined in omap3.inc in meta-ti, which would
> be included from the meta-ti beagleboard.conf, but the way the layers
> are set up leads to the yocto beagleboard.conf being used instead.

Right.


> For Denzil it is not possible to arrange meta-yocto and meta-ti layers
> in a way that would work; this has been fixed in Danny (in
> meta-yocto-bsp). If you want to stick with Denzil, there are different
> ways to work around it, easiest should be to delete the offending
> beagleboard.conf from meta-yocto.

Why can't you put meta-ti in front of meta-yocto in Denzil? Works just fine.


> (If you are providing your own distro layer, and the layer is set up to
> prefix itself to the BBPATH, you can provide your own beagleboard.conf
> that sources the correct one from meta-ti, something like this,

Well, it's only the problem for the BBLAYERS order, so you don't really need 
any fancy setups, just do this in build/conf/bblayers.conf in Denzil:

BBLAYERS ?= " \
  /OE/poky/meta \
  /OE/poky/meta-ti \
  /OE/poky/meta-yocto \
  "

Or for Danny/master:

BBLAYERS ?= " \
  /OE/poky/meta \
  /OE/poky/meta-yocto \
  /OE/poky/meta-ti \
  /OE/poky/meta-yocto-bsp \
  "

-- 
Denys

