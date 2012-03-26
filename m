Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11650E013DD
	for <meta-ti@yoctoproject.org>; Mon, 26 Mar 2012 06:43:00 -0700 (PDT)
Received: by werc1 with SMTP id c1so5694774wer.35
	for <meta-ti@yoctoproject.org>; Mon, 26 Mar 2012 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mpe7XzO+2dizmMkJy9mS8arKKpIGpUPnAQwhXjcCnt0=;
	b=kDaaB91iV7v+s1JXlAgB8PAz7SQISL6AuPTAfKgQSO5PS+SM0GWEc3xr0yvvZpG218
	Tp/ZyNqbIvanus/N00QBppumNmF2bC5CtI7PjDxGSSbR48yDXvHTn7H9sOa4k+yX7VfN
	PYVYytROOj/e+qhp4CjPJM07r8OcYHvr2zsoOZwj+wk02ynhO657jUoIJxqoh1SCyLYQ
	HndMX3seNdFKfp1JLXDMIScrYq0i+YMGULjHmuHR5zW7JHZatazStwv02CUQwpggBD58
	YhNs+7FVy1V04QA+at1ZfZqrRpkbRf9NX5xRn4J2FrbOMLw9jm8ZQV7ppgo171q7XJpE
	/1wQ==
MIME-Version: 1.0
Received: by 10.180.80.9 with SMTP id n9mr18796073wix.4.1332769379718; Mon, 26
	Mar 2012 06:42:59 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Mon, 26 Mar 2012 06:42:59 -0700 (PDT)
In-Reply-To: <CA+2YH7uG3VPmJ1GW_Wdo6unAKxw8c-LiT8wMEBRSvkBSsb3xfA@mail.gmail.com>
References: <CAGiJk9e8hi80AB4R6+E8TgmosYXFx=y768oOah3S++w=zKthZg@mail.gmail.com>
	<CAGiJk9fOyxDASHkFR_VFzYfgoKke0rkFhSavfRGRenNgstzvVA@mail.gmail.com>
	<CA+2YH7uG3VPmJ1GW_Wdo6unAKxw8c-LiT8wMEBRSvkBSsb3xfA@mail.gmail.com>
Date: Mon, 26 Mar 2012 15:42:59 +0200
Message-ID: <CAGiJk9e478oM6iqBbSs1DYObDkHLHBFOPh7X=T1sWS=2GzHeCA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Enrico <ebutera@users.berlios.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: OpenGL ES on OMAP 3530
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 13:43:01 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/15 Enrico <ebutera@users.berlios.de>:
> On Thu, Mar 15, 2012 at 8:51 AM, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> Hi,
>>
>> currently I've been trying to get the OpenGL ES drivers working on a
>> Gumstix Overo.
>> Building the recipe works without problems, but running any examples
>> or demo applications that ship with the driver won't work.
>
> in recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb try to
> change the line:
>
> TI_PLATFORM_omap3 = "omap3630"
>
> that's for the dm3730, i can't remember right now what i used (maybe
> omap3530 or 3430) but you can find out from the Makefile.
>
> Enrico

Hi,
after much testing it wasn't possible to get the pvrsrvinit running.

To get the packages I added "libgles-omap3 libgles-omap3-es3" to the
MACHINE_EXTRA_RRECOMMENDS.
Changed the TI_PLATFORM_omap3 according to the makefile.

lsmod shows the following relevant entries:
Module                  Size  Used by
bufferclass_ti          4676  0
omaplfb                11006  0
pvrsrvkm              143234  2 bufferclass_ti,omaplfb


The init script shows no output at the first start, on every
subsequent start it displays that the service failed to start.
Some debugging shows that pvrsrvinit returns exit code 1, any idea?


-- 
Regards
Samuel

