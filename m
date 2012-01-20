Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2634EE00B0A
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 06:20:16 -0800 (PST)
Received: by wgbdq10 with SMTP id dq10so549388wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 06:20:15 -0800 (PST)
Received: by 10.180.14.72 with SMTP id n8mr52017568wic.22.1327069215700;
	Fri, 20 Jan 2012 06:20:15 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eb2sm33887826wib.0.2012.01.20.06.20.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 06:20:15 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201201201507.23879.schnitzeltony@gmx.de>
Date: Fri, 20 Jan 2012 15:20:13 +0100
Message-Id: <EC3AC66F-9A7F-4A18-911E-11AA2096C123@dominion.thruhere.net>
References: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
	<201201201507.23879.schnitzeltony@gmx.de>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <Schnitzeltony@gmx.de>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC] u-boot recipe naming
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
X-List-Received-Date: Fri, 20 Jan 2012 14:20:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 20 jan. 2012, om 15:07 heeft Andreas M=FCller het volgende =
geschreven:

> On Friday, January 20, 2012 01:41:51 PM Koen Kooi wrote:
>> Hi,
>>=20
>> We currently have a problem with other layers including their own =
version
>> of u-boot_2011.12.bb which confuses bitbake. To avoid such hassle in =
the
>> future I'm going to propose using the kernel naming scheme for u-boot
>> recipes as well:
>>=20
>> u-boot-denx_2011.12.bb -> u-boot from git.denx.de master + patches
>> u-boot-ti_git.bb -> u-boot from git.denx.de ti branch + patches
>> u-boot-psp-<soc>_git.bb -> u-boot from psp tree for $SoC + patches =
e.g.
>> u-boot-psp-am18x_git.bb
>>=20
>> This should avoid filename based conflicts between layers and make it
>> clearer which tree the recipe will be building.
>>=20
>> Thoughts/flames/opinions?
>>=20
>> regards,
>>=20
>> Koen
> Additional: How about exceeding the u-boot.inc ( linux.inc too? ) =
filenames by=20
> the layer name they live in, so other layers don't need to copy & =
paste (=20
> happend yesterday after meta-ettus fallout - know it is worked around =
now ).

I would suggest moving those into meta-oe and making then raise priority =
in meta-oe. Or just not using .inc files :(=

