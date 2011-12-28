Return-Path: <pabigot@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5732DE006B5
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 14:26:28 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wibhq4 with SMTP id hq4so8449676wib.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 14:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=1XRwgd07DSlHPvt38xwXM3kD0KlpWJY8lP5Glu1AI2E=;
	b=p+0qvI7uY7uO1hYAOYGkRRMFMmDTAV5//vxNhLTCUTzKR6HXd90phHVg1YTdtRCcUx
	Bv4Cy8ETlqydbWi7TYf8Brhhk2OfNQE5Z2dtej44w/LRm3cX7LA2PBFsBSyGtiGxIBG/
	i2i9iT++W6R59qTeyC8A+a6eByvMArvROP8Sg=
MIME-Version: 1.0
Received: by 10.216.131.152 with SMTP id m24mr22814957wei.56.1325111186783;
	Wed, 28 Dec 2011 14:26:26 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.231.84 with HTTP; Wed, 28 Dec 2011 14:26:26 -0800 (PST)
In-Reply-To: <FE0A0E7A-AE21-48FB-85D3-123D054FC4F1@dominion.thruhere.net>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
	<1325033520-6907-6-git-send-email-bigotp@acm.org>
	<9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
	<CAPOJ94MZfzhxmMqweM5KxSbuzSqgua8YrF4yHZOy42WLh7qKJw@mail.gmail.com>
	<E19397F7-B6E9-40F8-8A4E-0165FC8387AD@dominion.thruhere.net>
	<CAPOJ94PeTHUYZWgArUH1LEXP-s0-RR9MddooCwzgt7k06pBa1g@mail.gmail.com>
	<FE0A0E7A-AE21-48FB-85D3-123D054FC4F1@dominion.thruhere.net>
Date: Wed, 28 Dec 2011 16:26:26 -0600
X-Google-Sender-Auth: hSNsygdQI_dbpo5BPOu2dwdu-fA
Message-ID: <CAPOJ94PNkZ1Ko4bu=d+ZNH2EGH9J0jNL7R7t=A_MLXKbOORaow@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Dec 2011 22:26:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2011 at 7:11 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 28 dec. 2011, om 13:33 heeft Peter Bigot het volgende geschreven:
>
>> On Wed, Dec 28, 2011 at 6:22 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>
>>> Op 28 dec. 2011, om 13:13 heeft Peter Bigot het volgende geschreven:
>>>
>>>> On Wed, Dec 28, 2011 at 3:37 AM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
>>>>>
>>>>> Op 28 dec. 2011, om 01:52 heeft Peter A. Bigot het volgende geschreve=
n:
>>>>>
>>>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>>>
>>>>>> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
>>>>>> ---
>>>>>> .../linux/linux-3.0/beagleboard/defconfig =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
>>>>>> recipes-kernel/linux/linux_3.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
>>>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b/=
recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>> index 5f2a7eb..7938236 100644
>>>>>> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>> @@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=3Dy
>>>>>> CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy
>>>>>> CONFIG_FB_OMAP2=3Dy
>>>>>> CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
>>>>>> -CONFIG_FB_OMAP2_NUM_FBS=3D2
>>>>>> +CONFIG_FB_OMAP2_NUM_FBS=3D3
>>>>>
>>>>> NAK, we need one to be available for v4l
>>>>
>>>> Is there some other solution that lets the ULCD7 work like it used to,
>>>> or is it no longer a supported BeagleBoard accessory?
>>>
>>> http://www.flickr.com/photos/koenkooi/6527657487
>>>
>>> That's with 3.0.12, but 3.0.14 works the same.
>>
>> I need a customizable touchpad UI. =A0I got "/dev/fb2 not found" and an
>> abort when trying to run Xserver (which, as I said, used to work).
>>
>> What image recipe and related software did you install to get the
>> result you show on flickr?
>
> systemd-image with the gnome and xfce tasks installed. The image was buil=
t months ago and updated with opkg. I don't remember changing anything, but=
 it is a while ago since I set it up.

Thanks.  I reverted this kernel patch and confirm that the ULCD7
display works with systemd-gnome-image + task-xfce-base.  (It won't
auto login for some reason that I'm still investigating.)

What do you do to get the touchscreen working?  It doesn't even show
up in /dev/input, although the TSC2007 module's built into the kernel.
 The ESC image boot process showed:

[    3.318267] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    3.326477] TSC2007_init started
[    3.330566] input: TSC2007 Touchscreen as /devices/virtual/input/input1

but what I have now shows only the gpio-keys device.  Is there
something in uEnv.txt for this?  I"ve installed xinput and related
packages, but if the device doesn't show up there must be something
more fundamental wrong.

Peter

> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk77FY0ACgkQMkyGM64RGpF84ACfQfWRK4DAosXYnFe8dqUfDqlb
> aroAnR+hoyEVfryZLUoTPrRR0Dsf1WP0
> =3DYcCY
> -----END PGP SIGNATURE-----
>

