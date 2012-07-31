Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC777E0027B
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 14:02:35 -0700 (PDT)
Received: by eekd41 with SMTP id d41so1902358eek.35
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 14:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=xQI+YVPCC0ML3eP31kuvsbeVeRhMvTlWxnAXjxudiqw=;
	b=R+uO6fwrq2+EWOdtSfIwJzmtw3tu8OdpyN6HxDlH05PGjb2NBCvhvs+K3h4AUB8uB+
	jxz3S9DucL1ZaBS18Rnp8cwE5XooBwK12uYk2zYndtLqBpoYYXPK5NZRSb9krqI45Jab
	cPlnHGW80K96tR/BKqMdW+hShT1XYAJH+hEqHCZcG17zjZguE7+K68oBNoYkTMc517uL
	WNe8eVXyEr0FkmMV6Pwb0rsuL0lSSWzhtbzxKSrPWa4tX6jJWLREWffqzJTUn+KfOI7y
	Jn99Q2nwu3HaD/64uyoiLnr0CklpSKu6mTtUzZHOmc4YOwRrfoSGP/52HGTm2qr0TyFO
	cHWw==
Received: by 10.14.179.135 with SMTP id h7mr19799482eem.35.1343768554206;
	Tue, 31 Jul 2012 14:02:34 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h42sm3323782eem.5.2012.07.31.14.02.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 14:02:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120731194328.GA21013@edge>
Date: Tue, 31 Jul 2012 23:03:00 +0200
Message-Id: <69A7749D-C148-42F8-A434-4A3DF0BE829E@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
	<1343581714-20397-12-git-send-email-koen@dominion.thruhere.net>
	<20120731194328.GA21013@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmDCGzlxDPCvSU82rHu2yEe0mxq2Z4lzWXJEiZFjd6B1URyhpm6UZjZZKDL/R0uK8l6v+xO
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH][for-denzil 12/12] u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Tue, 31 Jul 2012 21:02:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 jul. 2012, om 21:43 heeft Denys Dmytriyenko <denys@ti.com> het =
volgende geschreven:

> On Sun, Jul 29, 2012 at 07:08:34PM +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> recipes-bsp/u-boot/u-boot_2011.10rc.bb |    4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb =
b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
>> index c4b4ca7..7035b4c 100644
>> --- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
>> +++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
>> @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE =3D "(ti33x)"
>> DEFAULT_PREFERENCE_ti33x =3D "99"
>>=20
>> PV =3D "2011.09+git"
>> -PR =3D "r28"
>> +PR =3D "r29"
>>=20
>> # SPL build
>> UBOOT_BINARY =3D "u-boot.img"
>> @@ -26,7 +26,7 @@ SRC_URI =3D =
"git://arago-project.org/git/projects/u-boot-am33x.git;protocol=3Dgit;br
>>            file://2011.09git/0010-am335x-switch-to-ext4-mode.patch \
>>           "
>>=20
>> -SRCREV =3D "ec687252299796639ff9bcb981804fbec7b445a4"
>> +SRCREV =3D "dc52533ccff00a12761f793d66b39e4f6a4a3bba"
>=20
> Should it go to the master first?

Oops, that one snuck in. Yes, master first please :)=

