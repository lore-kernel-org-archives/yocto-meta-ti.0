Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB7A3E013E1
	for <meta-ti@yoctoproject.org>; Sun,  1 Apr 2012 14:36:08 -0700 (PDT)
Received: by pbbjt11 with SMTP id jt11so4566807pbb.35
	for <meta-ti@yoctoproject.org>; Sun, 01 Apr 2012 14:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GIhk5W13zrSm53M8piRAgwPKjNWM66dM5GT0Uv0lRuA=;
	b=f3e22WUvM0qG5a/nbBRgjRkaBrcDZcj5DKJPodnCxqD1dLFu2y9HvtbbfQKcdayHx4
	sOv8Dwygwp3/WEiKBPd1FwBmYDotZVeb6edn3feoqnOiL28kAHM1K/1eiNwuoq4COAm5
	fTwTaB6gsF8OUEtvgpHznhQgbDCLoiiFWuxzIcrj5FnX9w/y8ZqpZ02/M150Aqs3H7eF
	fBR23hKLSJblwNKMxnDoAWZU03o5teJF7l5PktytAFvQBEliUL8J1m6Ks0Kq3nWkLT3f
	yOPkJsBpBW8N8kIHw98VIQJ94RrY2mTBSMAJQvN/aLNQ+IQZMtbe8KDUfVEPRpXWViF1
	/7Zw==
Received: by 10.68.241.194 with SMTP id wk2mr15397029pbc.131.1333316168254;
	Sun, 01 Apr 2012 14:36:08 -0700 (PDT)
Received: from [10.61.32.145] ([69.38.219.78])
	by mx.google.com with ESMTPS id i8sm2767882pbi.47.2012.04.01.14.36.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 01 Apr 2012 14:36:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1333159463-19937-1-git-send-email-koen@dominion.thruhere.net>
Date: Sun, 1 Apr 2012 14:36:04 -0700
Message-Id: <24C53F95-E871-4184-89D9-6D73806E28DF@dominion.thruhere.net>
References: <1333159463-19937-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlyvd0UmyWuZlB5w/9puachZL65HfjZ7mjE+WLLamN1vKuw+xXo7aSbdo54S1JPPvzTFliq
Cc: Tom Rini <trini@ti.com>
Subject: Re: [RFC][PATCH] u-boot 2011.10rc: add patch to speed up ext2load
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
X-List-Received-Date: Sun, 01 Apr 2012 21:36:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 mrt. 2012, om 19:04 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> Please test this patch on your am335x boards, I need to run out and =
buy a mini usb cable because I misplaced mine during traveling this =
week.=20
>=20
> Untested, but I wanted to get it out before the weekend.

Something funny is going on:

U-Boot# mw 0x80007fc0  ffffffff 9999
U-Boot# md 0x80007fc0=20
80007fc0: ffffffff ffffffff ffffffff ffffffff    ................
80007fd0: ffffffff ffffffff ffffffff ffffffff    ................
80007fe0: ffffffff ffffffff ffffffff ffffffff    ................
80007ff0: ffffffff ffffffff ffffffff ffffffff    ................
80008000: ffffffff ffffffff ffffffff ffffffff    ................
80008010: ffffffff ffffffff ffffffff ffffffff    ................
80008020: ffffffff ffffffff ffffffff ffffffff    ................
80008030: ffffffff ffffffff ffffffff ffffffff    ................
80008040: ffffffff ffffffff ffffffff ffffffff    ................
80008050: ffffffff ffffffff ffffffff ffffffff    ................
80008060: ffffffff ffffffff ffffffff ffffffff    ................
80008070: ffffffff ffffffff ffffffff ffffffff    ................
80008080: ffffffff ffffffff ffffffff ffffffff    ................
80008090: ffffffff ffffffff ffffffff ffffffff    ................
800080a0: ffffffff ffffffff ffffffff ffffffff    ................
800080b0: ffffffff ffffffff ffffffff ffffffff    ................

U-Boot# ext2ls mmc 0:2 /boot
<DIR>       1024 .
<DIR>       1024 ..
         3135840 uImage-3.2.0+
<SYM>         14 uImage
              33 uEnv.txt
         3140088 uImage-3.2.9+
         3140296 uImage-3.2.11+
U-Boot#=20

U-Boot# run mmc_load_uimage_ext2
Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
3140296 bytes read

U-Boot# md 0x80007fc0=20
80007fc0: 00000000 00000400 00000000 00000000    ................
80007fd0: 00000000 00000000 00000000 00000000    ................
80007fe0: 00000000 00000000 00000000 00000000    ................
80007ff0: 00000000 00000000 00000000 00000000    ................
80008000: 00000000 00000000 00000000 00000000    ................
80008010: 00000000 00000000 00000000 00000000    ................
80008020: 00000000 00000000 00000000 00000000    ................
80008030: 00000000 00000000 00000000 00000000    ................
80008040: 00000000 00000000 00000000 00000000    ................
80008050: 00000000 00000000 00000000 00000000    ................
80008060: 00000000 00000000 00000000 00000000    ................
80008070: 00000000 00000000 00000000 00000000    ................
80008080: 00000000 00000000 00000000 00000000    ................
80008090: 00000000 00000000 00000000 00000000    ................
800080a0: 00000000 00000000 00000000 00000000    ................
800080b0: 00000000 00000000 00000000 00000000    ................
U-Boot#=20

So it only loads zeroes into RAM :(

regards,

Koen=

