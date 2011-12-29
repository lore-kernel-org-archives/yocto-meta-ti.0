Return-Path: <pabigot@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C782E006B5
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 16:20:52 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wibhq4 with SMTP id hq4so8519068wib.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 16:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=tNH8e0g34fTlQ6f47EILr3Czdbjy4RaIqh0DbtUAhMc=;
	b=b3W9mCK5tGN7Jc1/Ni+VDuiLFdJU+SBE/vPmlpNcx2c4xG8O3uMwh7AUnF6GSaxn8L
	GxyZYEpOOO7GRn//Hdyh+ictH7iP/VZYIlbw2ibE1k2qX4dNTf4DVOhVAI5sAOH+oIn1
	0Ppr+BJiMZtNYqNNMyhJDOhV1lq6ySPB/7t3M=
MIME-Version: 1.0
Received: by 10.181.13.17 with SMTP id eu17mr74483544wid.12.1325118051873;
	Wed, 28 Dec 2011 16:20:51 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.231.84 with HTTP; Wed, 28 Dec 2011 16:20:51 -0800 (PST)
In-Reply-To: <CAPOJ94PNkZ1Ko4bu=d+ZNH2EGH9J0jNL7R7t=A_MLXKbOORaow@mail.gmail.com>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
	<1325033520-6907-6-git-send-email-bigotp@acm.org>
	<9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
	<CAPOJ94MZfzhxmMqweM5KxSbuzSqgua8YrF4yHZOy42WLh7qKJw@mail.gmail.com>
	<E19397F7-B6E9-40F8-8A4E-0165FC8387AD@dominion.thruhere.net>
	<CAPOJ94PeTHUYZWgArUH1LEXP-s0-RR9MddooCwzgt7k06pBa1g@mail.gmail.com>
	<FE0A0E7A-AE21-48FB-85D3-123D054FC4F1@dominion.thruhere.net>
	<CAPOJ94PNkZ1Ko4bu=d+ZNH2EGH9J0jNL7R7t=A_MLXKbOORaow@mail.gmail.com>
Date: Wed, 28 Dec 2011 18:20:51 -0600
X-Google-Sender-Auth: POEnI_aXfH9tjL96ATPIMboe61I
Message-ID: <CAPOJ94OsQbOed7ARCCHwm_1MY+aOq-Bn4vs7oytmvZjysTqd=w@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/5] linux 3.0: put back support for graphics on ULCD7
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
X-List-Received-Date: Thu, 29 Dec 2011 00:20:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2011 at 4:26 PM, Peter Bigot <bigotp@acm.org> wrote:
> On Wed, Dec 28, 2011 at 7:11 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>
>> Op 28 dec. 2011, om 13:33 heeft Peter Bigot het volgende geschreven:
>>
>>> On Wed, Dec 28, 2011 at 6:22 AM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
>>>>
>>>> Op 28 dec. 2011, om 13:13 heeft Peter Bigot het volgende geschreven:
>>>>
>>>>> On Wed, Dec 28, 2011 at 3:37 AM, Koen Kooi <koen@dominion.thruhere.ne=
t> wrote:
>>>>>>
>>>>>> Op 28 dec. 2011, om 01:52 heeft Peter A. Bigot het volgende geschrev=
en:
>>>>>>
>>>>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>>>>
>>>>>>> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
>>>>>>> ---
>>>>>>> .../linux/linux-3.0/beagleboard/defconfig =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
>>>>>>> recipes-kernel/linux/linux_3.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
>>>>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b=
/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>> index 5f2a7eb..7938236 100644
>>>>>>> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>> @@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=3Dy
>>>>>>> CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy
>>>>>>> CONFIG_FB_OMAP2=3Dy
>>>>>>> CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
>>>>>>> -CONFIG_FB_OMAP2_NUM_FBS=3D2
>>>>>>> +CONFIG_FB_OMAP2_NUM_FBS=3D3
>>>>>>
>>>>>> NAK, we need one to be available for v4l
>>>>>
>>>>> Is there some other solution that lets the ULCD7 work like it used to=
,
>>>>> or is it no longer a supported BeagleBoard accessory?
>>>>
>>>> http://www.flickr.com/photos/koenkooi/6527657487
>>>>
>>>> That's with 3.0.12, but 3.0.14 works the same.
>>>
>>> I need a customizable touchpad UI. =A0I got "/dev/fb2 not found" and an
>>> abort when trying to run Xserver (which, as I said, used to work).
>>>
>>> What image recipe and related software did you install to get the
>>> result you show on flickr?
>>
>> systemd-image with the gnome and xfce tasks installed. The image was bui=
lt months ago and updated with opkg. I don't remember changing anything, bu=
t it is a while ago since I set it up.
>
> Thanks. =A0I reverted this kernel patch and confirm that the ULCD7
> display works with systemd-gnome-image + task-xfce-base. =A0(It won't
> auto login for some reason that I'm still investigating.)

/etc/pam.d/gdm-autologin refers to system-auth which doesn't exist in
OE.  Somebody needs to patch this to refer to common-* as is done with
the other pam files.  Not a meta-ti problem.

> What do you do to get the touchscreen working? =A0It doesn't even show
> up in /dev/input, although the TSC2007 module's built into the kernel.

uboot 0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
only recognizes ulcd7 when it appears in buddy2, but only adds buddy2
to nandargs in include/config/omap3_beagleboard.h.  It needs to be in
mmcargs too, and possibly ramargs, if consistency is important.
camera's missing from ramargs too.  This is a meta-ti problem, and
I'll leave it for the professionals to fix officially (a #define for
the common settings would probably be a good idea).

Peter

> =A0The ESC image boot process showed:
>
> [ =A0 =A03.318267] input: gpio-keys as /devices/platform/gpio-keys/input/=
input0
> [ =A0 =A03.326477] TSC2007_init started
> [ =A0 =A03.330566] input: TSC2007 Touchscreen as /devices/virtual/input/i=
nput1
>
> but what I have now shows only the gpio-keys device. =A0Is there
> something in uEnv.txt for this? =A0I"ve installed xinput and related
> packages, but if the device doesn't show up there must be something
> more fundamental wrong.
>
> Peter
>
>> -----BEGIN PGP SIGNATURE-----
>>
>> iEYEARECAAYFAk77FY0ACgkQMkyGM64RGpF84ACfQfWRK4DAosXYnFe8dqUfDqlb
>> aroAnR+hoyEVfryZLUoTPrRR0Dsf1WP0
>> =3DYcCY
>> -----END PGP SIGNATURE-----
>>

