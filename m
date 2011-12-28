Return-Path: <pabigot@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D9AAE00744
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 04:13:18 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wibhq4 with SMTP id hq4so7861724wib.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Dec 2011 04:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=3zwKBN2iuxgmiZsgABzRXi0ka0Y8QEeKEx00rWP93Es=;
	b=nstHzae8mShJWewjlpeSXrq73RffTQeGzdcc81buPzMSLcwFMYnIaZYuuGn6rJIpSg
	lX4ZHO7hYdpd8J5o8UPEh5JgnT19tRZc3ipmao3BuCUqexflCWqf5F47OBBFUcE25RmX
	kJYIAZQgO6vQ+cnTrQKii0LYt3Zuxa2IJ745c=
MIME-Version: 1.0
Received: by 10.181.13.17 with SMTP id eu17mr69976149wid.12.1325074396907;
	Wed, 28 Dec 2011 04:13:16 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.231.84 with HTTP; Wed, 28 Dec 2011 04:13:16 -0800 (PST)
In-Reply-To: <9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
	<1325033520-6907-6-git-send-email-bigotp@acm.org>
	<9F092876-645C-47D9-8F73-860C7847E8D9@dominion.thruhere.net>
Date: Wed, 28 Dec 2011 06:13:16 -0600
X-Google-Sender-Auth: HWdARNgQcEyRqEcLjEWT21h_Dtk
Message-ID: <CAPOJ94MZfzhxmMqweM5KxSbuzSqgua8YrF4yHZOy42WLh7qKJw@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Dec 2011 12:13:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2011 at 3:37 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 28 dec. 2011, om 01:52 heeft Peter A. Bigot het volgende geschreven:
>
>> From: "Peter A. Bigot" <bigotp@acm.org>
>>
>> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
>> ---
>> .../linux/linux-3.0/beagleboard/defconfig =A0 =A0 =A0 =A0 =A0| =A0 =A02 =
+-
>> recipes-kernel/linux/linux_3.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b/reci=
pes-kernel/linux/linux-3.0/beagleboard/defconfig
>> index 5f2a7eb..7938236 100644
>> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
>> @@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=3Dy
>> CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy
>> CONFIG_FB_OMAP2=3Dy
>> CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
>> -CONFIG_FB_OMAP2_NUM_FBS=3D2
>> +CONFIG_FB_OMAP2_NUM_FBS=3D3
>
> NAK, we need one to be available for v4l

Is there some other solution that lets the ULCD7 work like it used to,
or is it no longer a supported BeagleBoard accessory?

Peter

> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7643gACgkQMkyGM64RGpFadgCfbguU9xKL1yXJOCYeGo0eAG/l
> 8jsAnRs/faIBfmXiGfgGvfFGfZ6KI+nq
> =3D2+yZ
> -----END PGP SIGNATURE-----
>

