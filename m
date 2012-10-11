Return-Path: <ebutera@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D590E00292
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:53:22 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so1849756vbm.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=2kjwY8X0GgXnjduo+MiVuznLDns50bkwm0zFytVcEi0=;
	b=nGyrm1tY+OREKnzMhGWLKy5E/CtPhvT5tHtoz8yXlcdnB+YzFUwOgNf4QtJFdCC3BL
	sznkHDamYGVMU1VKSqKHQre52YkVyy7BJQDNkRaZAr/edQdOWLmTa9GIUGuk/zQqhRvz
	XK2L9qkwdc2+ynNcpQ+2f48HJVRkl/edB2stvf/1N/C8zKLtLfuGUWCWfx5hIRkKItJW
	H9LFCIXoabdXN1/sUx6/OUKNmwZwLy1TJumIRUR3JSQ/1xCHpb5MxEdzTIywx0eZIGBO
	tCLLHCPw6mjm1QI6jqJ8PJHFLRlSFBBl8d7QuxLjeglsPGnfduFUJwQkANjhsZHvJocZ
	d0gg==
MIME-Version: 1.0
Received: by 10.52.88.15 with SMTP id bc15mr190495vdb.102.1349952801953; Thu,
	11 Oct 2012 03:53:21 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Thu, 11 Oct 2012 03:53:21 -0700 (PDT)
In-Reply-To: <CAOT3miJo3tMK8nAc0x3o=cFBOuoMrUjvSYR61LbH9oGDsa2fvg@mail.gmail.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-4-git-send-email-ebutera@users.berlios.de>
	<CAOT3miJo3tMK8nAc0x3o=cFBOuoMrUjvSYR61LbH9oGDsa2fvg@mail.gmail.com>
Date: Thu, 11 Oct 2012 12:53:21 +0200
X-Google-Sender-Auth: EARzsoJ7fPCBfSHXy2vrDoJ4icY
Message-ID: <CA+2YH7unzpCXz9+V2WZUEZeE-9r_yaft220BRyXkSc9eNesRCw@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Nicolas Dechesne <ndec13@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/6] libdce: add version 1.6.5.3
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
X-List-Received-Date: Thu, 11 Oct 2012 10:53:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 10:17 AM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
>> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
>> +DESCRIPTION = "TI Ducati IVA-HD hardware codec acceleration API"
>> +HOMEPAGE = "http://gitorious.org/ubuntu-omap/dce"
>
> our real 'upstream' tree for libdce is here:
> http://gitorious.org/gstreamer-omap/libdce/
>
> the one you are using is our 'ubuntu package' tree where the
> 'upstream' is merged along with debian/ubuntu meta data (./debian
> folder).
>
> sometimes we maintain some patches in ubuntu tree in debian/patches,
> but for libdce since we are also the real upstream, we tend to push
> all patches in upstream.
>
> so you should use the upstream tree instead, branch master. in fact
> the 'upstream' branch in the tree you use is the same as the 'master'
> branch of the upstream tree ;-)

Yes i had some confusion at first between the two repositories, i
think i started using the ubuntu one because it has tags that can help
in releases maintenance, but in the end i didn't use them so yes, i
will switch to the upstream tree.


> libdce tree contains both the linux side lib, and the ducati side DCE
> code for now (which can't be rebuild completely for now, as we aren't
> releasing all the bits/pieces for ducati side).
>
> we have been discussing about spliting this tree into 2 for better
> clarity, so that might happen at some point..

I learned it the hard way some time ago, at my first attempt to add gst-ducati!


>> +
>> +require ../includes/ti-paths.inc
>> +require ../includes/ti-staging.inc
>
> what is this for?

some copy/paste leftovers :D
will delete them


>> +
>> +inherit autotools
>> +
>> +DEPENDS = "libdrm"
>> +RDEPENDS = "libdrm ti-firmware-ipu-dce"
>
> i would hope that libdrm is not needed in RDEPENDS, as it should be
> handled automagically by shlibdeps.

I really don't know, if you are sure about that i will just remove it.

Enrico

