Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04FACE0070F
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 07:07:35 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id AF08FF81239; Thu, 10 Jan 2013 08:07:34 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C1658F81212;
	Thu, 10 Jan 2013 08:07:33 -0700 (MST)
Message-ID: <50EED938.8080108@mlbassoc.com>
Date: Thu, 10 Jan 2013 08:07:36 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
In-Reply-To: <alpine.DEB.2.02.1301100943340.32462@oneiric>
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
X-List-Received-Date: Thu, 10 Jan 2013 15:07:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-01-10 07:48, Robert P. J. Day wrote:
>
>    testing SD card image creation under meta-ti for the first time and
> the first issue seems to be that this is necessary:
>
> diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
> index f9b8d46..45374e2 100644
> --- a/classes/sdcard_image.bbclass
> +++ b/classes/sdcard_image.bbclass
> @@ -1,4 +1,4 @@
> -inherit image
> +inherit image_types
>
>   # Add the fstypes we need
>   IMAGE_FSTYPES_append = " tar.bz2 sdimg"
>
>    also, even after i make that change, i get:
>
> ===== start =====
> ... big snip ...
> | /etc/fstab entries need to be created with the user flag for the
> loop devices like:
> | /dev/loop2
> /home/rpjday/oe/builds/ti/bone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/tmp-mnt-boot
> vfat user 0 0
> | ERROR: Function failed: do_rootfs (see
> /home/rpjday/oe/builds/ti/bone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.1938
> for further information)
> ERROR: Task 7
> (/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/images/core-image-minimal.bb,
> do_rootfs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1922 tasks of which 1901 didn't need to
> be rerun and 1 failed.
> No currently running tasks (1922 of 1923)
>
> Summary: 1 task failed:
>
> /home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/images/core-image-minimal.bb,
> do_rootfs
> ===== end =====
>
> but i'm willing to believe that's something i did stupidly so i'll
> look at it further.
>
>    thoughts?  all i did for a test was add this to local.conf:
>
> IMAGE_CLASSES += "sdcard_image"
>
> and run:
>
> $ bitbake core-image-minimal
>
> the previous build worked fine without trying to create the SD card
> image.

Did you look at the log to see why it failed?  Last time I tried this,
it required horrible set up to make it work (something I never wanted
to take the time to accomplish).

Interestingly enough, the meta-fsl-arm layer also has an SD card image
layout (class) which works perfectly and needs no magic to make it work.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

