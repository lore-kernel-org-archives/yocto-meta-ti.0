Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B13FEE00546
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 14:06:35 -0800 (PST)
Received: by mail-oa0-f43.google.com with SMTP id i7so611523oag.30
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 14:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ik6YCm2nOIbBqQmpIu8BCJtw1n48WZJBIeHCP4sBh88=;
	b=cL3wrYLsuFxhq6/BxFdhkd5QIrDb/F+zbRurvQ9KhDQimBSoH67NI/qyC+GXQjMf6S
	ozD9qbQSgpZZcF4W+PQZfiXYuQxS82/N4j3s/ECn7i8Zz2tTZvav0hs34J2mRaJEQUCp
	lDjtEbXhuBjJQyA6OEUo/gyRJ2p35OBijL04Fw8gykJGnkhbmcSRHErArJf6RrC2dEGY
	IxuTmIOlX5DgEmHtes/fY2EQfHoP2oO9Oy/E0Nojf6nfzSdB+0vn4LKMzd9tNZTBUR5T
	DTI+miX9T7gj9EyqT2g0Rngiqg2MojhGERV8otq5q6/BZKk0ex/A+FSlQF975JvQ5jzT
	8LBg==
X-Gm-Message-State: ALoCoQmzj2K2byCM80leLVwOibZzPnI3PzpXzfKldvXedRV2Tg8Y0kFGmhd1hhCLwmE0+CeIFas1
X-Received: by 10.60.178.212 with SMTP id da20mr2383825oec.50.1384985195117;
	Wed, 20 Nov 2013 14:06:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Wed, 20 Nov 2013 14:06:15 -0800 (PST)
In-Reply-To: <20131120103852.GA20454@ti.com>
References: <20131120103852.GA20454@ti.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 20 Nov 2013 23:06:15 +0100
Message-ID: <CAP71WjxnTK9FJjeDuzOWc0V-VgeS85ZbjtgL918+vFqnYgf6mQ@mail.gmail.com>
To: Mrinmayee Hingolikar <mrinmayee@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti: libdce: Library for invoking the hw accelerated codec on IVA-HD.
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
X-List-Received-Date: Wed, 20 Nov 2013 22:06:39 -0000
Content-Type: multipart/alternative; boundary=089e01228cb6932a8704eba2fec0

--089e01228cb6932a8704eba2fec0
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 20, 2013 at 11:38 AM, Mrinmayee Hingolikar <mrinmayee@ti.com>wrote:

> +SRC_URI = "git://git.ti.com/glsdk/libdce2.git;protocol=git"
> +SRCREV = "0aa6627d59a2a7c4837a40fe67f610b3318d23c1"
>

i guess you need to set PV, it might default to 1.0 otherwise.

--089e01228cb6932a8704eba2fec0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Nov 20, 2013 at 11:38 AM, Mrinmayee Hingolikar <span dir=3D"ltr">&l=
t;<a href=3D"mailto:mrinmayee@ti.com" target=3D"_blank">mrinmayee@ti.com</a=
>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":32i" style=3D"overflow:hidden">+=
SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/glsdk/libdce2.git;prot=
ocol=3Dgit" target=3D"_blank">git.ti.com/glsdk/libdce2.git;protocol=3Dgit</=
a>&quot;<br>


+SRCREV =3D &quot;0aa6627d59a2a7c4837a40fe67f610b3318d23c1&quot;<br></div><=
/blockquote></div><br>i guess you need to set PV, it might default to 1.0 o=
therwise.</div><div class=3D"gmail_extra"><br></div></div>

--089e01228cb6932a8704eba2fec0--
