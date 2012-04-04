Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pz0-f41.google.com (mail-pz0-f41.google.com
	[209.85.210.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A6FCE0044A
	for <meta-ti@yoctoproject.org>; Wed,  4 Apr 2012 10:51:18 -0700 (PDT)
Received: by dajx4 with SMTP id x4so611692daj.28
	for <meta-ti@yoctoproject.org>; Wed, 04 Apr 2012 10:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=cEDzFYSY/4OJeHlIKO9HUAhBdqqOC9OtUVzmdCKZp4M=;
	b=goZBJYeLOn1ORsApGbKifqzUIKgh3ixG7KdrWlmCcooxHrDVUV5s6iuK/vXn6kUj2I
	2zDjl1SFwIbA+x3mKLKqhms3FOrAfMAuQ8fL9MWDqeGjKqceKoxAGJj9leum+ahWa952
	wXjUj8/Nza4ZCogNmCM6xrjfSjVIapPWcv25WR9D7JF96idnxfGtNgNXHWO8E5QSXh1x
	y3WMYM4iYCYsddqw0lNOMliLR1CEUSoM/JSPG2tBKA8ijRiIt7x9X5VdwS2skTLDEhIy
	Wew6nSxn9RMVn+5H10x94SWyGS/VyJ7E1XOBfw5ImuwXL4rS0Ag30rH0hE/YTaywh6+B
	Y4cg==
Received: by 10.68.201.6 with SMTP id jw6mr39551792pbc.92.1333561877721;
	Wed, 04 Apr 2012 10:51:17 -0700 (PDT)
Received: from [10.11.5.230] (50-1-53-18.dedicated.static.sonic.net.
	[50.1.53.18])
	by mx.google.com with ESMTPS id b3sm1077072pbm.11.2012.04.04.10.51.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 10:51:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120404174802.GA30445@denix.org>
Date: Wed, 4 Apr 2012 10:51:14 -0700
Message-Id: <524B509C-1144-465C-B298-A4DB1D26EDB4@dominion.thruhere.net>
References: <1333561418-4142-1-git-send-email-koen@dominion.thruhere.net>
	<20120404174802.GA30445@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnzzYUgE0fIPx/JhOUIjAPo0tsps9jGy7u6mA4B67KdjRViMVuRWEwxUAtuiFCDNfAKRzyD
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH] u-boot 2011.10rc: fix loading from /boot by adding ext4 support
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
X-List-Received-Date: Wed, 04 Apr 2012 17:51:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 apr. 2012, om 10:48 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Wed, Apr 04, 2012 at 07:43:38PM +0200, Koen Kooi wrote:
>> This patchset was pulled from u-boot patchwork and aren't final, but =
testing on beaglebone shows it to work.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> recipes-bsp/u-boot/u-boot_2011.10rc.bb |    7 ++++++-
>> 1 files changed, 6 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb =
b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
>> index 0102d15..48bc618 100644
>> --- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
>> +++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
>> @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE =3D "(ti33x)"
>> DEFAULT_PREFERENCE_ti33x =3D "99"
>>=20
>> PV =3D "2011.09+git"
>> -PR =3D "r26"
>> +PR =3D "r27"
>>=20
>> # SPL build
>> UBOOT_BINARY =3D "u-boot.img"
>> @@ -24,6 +24,11 @@ SRC_URI =3D =
"git://arago-project.org/git/projects/u-boot-am33x.git;protocol=3Dgit;br
>>            =
file://2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-of=
f.patch \
>>            =
file://2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch =
\
>>            =
file://2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch \
>> +           file://2011.09git/0011-ext2load-increase-read-speed.patch =
\
>> +           =
file://2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-b=
o.patch \
>> +           =
file://2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.pa=
tch \
>> +           file://2011.09git/0014-ext4fs-ls-load-support.patch \
>> +           file://2011.09git/0015-am335x-switch-to-ext4-mode.patch \
>=20
> Where are the patches?

I'm an idiot, redoing the patch now..=

