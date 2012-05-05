Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC27AE00596
	for <meta-ti@yoctoproject.org>; Sat,  5 May 2012 01:43:58 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so2803727wgb.11
	for <meta-ti@yoctoproject.org>; Sat, 05 May 2012 01:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=BdogHS6IwRZ8nvBg1Nbgug9OatAupF0lLVj6TgSm4k4=;
	b=l/R74dz+t5VNS02BTe60/2+L3FKB8cJ+FsXukKTz1Rn/77SO4/nQDKs2f8bz2TObgq
	C5+wQrB0Xdg+R6MIM6zC+K2+o7/6TSbTVe7OQH44dhWjbrNjtz1Mi7l+kcyVHpGMGc5H
	OTFu9jmp+v9KaK+a/iH1+eEC5Jes0AHCIdg70DcOb+5OEcPoSrUzxSp3dwepOsVCHwhG
	e6QqowLOvneZEZS2ff8VxI8+YrzQmilGIjoBEb4Y5+9Df5dCuT6AY/uOT+9uPwyo6EDI
	1E87xSTRblXsuhQetbjJZWdJgpiMzizkPM18rfyNQBC7MM/1ZpjG4MiUW+CKttfC1vJA
	l8rg==
Received: by 10.216.145.153 with SMTP id p25mr5733519wej.112.1336207437318;
	Sat, 05 May 2012 01:43:57 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm6321759wib.2.2012.05.05.01.43.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 May 2012 01:43:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336080592-17322-1-git-send-email-denis@denix.org>
Date: Sat, 5 May 2012 10:43:51 +0200
Message-Id: <84C7E26E-A9A0-46DF-838B-FBEFE14F45BD@dominion.thruhere.net>
References: <1336080592-17322-1-git-send-email-denis@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmVUNMMUB6lcKWO7zLh+dJqcytR0FoGMb39dJpqhJ2zpVUdvvvJhAQdoOWnZLu8O4YrWA5r
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] linux-ti33x-psp 3.2: for beaglebone set default Asm architecture to armv7-a
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
X-List-Received-Date: Sat, 05 May 2012 08:43:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 23:29 heeft Denys Dmytriyenko het volgende geschreven:

> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Beaglebone kernel needs to be built in Thumb2 mode to achieve fast =
boot
> times. Unfortunately, that build is broken under newer binutils-2.22 =
with
> the below Assembler error. The fix is to pass the specific =
-march=3Darmv7-a
> flag to the Assembler to make it work.
>=20
> | arch/arm/boot/compressed/head.S: Assembler messages:
> | arch/arm/boot/compressed/head.S:127: Error: selected processor does =
not support requested special purpose register -- `mrs r2,cpsr'
> | arch/arm/boot/compressed/head.S:134: Error: selected processor does =
not support requested special purpose register -- `mrs r2,cpsr'
> | arch/arm/boot/compressed/head.S:136: Error: selected processor does =
not support requested special purpose register -- `msr cpsr_c,r2'
> | make[2]: *** [arch/arm/boot/compressed/head.o] Error 1
> | make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Koen Kooi <koen@circuitco.com>=

