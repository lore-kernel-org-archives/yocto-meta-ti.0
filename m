Return-Path: <jkridner@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14F7EE0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 08:46:39 -0700 (PDT)
Received: by mail-la0-f48.google.com with SMTP id u2so1460187lag.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=UparEtsFv2wVDma/GVKZJOIDFjjnyfRgxGBziIIp8oo=;
	b=deO7GuvF0HjWDq5VFmbJG5pu/JzscsSQfyX9UPhyKwdTP4WamqGBGphjaecisOoeQB
	sGMzJTDp0BFEtkTO6tRBGmFw4tkqNKZCCE6RGLWO3Xqy9MUYjokOKz6f3iY8Gtic8i8/
	XT9S0ssyj9smSZtaT9yaVJPchzx9O0fwH960O28tyqB6qFbW/U5ork4ViivUB/qcPQAm
	kLQU+sScaQBHttM6clW1HSEASv1V+F+mbvM6nUpqlg1E83DxAGKJSBvYrkfruJ2j68To
	gZlpqAZDgFOnhJy7T7kmjLFAQVi3WpD+IjJcxzGYnBAhpd5sC6w8J5K+cvlimSIP5Tg/
	54PA==
MIME-Version: 1.0
Received: by 10.112.17.169 with SMTP id p9mr193866lbd.9.1349970396634; Thu, 11
	Oct 2012 08:46:36 -0700 (PDT)
Received: by 10.112.144.35 with HTTP; Thu, 11 Oct 2012 08:46:36 -0700 (PDT)
Date: Thu, 11 Oct 2012 11:46:36 -0400
Message-ID: <CA+T6QPnq1dZOJ-D+C-FFodCBjxN5AOE_qC3dFj_Vtz86rdk0bg@mail.gmail.com>
From: Jason Kridner <jkridner@gmail.com>
To: meta-ti@yoctoproject.org, beagleboard@googlegroups.com
X-Mailman-Approved-At: Thu, 11 Oct 2012 08:49:29 -0700
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: Introducing meta-beagleboard
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
X-List-Received-Date: Thu, 11 Oct 2012 15:46:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

To help foster fast development, future releases of the Angstrom
Distribution that ships with BeagleBoard.org platforms (such as
BeagleBone and BeagleBoard-xM) will be built using meta-beagleboard,
rather than meta-ti. While this produces the seemingly undesirable
effect of providing yet-another-BSP for BeagleBoard.org platforms,
collaboration in the mainline kernel and bootloaders that are the key
elements for the BSPs has made this possible and multiple goals for
the various BSPs has made it desirable.

The objectives for meta-beagleboard are:
1) Provide the best possible out-of-box-experience for BeagleBoard.org platforms
2) Enable as much add-on hardware as possible
3) Enable public contributions to extend the experience and hardware support
4) Deliver information to the BeagleBoard.org community regarding the
development status

The repository will be hosted at:
https://github.com/beagleboard/meta-beagleboard

In addition to the many distributions of Linux picking up support for
the hardware from the mainline Linux kernel or collaboratively pulling
in-work patches from this repository (or the collaborative kernel
repository at http://github.com/beagleboard/kernel), there are various
OpenEmbedded BSP layers available for BeagleBoard.org platforms with
other objectives. These BSPs can be very useful to you depending on
your purpose and I've listed some here to position them relative to
meta-beagleboard.

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/:
* Provide a basis for building TI SDKs
* Enable collaborative inputs from community developers seeking to
improve the BSPs used in TI SDKs
* Deliver BSPs that work with only oe-core required, compatible with
meta-yocto, meta-arago and other distro layers
* Provide a clear definition of what is supported by TI

http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/:
* Provide a reference for building Yocto BSPs
* Provide a reference for utilizing a common kernel across Yocto
reference platforms

meta-beagleboard is seeking to participate in the Yocto Project and
provide reference for the other BSPs to utilize. However, its focused
objectives enable faster support for BeagleBoard.org platforms. Support
for the layer will come from Koen, Joel, myself and other CircuitCo or
TI employees supporting BeagleBoard.org---and of course any other
people who wish to contribute to the project. Where it is simple and
sane to do so, the components in meta-ti will simply be used.

I hope you see clear value from the existence of this new layer and
how it helps accelerate development and foster both quality and
collaboration. Thanks for your kind support.

Best regards,
Jason Kridner
TI and BeagleBoard.org

