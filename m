Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAB6AE00406
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 08:37:47 -0700 (PDT)
Received: by mail-ie0-f171.google.com with SMTP id 10so3597253ied.2
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lgYz5glDyhYzh4r51BB3cO1sQsTgbgjEayhKgSM82W4=;
	b=zz0xEqZXfZ5VaJmGTbEfcyE4Z2ncnXvTjehlGAyaRVu2GwaFSv4l3qAmPrMr9LTb0U
	b9fkeqhdT4zHsxzYRUWA6Iq2OjMTIgHPY8u+qqt3NyS8dm1SQoeHLk6oEev6x/ESgXtP
	G9q1qJzKRMg9JuFN0YjhoOdFvQ/NBttOFSbPxx5NxZrMy3PYynZTJHfw0UGSylMsr3J3
	vuxyszPwPwKY+4aSAo0Qfqvn1aXdvbfnX4fPAy2Fr/L6K/dF3dVP+6I9XkiLosSQZKVw
	dfau6+N6bWVMvubZZzz1IeLL0IiVhkEEjixQYIEsf0o8AJB1gG/K3ylAjr6i8q1wXWTz
	QkMA==
X-Received: by 10.50.92.74 with SMTP id ck10mr1379921igb.3.1376667466760; Fri,
	16 Aug 2013 08:37:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Fri, 16 Aug 2013 08:37:15 -0700 (PDT)
In-Reply-To: <CAFZh4h_hTjd-5AC7abRF3rd9zeDBS4j_fRRZEW4eH+nGn8s9_w@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h_hTjd-5AC7abRF3rd9zeDBS4j_fRRZEW4eH+nGn8s9_w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2013 08:37:15 -0700
Message-ID: <CAMKF1sou67WNchV35N3bhSPmjW+zGxMYf+ybBojw=kbWENOBPw@mail.gmail.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Christopher Larson <clarson@kergoth.com>
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
X-List-Received-Date: Fri, 16 Aug 2013 15:37:49 -0000
Content-Type: multipart/alternative; boundary=047d7b10cac9548f0b04e4125f85

--047d7b10cac9548f0b04e4125f85
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 8:12 AM, Brian Hutchinson <b.hutchman@gmail.com>wro=
te:

>  At this point I'm using the toolchains outside of OE (meta-toolchain fro=
m
> denzil branch and Linaro 4.8) to make life a bit simpler.



=E2=80=8Bcan you use the the toolchain from OE-Core and see if it happens w=
ith that
too ?=E2=80=8B

--047d7b10cac9548f0b04e4125f85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Aug 16, 2013 at 8:12 AM, Brian Hutchinson <span dir=3D"ltr">&lt;<a =
href=3D"mailto:b.hutchman@gmail.com" target=3D"_blank">b.hutchman@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">=C2=A0At this point I&#39;m using the toolch=
ains outside of OE (meta-toolchain from denzil branch and Linaro 4.8) to ma=
ke life a bit simpler.</blockquote>

</div><br><br></div><div class=3D"gmail_extra"><div style=3D"font-family:&#=
39;courier new&#39;,monospace;font-size:small" class=3D"gmail_default">=E2=
=80=8Bcan you use the the toolchain from OE-Core and see if it happens with=
 that too ?=E2=80=8B</div>

<br></div></div>

--047d7b10cac9548f0b04e4125f85--
