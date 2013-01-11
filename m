Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C05E7E01301
	for <meta-ti@yoctoproject.org>; Fri, 11 Jan 2013 04:02:09 -0800 (PST)
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:49481 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TtdJH-0006B5-W8; Fri, 11 Jan 2013 07:02:08 -0500
Date: Fri, 11 Jan 2013 07:02:06 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <CAHUNapRvWWZNuGOfwnfAymhSoApc0_Y29CT8=S19cdBBkRvZCA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1301110652110.10214@oneiric>
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
	<50EED938.8080108@mlbassoc.com>
	<alpine.DEB.2.02.1301101008200.7994@oneiric>
	<CAHUNapRvWWZNuGOfwnfAymhSoApc0_Y29CT8=S19cdBBkRvZCA@mail.gmail.com>
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
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 11 Jan 2013 12:02:10 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-648374003-1357905727=:10214"

--8323329-648374003-1357905727=:10214
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Thu, 10 Jan 2013, Trevor Woerner wrote:

> On Thu, Jan 10, 2013 at 10:11 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >> > ===== start =====
> >> > ... big snip ...
> >> > | /etc/fstab entries need to be created with the user flag for the
> >> > loop devices like:
> >> > | /dev/loop2
> >> >/home/rpjday/oe/builds/ti/bone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.
> 0-r0/tmp-mnt-boot
> >> > vfat user 0 0
>
> >   i'm going to be testing all of the above again shortly from scratch
> > to make sure it wasn't something silly i did.  but if someone wants to
> > see if they can reproduce it, all i did was a standard configure using
> > meta-ti layer for a beaglebone and i built a core-image-minimal.
>
>
> I followed the same procedure and met the same end.

... snip ...

  just to recap what seems to be an obvious bug in meta-ti, all i want
to do is add the image class of "sdcard_image" to create an SD card
image of core-image-minimal for a beaglebone.

  from a fresh configuration and adjusting to select a machine of
beaglebone, i can do all the fetching to start things off:

$ bitbake -c fetchall core-image-minimal

and i can use bitbake-env to examine the relevant variables:

$ bitbake-env -r core-image-minimal IMAGE_CLASSES IMAGE_FSTYPES
Parsing recipes..WARNING: No recipes available for:

/home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
done.
IMAGE_CLASSES="image_types"
IMAGE_FSTYPES=" tar.bz2 "
$

  so far, so good.  now, AIUI, to add the SD card image type to the
generated artifacts, i need only add this line to my local.conf:

IMAGE_CLASSES += "sdcard_image"

but after i do that:

$ bitbake-env -r core-image-minimal IMAGE_CLASSES IMAGE_FSTYPES
Parsing recipes..ERROR: Error executing a python function in <code>:
NameError: global name 'imagetypes_getdepends' is not defined
... huge snip here ...

  using the raspberry pi layer as a model, i made the following change
in meta-ti's sdcard_image.bbclass file:

diff --git a/classes/sdcard_image.bbclass
b/classes/sdcard_image.bbclass
index f9b8d46..45374e2 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -1,4 +1,4 @@
-inherit image
+inherit image_types

 # Add the fstypes we need
 IMAGE_FSTYPES_append = " tar.bz2 sdimg"

  and now, at least bitbake-env works:

$ bitbake-env -r core-image-minimal IMAGE_CLASSES IMAGE_FSTYPES
Parsing recipes..WARNING: No recipes available for:

/home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
done.
IMAGE_CLASSES=" sdcard_image"
IMAGE_FSTYPES=" tar.bz2  tar.bz2 sdimg"
$

  so, is it fair to say that that's a bug in sdcard_image.bbclass?
or is there something else that needs to be adjusted?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-648374003-1357905727=:10214--
