Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 136ECE0043B
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 15:00:52 -0700 (PDT)
Received: by mail-ie0-f172.google.com with SMTP id 17so2791705iea.31
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 15:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YA/iqWIxirdX7hD/Tp/82TmdSJVUmujh3Z8MziRISuQ=;
	b=JQPSqEzUH52VEx+8mXGJpDIuIz4ukNxlUw2nIJ+u1oEr06vpHc6vN3nCyCzFuWJe6o
	ij2R27dL72/Y90t6HreAHhDojrIqG/kDsdlUlLbVOkhQBlPY8mbfP+KVY9p8mPVhZnjO
	c7dPYVEG15h/0YAYmS2iMSCrOeatEu8t+pjsi9UJOIPaQyplDczfbi+xzBJ/BEeQGKWL
	I1YNmw3ZOpTUFi2p8d8JZsMTA9VBul5UJzCEMWHvecQ4CVSnHt5VFlKBkA7A+A3sb5IU
	Hadzsth3gJy71WB2ZAlOSH00tTqE9MnP7zir+UFlRyXOqkpa0V+y5fWcGksROxYrVjYk
	Tllw==
X-Received: by 10.50.92.74 with SMTP id ck10mr736743igb.3.1376690452181; Fri,
	16 Aug 2013 15:00:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Fri, 16 Aug 2013 15:00:21 -0700 (PDT)
In-Reply-To: <CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2013 15:00:21 -0700
Message-ID: <CAMKF1sqjfO-Qn4+rCrwwNHs14fheficZya1zx2gK2eXnSx0s2Q@mail.gmail.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Fri, 16 Aug 2013 22:00:53 -0000
Content-Type: multipart/alternative; boundary=047d7b10cac95e3ace04e417b904

--047d7b10cac95e3ace04e417b904
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 2:39 PM, Brian Hutchinson <b.hutchman@gmail.com>wro=
te:

> I can confirm that the Kevin Hilman mailbox patch that I posted the URL t=
o
> on the e2e site fixes the mbox problem and my 2.6.37 kernel built with th=
e
> OE Core toolchain (gcc 4.8) does in fact boot now!  I have a login prompt=
!
>
>
=E2=80=8Bgood.=E2=80=8B



> So to recap.  Sakoman head.S patch, the two memset patches Khem mentioned=
,
> and this Hilman mailbox patch is what I applied.
>
> Thank you guys for putting up with me :)
>

=E2=80=8Byou should post patches to meta-ti=E2=80=8B

--047d7b10cac95e3ace04e417b904
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Aug 16, 2013 at 2:39 PM, Brian Hutchinson <span dir=3D"ltr">&lt;<a =
href=3D"mailto:b.hutchman@gmail.com" target=3D"_blank">b.hutchman@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">I can confirm that the Kevi=
n Hilman mailbox patch that I posted the URL to on the e2e site fixes the m=
box problem and my 2.6.37 kernel built with the OE Core toolchain (gcc 4.8)=
 does in fact boot now! =C2=A0I have a login prompt!<div>


<br></div></div></blockquote><div><br></div><div><div style=3D"font-family:=
&#39;courier new&#39;,monospace;font-size:small" class=3D"gmail_default">=
=E2=80=8Bgood.=E2=80=8B</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<div dir=3D"ltr"><div></div><div>So to recap. =C2=A0Sakoman head.S patch, t=
he two memset patches Khem mentioned, and this Hilman mailbox patch is what=
 I applied.<br><div><br></div><div>Thank you guys for putting up with me :)=
</div>

<div></div></div></div></blockquote></div><div class=3D"gmail_extra"><br></=
div><div style=3D"font-family:&#39;courier new&#39;,monospace;font-size:sma=
ll" class=3D"gmail_default">=E2=80=8Byou should post patches to meta-ti=E2=
=80=8B</div><br><br>

</div></div>

--047d7b10cac95e3ace04e417b904--
