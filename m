Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67F79E006DA
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2012 02:29:42 -0700 (PDT)
Received: by eekb45 with SMTP id b45so2533543eek.35
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2012 02:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=z21LZ5vVH1GPvBqqjwEgS/koV4Cb7/nqfri2WvPKEUI=;
	b=Ley/YsCqdsrLU2rBPQmzx1JJnzjYhpRhUScViVFQO5yUq6rXfbqInawxv5j4g3aP9a
	GD5u7AzPuXv2axwXHwsxHM8tqV4cJQxLQgPocYQ/F9zbRJZ3iNW7qjrYOs5F4FUBpJtn
	vdMNUMvmBOCKFngjHhgMCI+CHgbcJVc2UF2HrHr75+GPvGq/iWI0bfVrCwjTcyk4/xh0
	HNDpIChFMuszHCkhgRWYjD8LYkXV2qIIWilSiuoBZ5TAza3HIjUV0MH2l8qcWYZ3yy00
	6/jNasblxdWuXV2MzA5KNUO41l9HTEQhUqfOhDmmkbouRjw74lBDXs7hdRJC0FeK9EbV
	8gaQ==
Received: by 10.213.13.147 with SMTP id c19mr2074126eba.56.1337851781269;
	Thu, 24 May 2012 02:29:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v7sm136593423eem.6.2012.05.24.02.29.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 02:29:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRRXZOYCqF9z7nytO2D_spToeJJw1mYggsqZq7irPeig1Q@mail.gmail.com>
Date: Thu, 24 May 2012 11:29:38 +0200
Message-Id: <131854CE-1297-4672-87FB-0B31D809DDC0@dominion.thruhere.net>
References: <1337774235-9471-1-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRRXZOYCqF9z7nytO2D_spToeJJw1mYggsqZq7irPeig1Q@mail.gmail.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkr0XuqmS8jwDHWth7+oSd+/PPVuTntH+MWgnK+5D5m7rveGBfyB2MNsw619fI29xP+O+br
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH] linux-mainline: update to 3.2.18
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
X-List-Received-Date: Thu, 24 May 2012 09:29:42 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for pointing that out. Here it is:

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Op 24 mei 2012, om 10:38 heeft Andreas M=FCller het volgende geschreven:

> On Wed, May 23, 2012 at 1:57 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> ---
>>  conf/machine/include/omap3.inc             |    2 +-
>>  recipes-kernel/linux/linux-mainline_3.2.bb |    8 ++++----
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/conf/machine/include/omap3.inc =
b/conf/machine/include/omap3.inc
>> index c5b1979..0f3cc36 100644
>> --- a/conf/machine/include/omap3.inc
>> +++ b/conf/machine/include/omap3.inc
>> @@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
>>  require conf/machine/include/tune-cortexa8.inc
>>  PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap"
>>  # Increase this everytime you change something in the kernel
>> -MACHINE_KERNEL_PR =3D "r120"
>> +MACHINE_KERNEL_PR =3D "r121"
>>=20
>>  KERNEL_IMAGETYPE =3D "uImage"
>>=20
>> diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb =
b/recipes-kernel/linux/linux-mainline_3.2.bb
>> index 3dda4f8..69eb7e5 100644
>> --- a/recipes-kernel/linux/linux-mainline_3.2.bb
>> +++ b/recipes-kernel/linux/linux-mainline_3.2.bb
>> @@ -5,12 +5,12 @@ KERNEL_IMAGETYPE =3D "uImage"
>>=20
>>  COMPATIBLE_MACHINE =3D "(beagleboard)"
>>=20
>> -PV =3D "3.2.16"
>> -# v3.2.16 tag
>> -SRCREV_pn-${PN} =3D "b1be7dd1ec231ae751d0ce3acd0d2e5760704a6f"
>> +PV =3D "3.2.18"
>> +# v3.2.18 tag
>> +SRCREV_pn-${PN} =3D "52c6b95f8a2edaff98b779f15b2f4d69b61b18b9"
>>=20
>>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see =
conf/machine/include/omap3.inc
>> -MACHINE_KERNEL_PR_append =3D "d"
>> +MACHINE_KERNEL_PR_append =3D "a"
>>=20
>>  FILESPATH =3D. =
"${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${M=
ACHINE}:"
>>=20
>> --
>> 1.7.10
> Signed-off?


