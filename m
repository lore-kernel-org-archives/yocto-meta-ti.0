Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C91D4E005B9
	for <meta-ti@yoctoproject.org>; Thu,  8 Dec 2011 06:49:47 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qao25 with SMTP id 25so1571344qao.14
	for <meta-ti@yoctoproject.org>; Thu, 08 Dec 2011 06:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=eLNK+IZOJX+GzGpoaoP4TjLFx0wQkAVOrVGWpeUaTJw=;
	b=uFfxu3+XXixdP/MOhTGMe1IIhhDDAYQdeBLwv3R0KDZ+IF/fvg0qpGLajKrVAgIcbN
	iyyoon91XBd20QG/SNwvc12vthE9HuR4Tm5pMfxkYf5DLruuqMkxhuwJVTwDvCcF0Pvg
	dVyN6eG0w/oXqv8zROyVZAczUfuLyqKCrt3HI=
MIME-Version: 1.0
Received: by 10.224.198.10 with SMTP id em10mr3116635qab.44.1323355787137;
	Thu, 08 Dec 2011 06:49:47 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Thu, 8 Dec 2011 06:49:47 -0800 (PST)
In-Reply-To: <201112080213.11291.schnitzeltony@gmx.de>
References: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
	<201112080213.11291.schnitzeltony@gmx.de>
Date: Thu, 8 Dec 2011 07:49:47 -0700
Message-ID: <CA+M6bXkfJwdux+UvDpKutADD5ObWLT836Lj1DZJAfpMtoq9hqg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmx.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] u-boot 2011.09: convert beagleboard to SPL build
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
X-List-Received-Date: Thu, 08 Dec 2011 14:49:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2011 at 6:13 PM, Andreas M=FCller <schnitzeltony@gmx.de> wro=
te:
> On Sunday, November 27, 2011 04:03:37 PM Koen Kooi wrote:
>> Runtime tested on an xM rev C
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> =A0...-probe-DDC-bus-for-expansionboard-EEPROMS.patch | =A0165 ---------=
-
>> =A0...p3-mem-Comment-enable_gpmc_cs_config-more.patch | =A0 56 ++++
>> =A0...e-SDRC-dram_init-to-always-call-make_cs1_.patch | =A0 66 ++++
>> =A0...-a-helper-function-to-set-timings-in-SDRC.patch | =A0172 +++++++++=
++
>> =A0...e-mem_ok-to-clear-again-after-reading-bac.patch | =A0 30 ++
>> =A0.../0005-OMAP3-Remove-get_mem_type-prototype.patch | =A0 28 ++
>> =A0.../0006-omap3-mem-Add-MCFG-helper-macro.patch =A0 =A0 | =A0 97 +++++=
+
>> =A0...d-optimal-SDRC-autorefresh-control-values.patch | =A0 59 ++++
>> =A0...x-all-Micron-memory-timing-parts-with-the.patch | =A0 55 ++++
>> =A0...ework-memory-initalization-and-devkit8000.patch | =A0174 +++++++++=
++
>> =A0...OMAP3-SPL-Add-identify_nand_chip-function.patch | =A0142 +++++++++
>> =A0...0011-OMAP3-Add-SPL-support-to-Beagleboard.patch | =A0315
> Is anybody working on SPL support for gumstix overo?

No, but in mainline U-Boot it should be very easy to do so and I'd be
glad to help out with questions on the SPL specific side of things
(basically overo needs to provide a function that returns the correct
timings for the SDRC for the board rev in question).

--=20
Tom

