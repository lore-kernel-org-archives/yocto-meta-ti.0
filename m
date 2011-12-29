Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D472E006B5
	for <meta-ti@yoctoproject.org>; Thu, 29 Dec 2011 00:15:53 -0800 (PST)
Received: by wgbdt13 with SMTP id dt13so20781768wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 29 Dec 2011 00:15:52 -0800 (PST)
Received: by 10.227.203.195 with SMTP id fj3mr34245046wbb.12.1325146552471;
	Thu, 29 Dec 2011 00:15:52 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id em4sm34745934wbb.20.2011.12.29.00.15.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 00:15:51 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAPOJ94OsQbOed7ARCCHwm_1MY+aOq-Bn4vs7oytmvZjysTqd=w@mail.gmail.com>
Date: Thu, 29 Dec 2011 09:15:51 +0100
Message-Id: <269B1778-6638-43C9-AE7E-A8088036F9B6@dominion.thruhere.net>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
	<1325033520-6907-6-git-send-email-bigotp@acm.org>
	<9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
	<CAPOJ94MZfzhxmMqweM5KxSbuzSqgua8YrF4yHZOy42WLh7qKJw@mail.gmail.com>
	<E19397F7-B6E9-40F8-8A4E-0165FC8387AD@dominion.thruhere.net>
	<CAPOJ94PeTHUYZWgArUH1LEXP-s0-RR9MddooCwzgt7k06pBa1g@mail.gmail.com>
	<FE0A0E7A-AE21-48FB-85D3-123D054FC4F1@dominion.thruhere.net>
	<CAPOJ94PNkZ1Ko4bu=d+ZNH2EGH9J0jNL7R7t=A_MLXKbOORaow@mail.gmail.com>
	<CAPOJ94OsQbOed7ARCCHwm_1MY+aOq-Bn4vs7oytmvZjysTqd=w@mail.gmail.com>
To: Peter Bigot <bigotp@acm.org>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Thu, 29 Dec 2011 08:15:54 -0000
X-Groupsio-MsgNum: 310
Content-Type: multipart/signed;
	boundary="Apple-Mail=_22678B42-E617-4817-BFEA-5D0739048D91";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_22678B42-E617-4817-BFEA-5D0739048D91
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 29 dec. 2011, om 01:20 heeft Peter Bigot het volgende geschreven:

> On Wed, Dec 28, 2011 at 4:26 PM, Peter Bigot <bigotp@acm.org> wrote:
>> On Wed, Dec 28, 2011 at 7:11 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>=20
>>> Op 28 dec. 2011, om 13:33 heeft Peter Bigot het volgende geschreven:
>>>=20
>>>> On Wed, Dec 28, 2011 at 6:22 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>>=20
>>>>> Op 28 dec. 2011, om 13:13 heeft Peter Bigot het volgende =
geschreven:
>>>>>=20
>>>>>> On Wed, Dec 28, 2011 at 3:37 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>>>>=20
>>>>>>> Op 28 dec. 2011, om 01:52 heeft Peter A. Bigot het volgende =
geschreven:
>>>>>>>=20
>>>>>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>>>>>=20
>>>>>>>> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
>>>>>>>> ---
>>>>>>>> .../linux/linux-3.0/beagleboard/defconfig          |    2 +-
>>>>>>>> recipes-kernel/linux/linux_3.0.bb                  |    2 +-
>>>>>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>=20
>>>>>>>> diff --git =
a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig =
b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>>> index 5f2a7eb..7938236 100644
>>>>>>>> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>>> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>>>>>>>> @@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=3Dy
>>>>>>>> CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy
>>>>>>>> CONFIG_FB_OMAP2=3Dy
>>>>>>>> CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
>>>>>>>> -CONFIG_FB_OMAP2_NUM_FBS=3D2
>>>>>>>> +CONFIG_FB_OMAP2_NUM_FBS=3D3
>>>>>>>=20
>>>>>>> NAK, we need one to be available for v4l
>>>>>>=20
>>>>>> Is there some other solution that lets the ULCD7 work like it =
used to,
>>>>>> or is it no longer a supported BeagleBoard accessory?
>>>>>=20
>>>>> http://www.flickr.com/photos/koenkooi/6527657487
>>>>>=20
>>>>> That's with 3.0.12, but 3.0.14 works the same.
>>>>=20
>>>> I need a customizable touchpad UI.  I got "/dev/fb2 not found" and =
an
>>>> abort when trying to run Xserver (which, as I said, used to work).
>>>>=20
>>>> What image recipe and related software did you install to get the
>>>> result you show on flickr?
>>>=20
>>> systemd-image with the gnome and xfce tasks installed. The image was =
built months ago and updated with opkg. I don't remember changing =
anything, but it is a while ago since I set it up.
>>=20
>> Thanks.  I reverted this kernel patch and confirm that the ULCD7
>> display works with systemd-gnome-image + task-xfce-base.  (It won't
>> auto login for some reason that I'm still investigating.)
>=20
> /etc/pam.d/gdm-autologin refers to system-auth which doesn't exist in
> OE.  Somebody needs to patch this to refer to common-* as is done with
> the other pam files.  Not a meta-ti problem.

Can you do a 'opkg search /etc/pam.d/gdm-autologin' to see where that =
file is coming from, I only have /etc/pam.d/gdm


>> What do you do to get the touchscreen working?  It doesn't even show
>> up in /dev/input, although the TSC2007 module's built into the =
kernel.
>=20
> uboot 0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
> only recognizes ulcd7 when it appears in buddy2, but only adds buddy2
> to nandargs in include/config/omap3_beagleboard.h.  It needs to be in
> mmcargs too, and possibly ramargs, if consistency is important.
> camera's missing from ramargs too.  This is a meta-ti problem, and
> I'll leave it for the professionals to fix officially (a #define for
> the common settings would probably be a good idea).

Done, thanks for the report!

regards,

Koen=

--Apple-Mail=_22678B42-E617-4817-BFEA-5D0739048D91
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk78IbkACgkQMkyGM64RGpH0VACfeI8nbpO4jeFO8vVtBiEQpzjA
rUgAoLudPuCEbWKoSQwcAtJaKv9WfRwe
=v8sd
-----END PGP SIGNATURE-----

--Apple-Mail=_22678B42-E617-4817-BFEA-5D0739048D91--
