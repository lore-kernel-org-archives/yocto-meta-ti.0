Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57B19E00406
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 14:39:49 -0700 (PDT)
Received: by mail-ob0-f179.google.com with SMTP id fb19so2561103obc.24
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 14:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=X/uIxs7SKqVqUjse+M6eFhOI8Oa+Pgvf3XJruDuUYFs=;
	b=MrLBHXSzwfGITu1DwpWfZJbO6XSRxiIOUpcLOij9heaMJZa2KbbTSj2Liq3MOA2Uln
	fREb97K1sPH1tSCOIle3A9hWFNU0e+ZLlIalfspwvZzw+GoPw+6MSc0q1B9qNw4LA7ly
	UbSTRZXlLb6/R036oNAAzwFYwFgJ+v06wladlu57v9S0MRmGgzTDjGrU2LhUd/4Z5ObA
	J7vrISeMYDu0SFV9R1SPgDKZPvtk0YaY8LUg4T7YCojSA4MTnKjIylD+A/jex2sbHdOz
	Tl8NB1aCPm/XyJkU6DwUf2V2nkk1X89G0soi+16KH+g3i85BMf6d6LhkK3Dule03jyLB
	kJJg==
MIME-Version: 1.0
X-Received: by 10.182.76.38 with SMTP id h6mr1821966obw.74.1376689189348; Fri,
	16 Aug 2013 14:39:49 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 16 Aug 2013 14:39:49 -0700 (PDT)
In-Reply-To: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
Date: Fri, 16 Aug 2013 17:39:49 -0400
Message-ID: <CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Fri, 16 Aug 2013 21:39:53 -0000
Content-Type: multipart/alternative; boundary=047d7b4503ca18ea0104e4176e5f

--047d7b4503ca18ea0104e4176e5f
Content-Type: text/plain; charset=ISO-8859-1

I can confirm that the Kevin Hilman mailbox patch that I posted the URL to
on the e2e site fixes the mbox problem and my 2.6.37 kernel built with the
OE Core toolchain (gcc 4.8) does in fact boot now!  I have a login prompt!

So to recap.  Sakoman head.S patch, the two memset patches Khem mentioned,
and this Hilman mailbox patch is what I applied.

Thank you guys for putting up with me :)

Regards,

Brian

--047d7b4503ca18ea0104e4176e5f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can confirm that the Kevin Hilman mailbox patch that I p=
osted the URL to on the e2e site fixes the mbox problem and my 2.6.37 kerne=
l built with the OE Core toolchain (gcc 4.8) does in fact boot now! =A0I ha=
ve a login prompt!<div>
<br></div><div>So to recap. =A0Sakoman head.S patch, the two memset patches=
 Khem mentioned, and this Hilman mailbox patch is what I applied.<br><div><=
br></div><div>Thank you guys for putting up with me :)</div><div><br></div>
<div>Regards,</div><div><br></div><div>Brian</div></div></div>

--047d7b4503ca18ea0104e4176e5f--
