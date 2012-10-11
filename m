Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D35A2E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 09:11:37 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9BGBZa0027264;
	Thu, 11 Oct 2012 11:11:35 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9BGBZx6030616;
	Thu, 11 Oct 2012 11:11:35 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Oct 2012 11:11:34 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9BGBYQm032735;
	Thu, 11 Oct 2012 11:11:34 -0500
Date: Thu, 11 Oct 2012 12:11:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jason Kridner <jkridner@gmail.com>
Message-ID: <20121011161134.GF17839@edge>
References: <CA+T6QPnq1dZOJ-D+C-FFodCBjxN5AOE_qC3dFj_Vtz86rdk0bg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+T6QPnq1dZOJ-D+C-FFodCBjxN5AOE_qC3dFj_Vtz86rdk0bg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, beagleboard@googlegroups.com
Subject: Re: Introducing meta-beagleboard
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
X-List-Received-Date: Thu, 11 Oct 2012 16:11:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 11, 2012 at 11:46:36AM -0400, Jason Kridner wrote:
> To help foster fast development, future releases of the Angstrom
> Distribution that ships with BeagleBoard.org platforms (such as
> BeagleBone and BeagleBoard-xM) will be built using meta-beagleboard,
> rather than meta-ti. While this produces the seemingly undesirable
> effect of providing yet-another-BSP for BeagleBoard.org platforms,
> collaboration in the mainline kernel and bootloaders that are the key
> elements for the BSPs has made this possible and multiple goals for
> the various BSPs has made it desirable.

Thank you, Jason!

Before everyone freaks out - this is a good thing. This will enable meta-ti 
and meta-beagleboard to achieve their respective goals, as it relates to the 
common BeagleBone and BeagleBoard-xM platforms, w/o slowing or impeding each 
other. Thank you for your understanding.

-- 
Denys


> The objectives for meta-beagleboard are:
> 1) Provide the best possible out-of-box-experience for BeagleBoard.org platforms
> 2) Enable as much add-on hardware as possible
> 3) Enable public contributions to extend the experience and hardware support
> 4) Deliver information to the BeagleBoard.org community regarding the
> development status
> 
> The repository will be hosted at:
> https://github.com/beagleboard/meta-beagleboard
> 
> In addition to the many distributions of Linux picking up support for
> the hardware from the mainline Linux kernel or collaboratively pulling
> in-work patches from this repository (or the collaborative kernel
> repository at http://github.com/beagleboard/kernel), there are various
> OpenEmbedded BSP layers available for BeagleBoard.org platforms with
> other objectives. These BSPs can be very useful to you depending on
> your purpose and I've listed some here to position them relative to
> meta-beagleboard.
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/:
> * Provide a basis for building TI SDKs
> * Enable collaborative inputs from community developers seeking to
> improve the BSPs used in TI SDKs
> * Deliver BSPs that work with only oe-core required, compatible with
> meta-yocto, meta-arago and other distro layers
> * Provide a clear definition of what is supported by TI
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/:
> * Provide a reference for building Yocto BSPs
> * Provide a reference for utilizing a common kernel across Yocto
> reference platforms
> 
> meta-beagleboard is seeking to participate in the Yocto Project and
> provide reference for the other BSPs to utilize. However, its focused
> objectives enable faster support for BeagleBoard.org platforms. Support
> for the layer will come from Koen, Joel, myself and other CircuitCo or
> TI employees supporting BeagleBoard.org---and of course any other
> people who wish to contribute to the project. Where it is simple and
> sane to do so, the components in meta-ti will simply be used.
> 
> I hope you see clear value from the existence of this new layer and
> how it helps accelerate development and foster both quality and
> collaboration. Thanks for your kind support.
> 
> Best regards,
> Jason Kridner
> TI and BeagleBoard.org
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

