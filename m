Return-Path: <pabigot@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A40C9E006DC
	for <meta-ti@yoctoproject.org>; Thu, 29 Dec 2011 03:23:38 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by werm10 with SMTP id m10so9143387wer.35
	for <meta-ti@yoctoproject.org>; Thu, 29 Dec 2011 03:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=1hXUnpIXvn79pnjyc0DTHKG1ezLWCMjpuRz+OVYqrbQ=;
	b=IdqR0xBKa6MpObEPNLCBIODYIHRLhAdhIQSSqd3B+oEYGFnGPJGXMygXp7iRBmhV2X
	yC+twbQuyidU3gaVjQpAvBligsokEekU2p59malMnAgYXIvs8lS+1R05q8nNByocfVp2
	qRnJGh900JVuy6RyqrsWPL8v2DVpVoSuEbWwY=
MIME-Version: 1.0
Received: by 10.216.131.152 with SMTP id m24mr24067112wei.56.1325157817198;
	Thu, 29 Dec 2011 03:23:37 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.231.84 with HTTP; Thu, 29 Dec 2011 03:23:37 -0800 (PST)
In-Reply-To: <269B1778-6638-43C9-AE7E-A8088036F9B6@dominion.thruhere.net>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
	<1325033520-6907-6-git-send-email-bigotp@acm.org>
	<9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
	<CAPOJ94MZfzhxmMqweM5KxSbuzSqgua8YrF4yHZOy42WLh7qKJw@mail.gmail.com>
	<E19397F7-B6E9-40F8-8A4E-0165FC8387AD@dominion.thruhere.net>
	<CAPOJ94PeTHUYZWgArUH1LEXP-s0-RR9MddooCwzgt7k06pBa1g@mail.gmail.com>
	<FE0A0E7A-AE21-48FB-85D3-123D054FC4F1@dominion.thruhere.net>
	<CAPOJ94PNkZ1Ko4bu=d+ZNH2EGH9J0jNL7R7t=A_MLXKbOORaow@mail.gmail.com>
	<CAPOJ94OsQbOed7ARCCHwm_1MY+aOq-Bn4vs7oytmvZjysTqd=w@mail.gmail.com>
	<269B1778-6638-43C9-AE7E-A8088036F9B6@dominion.thruhere.net>
Date: Thu, 29 Dec 2011 05:23:37 -0600
X-Google-Sender-Auth: fBD9ls0CYXf4tDlIsv57ykNwTmk
Message-ID: <CAPOJ94N2T1hCYkq6rFSAX=c5rBO62CiAf2e4Prna=Ndjxu2Mag@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Dec 2011 11:23:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2011 at 2:15 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 29 dec. 2011, om 01:20 heeft Peter Bigot het volgende geschreven:
>
>> On Wed, Dec 28, 2011 at 4:26 PM, Peter Bigot <bigotp@acm.org> wrote:
>>> On Wed, Dec 28, 2011 at 7:11 AM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
>>>>
>>>> Op 28 dec. 2011, om 13:33 heeft Peter Bigot het volgende geschreven:
>>>>
>>>>> On Wed, Dec 28, 2011 at 6:22 AM, Koen Kooi <koen@dominion.thruhere.ne=
t> wrote:
>>>>>>
>>>>>> Op 28 dec. 2011, om 13:13 heeft Peter Bigot het volgende geschreven:
>>>>>>
>>>>>>> On Wed, Dec 28, 2011 at 3:37 AM, Koen Kooi <koen@dominion.thruhere.=
net> wrote:
>>>>>>>>
>>>>>>>> Op 28 dec. 2011, om 01:52 heeft Peter A. Bigot het volgende geschr=
even:
>>>>>>>>
>>>>>>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>>>>>>
>>>>>>>>> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
>>>>>>>>> ---
>>>>>>>>> .../linux/linux-3.0/beagleboard/defconfig =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
>>>>>>>>> recipes-kernel/linux/linux_3.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A02 +-
>>>>>>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig=
 b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>>>> index 5f2a7eb..7938236 100644
>>>>>>>>> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>>>> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>>>> @@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=3Dy
>>>>>>>>> CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy
>>>>>>>>> CONFIG_FB_OMAP2=3Dy
>>>>>>>>> CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
>>>>>>>>> -CONFIG_FB_OMAP2_NUM_FBS=3D2
>>>>>>>>> +CONFIG_FB_OMAP2_NUM_FBS=3D3
>>>>>>>>
>>>>>>>> NAK, we need one to be available for v4l
>>>>>>>
>>>>>>> Is there some other solution that lets the ULCD7 work like it used =
to,
>>>>>>> or is it no longer a supported BeagleBoard accessory?
>>>>>>
>>>>>> http://www.flickr.com/photos/koenkooi/6527657487
>>>>>>
>>>>>> That's with 3.0.12, but 3.0.14 works the same.
>>>>>
>>>>> I need a customizable touchpad UI. =A0I got "/dev/fb2 not found" and =
an
>>>>> abort when trying to run Xserver (which, as I said, used to work).

For the record, the other thing I changed that might explain why it
now works was to switch the preferred provider of task-xserver from
meta-oe to meta-angstrom.  Though the recipes look an awful lot alike.

>>>>> What image recipe and related software did you install to get the
>>>>> result you show on flickr?
>>>>
>>>> systemd-image with the gnome and xfce tasks installed. The image was b=
uilt months ago and updated with opkg. I don't remember changing anything, =
but it is a while ago since I set it up.
>>>
>>> Thanks. =A0I reverted this kernel patch and confirm that the ULCD7
>>> display works with systemd-gnome-image + task-xfce-base. =A0(It won't
>>> auto login for some reason that I'm still investigating.)
>>
>> /etc/pam.d/gdm-autologin refers to system-auth which doesn't exist in
>> OE. =A0Somebody needs to patch this to refer to common-* as is done with
>> the other pam files. =A0Not a meta-ti problem.
>
> Can you do a 'opkg search /etc/pam.d/gdm-autologin' to see where that fil=
e is coming from, I only have /etc/pam.d/gdm

root@beagleboard:~# opkg search /etc/pam.d/gdm-autologin
gdm - 2.32.2-r5

>>> What do you do to get the touchscreen working? =A0It doesn't even show
>>> up in /dev/input, although the TSC2007 module's built into the kernel.
>>
>> uboot 0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
>> only recognizes ulcd7 when it appears in buddy2, but only adds buddy2
>> to nandargs in include/config/omap3_beagleboard.h. =A0It needs to be in
>> mmcargs too, and possibly ramargs, if consistency is important.
>> camera's missing from ramargs too. =A0This is a meta-ti problem, and
>> I'll leave it for the professionals to fix officially (a #define for
>> the common settings would probably be a good idea).
>
> Done, thanks for the report!

Thanks; confirmed that touchpad now works, but I still need the
timeout delay patch.  Without it I get the following for as long as I
care to wait.  May be a feature of my SD card (a SanDisk 4GB).  I'll
send an update.

Loaded environment from uEnv.txt
Importing environment from mmc ...
Running uenvcmd ...
Setting bus to 1
Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
mmc_send_cmd: timedout waiting for stat!
mmc_send_cmd: timedout waiting for stat!
mmc_send_cmd: timedout waiting for stat!


> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk78IbkACgkQMkyGM64RGpH0VACfeI8nbpO4jeFO8vVtBiEQpzjA
> rUgAoLudPuCEbWKoSQwcAtJaKv9WfRwe
> =3Dv8sd
> -----END PGP SIGNATURE-----
>

