Return-Path: <leo.e.meza@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5AB5FE00474; Wed, 22 Aug 2018 11:19:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (leo.e.meza[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B24F7E003D7
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 11:19:01 -0700 (PDT)
Received: by mail-oi0-f50.google.com with SMTP id y207-v6so4716118oie.13
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 11:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=fdGHSoha8t+hqJxw20o52pnfw9R2FBRJ3EgPcX5HlAA=;
	b=Y6LI+IuW5NsBM/PwgqZazW5oRsfNOc9OguHa39ZLxb7xqoI4mDRpmRL48F1X4lXoUR
	jwfE8QMjbQDrTTrvwQrXPUTjgQwmRXwChvzdJGkH+2K1hN+BipZyS5d558mPRW2Lirn8
	s2TzmdECHCpCfxeaiE+sjuXmfb5FVgL/NDLQ5GLMuEUqdsvRIxp6hWtg6FgFe8Ss+A48
	+4NtrYtQ4MqfLCR/6R50FgmA2zqIanPz+ea2vvxiFCp5PAWMa6Hq+1gwljKG+7yEDXKb
	Div5QN972KDqsgQNlPWiTPALx5NBVYiQmVqq9AjqjdZN7VV7hZfqJI2GHOvQhyccciK2
	WlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fdGHSoha8t+hqJxw20o52pnfw9R2FBRJ3EgPcX5HlAA=;
	b=TYeYeDfGpH5obCUbHtFitzsJB9H8dX4OItkc567LP86gVhHlGkg4PD4bKe4EnZn6ww
	wBgKtKqfTNl8iQHS2nqhE1FisS7bpLVtYSrOUC73QZ+txs8NJSLm8aTkZtnuuX+yQ6uZ
	XaKhNUfmzhOBnHg3MY6+Gl6CuRPMTd7yhTfL8iPDccRm2M9zXYstV1rQyk8xwL4kX/Md
	ZR3+ZD/trDI1jAteHGGzaonB1e7p2cvboP2d6axR7zfEI9hnD33ixmsc7MdvBvGziIT5
	NSVsiMkT8JR1ZHg5hKkpnoYJIyr9rml9UITiCMIyeeYZPOzbkrGoroOC2HUebQ+eGgfx
	ZD4w==
X-Gm-Message-State: APzg51CrTckwXydltE5okBfGAkgLZEHcPJ6X1AqVuhXB+yu4Vwl9XhUj
	tCzB0MZ5SgNRMIdDATReF8NLDXfZCNWeWnMDknn502PG
X-Google-Smtp-Source: ANB0VdbW+YUJ+1QQzh9rFGWatodgZaIDPjd8afhAPnqVfEbZ6RE+b+eFHtdZ8O0r6VT4HHVchyRBB3Y9PzsT0qcP4nk=
X-Received: by 2002:aca:b885:: with SMTP id
	i127-v6mr5380331oif.180.1534961940826; 
	Wed, 22 Aug 2018 11:19:00 -0700 (PDT)
MIME-Version: 1.0
From: Leo Meza <leo.e.meza@gmail.com>
Date: Wed, 22 Aug 2018 11:18:49 -0700
Message-ID: <CADrbpyyMX+hnshPQN7yVbB1UBdopKiHFD-Nqh=MVqyVohgqYAA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Getting Started with meta-ti "rocko" and beaglebone black (BBB)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 18:19:02 -0000
Content-Type: multipart/alternative; boundary="0000000000003a10f405740a2d1f"

--0000000000003a10f405740a2d1f
Content-Type: text/plain; charset="UTF-8"

I'm learning yocto and was able to easily boot my BBB with a
core-image-minimal system using the meta-yocto-bsp layer. However, when I
removed that layer and tried with meta-ti, I just see this on the Putty
serial console, it repeats over an over:

U-Boot SPL 2018.01-g6d540394a4 (Aug 22 2018 - 16:33:01)
Trying to boot from MMC1
*** Warning - bad CRC, using default environment

I'm copying MLO, zImage, u-boot.img, and am335x-boneblack.dtb to the BOOT
(1st) partition of my uSD card. Then extracting
core-image-minimal-beaglebone.tar.xz -C to the ROOT (2nd) partition of my
uSD card. This works fine when using meta-yocto-bsp, but not with meta-ti.
So, if anyone can help me understand what the different steps are between
using the two different layers, I'd greatly appreciate it. Spent several
days trying to figure this out so far.

Thanks in advance,
Leo

--0000000000003a10f405740a2d1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m learning yocto and was able to easily boot my BBB =
with a core-image-minimal system using the meta-yocto-bsp layer. However, w=
hen I removed that layer and tried with meta-ti, I just see this on the Put=
ty serial console, it repeats over an over:<div><br></div><div><div>U-Boot =
SPL 2018.01-g6d540394a4 (Aug 22 2018 - 16:33:01)</div><div>Trying to boot f=
rom MMC1</div><div>*** Warning - bad CRC, using default environment</div></=
div><div><br></div><div>I&#39;m copying MLO, zImage, u-boot.img, and am335x=
-boneblack.dtb to the BOOT (1st) partition of my uSD card. Then extracting =
core-image-minimal-beaglebone.tar.xz -C to the ROOT (2nd) partition of my u=
SD card. This works fine when using meta-yocto-bsp, but not with meta-ti. S=
o, if anyone can help me understand what the different steps are between us=
ing the two different layers, I&#39;d greatly appreciate it. Spent several =
days trying to figure this out so far.</div><div><br></div><div>Thanks in a=
dvance,</div><div>Leo</div></div>

--0000000000003a10f405740a2d1f--
