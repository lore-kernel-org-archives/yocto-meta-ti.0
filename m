Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A66EE00527
	for <meta-ti@yoctoproject.org>; Sat, 12 Jan 2013 02:20:46 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:34205 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TtyCi-0005yQ-IV; Sat, 12 Jan 2013 05:20:44 -0500
Date: Sat, 12 Jan 2013 05:20:40 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANmH2DVSoaWz8Ob66QPjtt79cRjpEeQ9EuAj4uwTOU9WBA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1301120516390.14709@oneiric>
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
	<50EED938.8080108@mlbassoc.com>
	<alpine.DEB.2.02.1301101008200.7994@oneiric>
	<CAHUNapRvWWZNuGOfwnfAymhSoApc0_Y29CT8=S19cdBBkRvZCA@mail.gmail.com>
	<alpine.DEB.2.02.1301110652110.10214@oneiric>
	<CABcZANmH2DVSoaWz8Ob66QPjtt79cRjpEeQ9EuAj4uwTOU9WBA@mail.gmail.com>
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
Subject: Re: has anyone actually tested sdcard_image.bbclass?
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
X-List-Received-Date: Sat, 12 Jan 2013 10:20:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 11 Jan 2013, Chris Larson wrote:

>
> On Fri, Jan 11, 2013 at 5:02 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       IMAGE_CLASSES += "sdcard_image"
>
>       but after i do that:
>
>       $ bitbake-env -r core-image-minimal IMAGE_CLASSES IMAGE_FSTYPES
>       Parsing recipes..ERROR: Error executing a python function in <code>:
>       NameError: global name 'imagetypes_getdepends' is not defined
>       ... huge snip here ...
>
> image.bbclass defines the default IMAGE_CLASSES using ?=. Which
> means if your distro doesn't define its own default value, you'll
> end up with IMAGE_CLASSES only containing sdcard_image, not both
> image_types and sdcard_image, and clearly both are required.

  i don't see that happening with the raspberry pi layer.  if i
configure for that layer sitting on top of oe-core, and just

  $ bitbake rpi-basic-image

this setting from the rpi layer:

conf/machine/include/rpi-default-settings.inc:IMAGE_CLASSES += "sdcard_image-rpi"

produces this with bitbake-env:

$ bitbake-env -r rpi-basic-image IMAGE_CLASSES
Parsing recipes..done.
IMAGE_CLASSES=" sdcard_image-rpi"
$

  the value of IMAGE_CLASSES clearly *doesn't* include "image_types",
but the build works fine and i get the resulting SD card image in
tmp/deploy/images:

rpi-basic-image-raspberrypi-20130112091402.rootfs.rpi-sdimg

  i'm sure i'm misreading what you wrote, but you can see from the
output of bitbake-env that there is no "image_types" in IMAGE_CLASSES
and the build works just fine.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

