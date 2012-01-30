Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99529E00306
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 30 Jan 2012 07:16:19 -0800 (PST)
Received: by qcpx40 with SMTP id x40so2717885qcp.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 30 Jan 2012 07:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=HzQauaNLkcadxV/PvkHC7Fw7YwLaAA9MAWHC5QdjuWc=;
	b=GQQsnwZkt44IajwbyW5BO9dO0x9Rmwg8s1/xudcfM93yUo7tV3CJGunKWAYeuEXy53
	m2O3Dia80cdvkB8jO8MoTOlNNLUzYbU4yHdBgMZVNCEOsAsf4LfxVSVZbexTHjbPpatI
	o1uzkg2JasNJTBhDyCst5+brqsbH9B0OW4pJY=
MIME-Version: 1.0
Received: by 10.224.205.199 with SMTP id fr7mr22524049qab.65.1327936578777;
	Mon, 30 Jan 2012 07:16:18 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Mon, 30 Jan 2012 07:16:18 -0800 (PST)
In-Reply-To: <1327845060-30614-1-git-send-email-koen@dominion.thruhere.net>
References: <1327845060-30614-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 30 Jan 2012 08:16:18 -0700
Message-ID: <CA+M6bXmpG4M-Rfv_P70tBKi3qTYyc22NuTwmcd3D4eGvokQf7w@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.12: fix beagleboard C4 memory detection
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
X-List-Received-Date: Mon, 30 Jan 2012 15:16:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2012 at 6:51 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Test results (which emberassingly enough lack an actual C4):
>
> BeagleBoard B6:
>
> =A0 =A0 =A0 =A0OMAP3530-GP ES2.1, CPU-OPP2, L3-165MHz, Max CPU Clock 600 =
mHz
> =A0 =A0 =A0 =A0OMAP3 Beagle board + LPDDR/NAND
> =A0 =A0 =A0 =A0I2C: =A0 ready
> =A0 =A0 =A0 =A0DRAM: =A0128 MiB
> =A0 =A0 =A0 =A0NAND: =A0256 MiB
> =A0 =A0 =A0 =A0[..]
> =A0 =A0 =A0 =A0Beagle Rev Ax/Bx
>
> BeagleBoard C3:
>
> =A0 =A0 =A0 =A0OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 =
mHz
> =A0 =A0 =A0 =A0OMAP3 Beagle board + LPDDR/NAND
> =A0 =A0 =A0 =A0I2C: =A0 ready
> =A0 =A0 =A0 =A0DRAM: =A0256 MiB
> =A0 =A0 =A0 =A0NAND: =A0256 MiB
> =A0 =A0 =A0 =A0[..]
> =A0 =A0 =A0 =A0Beagle Rev C1/C2/C3
>
> BeagleBoard C5:
>
> =A0 =A0 =A0 =A0OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 720 =
mHz
> =A0 =A0 =A0 =A0OMAP3 Beagle board + LPDDR/NAND
> =A0 =A0 =A0 =A0I2C: =A0 ready
> =A0 =A0 =A0 =A0DRAM: =A0256 MiB
> =A0 =A0 =A0 =A0NAND: =A0512 MiB
> =A0 =A0 =A0 =A0[..]
> =A0 =A0 =A0 =A0Beagle Rev C4
>
> BeagleBoard xM A:
>
> =A0 =A0 =A0 =A0OMAP3630/3730-GP ES1.1, CPU-OPP2, L3-165MHz, Max CPU Clock=
 1 Ghz
> =A0 =A0 =A0 =A0OMAP3 Beagle board + LPDDR/NAND
> =A0 =A0 =A0 =A0I2C: =A0 ready
> =A0 =A0 =A0 =A0DRAM: =A0512 MiB
> =A0 =A0 =A0 =A0NAND: =A00 MiB
> =A0 =A0 =A0 =A0[..]
> =A0 =A0 =A0 =A0Beagle xM Rev A
>
> BeagleBoard xM C:
>
> =A0 =A0 =A0 =A0OMAP3630/3730-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock=
 1 Ghz
> =A0 =A0 =A0 =A0OMAP3 Beagle board + LPDDR/NAND
> =A0 =A0 =A0 =A0I2C: =A0 ready
> =A0 =A0 =A0 =A0DRAM: =A0512 MiB
> =A0 =A0 =A0 =A0NAND: =A00 MiB
> =A0 =A0 =A0 =A0[..]
> =A0 =A0 =A0 =A0Beagle xM Rev C
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Tom Rini <trini@ti.com>

--=20
Tom

