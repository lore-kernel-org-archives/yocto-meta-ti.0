Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 096B7E00596
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 10:11:09 -0700 (PDT)
Received: by wgbds11 with SMTP id ds11so517335wgb.5
	for <meta-ti@yoctoproject.org>; Thu, 03 May 2012 10:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=30foxm9A9M1868IEJGPVgCnTw9yphAN0tQkaChu7RwU=;
	b=o+D0+aQK7eVjhFfN8W/wDE6r0hWsWeOyb/lUD+LGBKVvDoH/4bMKyNVx9RFprgbho5
	V/tJjkd0mtRkzYAAwai+jmR11Xz4sWnCHTm12rK0K0/xEzTGMrLqesWbYFgxEh7ms77y
	/ZxirGT8UKSvbM3DjD8M/THA/tkCuN4wbWN5eZ7VyOjurXU996OWFLRFiBMxPbgVdRxG
	1TmyXZ3+dhN414l1eq8OdiXJREOI+iH/2Ko8i3qaPvFgI/XE/6tERtLlNyQn/Fs+Txk/
	A48sZLN0hQpgHmnQzPaJDlqzUVZxU9reXf2x+7tkfZseW9lmJrWk4e1+aYvEStbkLiui
	3eOw==
Received: by 10.216.203.201 with SMTP id f51mr541770weo.52.1336065068745;
	Thu, 03 May 2012 10:11:08 -0700 (PDT)
Received: from [172.20.1.66] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm5050456wiy.3.2012.05.03.10.11.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:11:08 -0700 (PDT)
References: <20120503004302.E49A252A70@arago-project.org>
	<1DB7C838-80AE-47B8-9251-87253476B6F5@dominion.thruhere.net>
	<20120503060932.GD2681@denix.org>
	<812B90C3-8D0A-4805-9424-1C167BEF536E@dominion.thruhere.net>
	<20120503162113.GF2681@denix.org>
In-Reply-To: <20120503162113.GF2681@denix.org>
Mime-Version: 1.0 (1.0)
Message-Id: <914CC77F-F9A0-4FCB-B112-46649335EAA3@dominion.thruhere.net>
X-Mailer: iPad Mail (9B176)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 3 May 2012 19:12:05 +0200
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQmjZAZz5ws4sEoe2u/P675B3up0rInMUjren+lJMxRsAICyUv2s/LWGQJCFXd8fJoet4teg
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Denys Dmytriyenko : beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
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
X-List-Received-Date: Thu, 03 May 2012 17:11:10 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 3 mei 2012 om 18:21 heeft Denys Dmytriyenko <denis@denix.org> het volgend=
e geschreven:

> On Thu, May 03, 2012 at 08:25:11AM +0200, Koen Kooi wrote:
>>=20
>> Op 3 mei 2012, om 08:09 heeft Denys Dmytriyenko het volgende geschreven:
>>=20
>>> On Thu, May 03, 2012 at 08:02:00AM +0200, Koen Kooi wrote:
>>>>=20
>>>> Op 3 mei 2012, om 02:43 heeft Arago Project git het volgende geschreven=
:
>>>>=20
>>>>> Module: meta-ti
>>>>> Branch: master
>>>>> Commit: 3c693c26087aa148b944166083b5336f05d1c15b
>>>>> URL:    http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3D3c693c=
26087aa148b944166083b5336f05d1c15b
>>>>>=20
>>>>> Author: Denys Dmytriyenko <denys@ti.com>
>>>>> Date:   Wed May  2 20:40:58 2012 -0400
>>>>>=20
>>>>> beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
>>>>=20
>>>> Wait, what? Can we actually send these changes for review first? T2 is=20=

>>>> needed to meet the boot time goal, so please revert this one!
>>>=20
>>> Have another solution to get it building under recent binutils?
>>=20
>> Patch binutils or patch the kernel.
>=20
> Like I said, do you have a solution? Do you have said patches?
>=20
> Since gcc-4.5 and binutils-2.20 are scheduled to be removed from=20
> meta-oe/toolchain-layer in a few days, I had to fix it some way. That's th=
e=20
> best I could do under this circumstances. I can't have beaglebone broken w=
ith=20
> any  oher toolchain, to only gain few milliseconds of boot time.

It's in the range of half a second when I last tested it.=20

>=20
>> Changing the defconfig without even sending the patch for review is NOT t=
he=20
>> way to do it.
>=20
> I heard you the first time! No need to repeat it every time.

I'll repeat it some more if you think meta-ti should be TIs playground witho=
ut regard for the beagleboard.org project. Your action put a serious dent in=
 my belief in meta-ti.=20


>=20
> --=20
> Denys

