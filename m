Return-Path: <koen@beagleboard.org>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2A62E013E1
	for <meta-ti@yoctoproject.org>; Sun,  1 Apr 2012 15:36:21 -0700 (PDT)
Received: by pbbjt11 with SMTP id jt11so4601366pbb.35
	for <meta-ti@yoctoproject.org>; Sun, 01 Apr 2012 15:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=uwQfjFfdZSUpqDR7DCYwteSIp/yoWSi3jf2rt3a3em4=;
	b=knNHzEqASMH05J63Gt6yKOq71qaCKpZwP0CQerRjxqDk/cwfn/PE94+5aCZeqvCONi
	7agOnY4GPlv9K1reBiTOT4t8whEzT2VuD+Fm/Ojt83J8X1t5qzNl87gY2ZGwre55nPSK
	STCeyD7A5Vctz47OeO61iLuUMCRgCwYFbpL01L1BwIHaiUdVQZvnEBGCwH7JRT1+3Qis
	kRFA6WVpfnRWHJvWxuXKnB1rE2NZjDG34aLunBUborV/Wm5LW/XatJRZg0eAsnQCXwMv
	O9NcAdeaIl7+TtX3prQ/KaoKgWbzcZP9tJrVb4zOSmHJQz8K6xvJNClh+ROHk/OKXR7f
	YKjA==
Received: by 10.68.189.166 with SMTP id gj6mr15645388pbc.140.1333319781698;
	Sun, 01 Apr 2012 15:36:21 -0700 (PDT)
Received: from [10.61.32.145] ([69.38.219.78])
	by mx.google.com with ESMTPS id s10sm12682887pbp.14.2012.04.01.15.36.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 01 Apr 2012 15:36:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <24C53F95-E871-4184-89D9-6D73806E28DF@dominion.thruhere.net>
Date: Sun, 1 Apr 2012 15:36:16 -0700
Message-Id: <6A1B6226-FD98-4DC5-B034-407C01F37F9A@beagleboard.org>
References: <1333159463-19937-1-git-send-email-koen@dominion.thruhere.net>
	<24C53F95-E871-4184-89D9-6D73806E28DF@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmZPgNkVVHOLtKKIibDJ7Z11CKIsvoMd7h3T+Q6GmtT2rpC4bmtOCXy+Q5ttJS19Kb4umtJ
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
X-List-Received-Date: Sun, 01 Apr 2012 22:36:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 apr. 2012, om 14:36 heeft Koen Kooi het volgende geschreven:

>=20
> Op 30 mrt. 2012, om 19:04 heeft Koen Kooi het volgende geschreven:
>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>=20
>> Please test this patch on your am335x boards, I need to run out and =
buy a mini usb cable because I misplaced mine during traveling this =
week.=20
>>=20
>> Untested, but I wanted to get it out before the weekend.
>=20
> Something funny is going on:
>=20
> U-Boot# mw 0x80007fc0  ffffffff 9999
> U-Boot# md 0x80007fc0=20
> 80007fc0: ffffffff ffffffff ffffffff ffffffff    ................
> 80007fd0: ffffffff ffffffff ffffffff ffffffff    ................
> 80007fe0: ffffffff ffffffff ffffffff ffffffff    ................
> 80007ff0: ffffffff ffffffff ffffffff ffffffff    ................
> 80008000: ffffffff ffffffff ffffffff ffffffff    ................
> 80008010: ffffffff ffffffff ffffffff ffffffff    ................
> 80008020: ffffffff ffffffff ffffffff ffffffff    ................
> 80008030: ffffffff ffffffff ffffffff ffffffff    ................
> 80008040: ffffffff ffffffff ffffffff ffffffff    ................
> 80008050: ffffffff ffffffff ffffffff ffffffff    ................
> 80008060: ffffffff ffffffff ffffffff ffffffff    ................
> 80008070: ffffffff ffffffff ffffffff ffffffff    ................
> 80008080: ffffffff ffffffff ffffffff ffffffff    ................
> 80008090: ffffffff ffffffff ffffffff ffffffff    ................
> 800080a0: ffffffff ffffffff ffffffff ffffffff    ................
> 800080b0: ffffffff ffffffff ffffffff ffffffff    ................
>=20
> U-Boot# ext2ls mmc 0:2 /boot
> <DIR>       1024 .
> <DIR>       1024 ..
>         3135840 uImage-3.2.0+
> <SYM>         14 uImage
>              33 uEnv.txt
>         3140088 uImage-3.2.9+
>         3140296 uImage-3.2.11+
> U-Boot#=20
>=20
> U-Boot# run mmc_load_uimage_ext2
> Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
> 3140296 bytes read
>=20
> U-Boot# md 0x80007fc0=20
> 80007fc0: 00000000 00000400 00000000 00000000    ................
> 80007fd0: 00000000 00000000 00000000 00000000    ................
> 80007fe0: 00000000 00000000 00000000 00000000    ................
> 80007ff0: 00000000 00000000 00000000 00000000    ................
> 80008000: 00000000 00000000 00000000 00000000    ................
> 80008010: 00000000 00000000 00000000 00000000    ................
> 80008020: 00000000 00000000 00000000 00000000    ................
> 80008030: 00000000 00000000 00000000 00000000    ................
> 80008040: 00000000 00000000 00000000 00000000    ................
> 80008050: 00000000 00000000 00000000 00000000    ................
> 80008060: 00000000 00000000 00000000 00000000    ................
> 80008070: 00000000 00000000 00000000 00000000    ................
> 80008080: 00000000 00000000 00000000 00000000    ................
> 80008090: 00000000 00000000 00000000 00000000    ................
> 800080a0: 00000000 00000000 00000000 00000000    ................
> 800080b0: 00000000 00000000 00000000 00000000    ................
> U-Boot#=20
>=20
> So it only loads zeroes into RAM :(

It does that with or without the speedup patch, so something else is =
going on.

regards,

Koen=

