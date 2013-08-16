Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45824E00406
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 09:25:11 -0700 (PDT)
Received: by mail-oa0-f45.google.com with SMTP id m1so2495577oag.32
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XR/Ou408cVGqeafFmsO+ybyJVdmHe0RZu0uLJ77ZkQ0=;
	b=qIMTUztvXV/795Rc+hrf9WLOgRQ0Wi3yL6jhuDATkGwu98bV/WoG5SS4vXEzc6Dj0O
	Ift81+E2okyA5dVLYuqvSH7sUDwEmJq73g+s7kDnVPf1v1lV1z7DlVSZE02p72oRIx8x
	QKWG4gwIu8ZMzEuXMBxwSF6dhuShtmksQZ7JQ8WOTFp3CW5zziaOf4H488XyENfcNGfZ
	apls23WnbtmUBlqwiDBn1QSerypKEu5lnRgnUohgcORhX69dKlbTb3PZsNtxh0VXi74E
	EdIZJPKOXFXqtTx8+Iq4U/1YzyIIc8CE0iqTvS/dLIf3cAaeJWyiZoaGbD+bCAupkvoV
	wppg==
MIME-Version: 1.0
X-Received: by 10.60.94.108 with SMTP id db12mr497433oeb.81.1376670310753;
	Fri, 16 Aug 2013 09:25:10 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 16 Aug 2013 09:25:10 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 16 Aug 2013 09:25:10 -0700 (PDT)
In-Reply-To: <CAMKF1sou67WNchV35N3bhSPmjW+zGxMYf+ybBojw=kbWENOBPw@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h_hTjd-5AC7abRF3rd9zeDBS4j_fRRZEW4eH+nGn8s9_w@mail.gmail.com>
	<CAMKF1sou67WNchV35N3bhSPmjW+zGxMYf+ybBojw=kbWENOBPw@mail.gmail.com>
Date: Fri, 16 Aug 2013 12:25:10 -0400
Message-ID: <CAFZh4h8g12xEMC69B=fGsKktKneLy8jxM9fum-m-GZQpH7v4jQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Chris Larson <clarson@kergoth.com>
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
X-List-Received-Date: Fri, 16 Aug 2013 16:25:13 -0000
Content-Type: multipart/alternative; boundary=089e01228aeed86b4c04e4130857

--089e01228aeed86b4c04e4130857
Content-Type: text/plain; charset=ISO-8859-1

On Aug 16, 2013 11:37 AM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
>
> On Fri, Aug 16, 2013 at 8:12 AM, Brian Hutchinson <b.hutchman@gmail.com>
wrote:
>>
>>  At this point I'm using the toolchains outside of OE (meta-toolchain
from denzil branch and Linaro 4.8) to make life a bit simpler.
>
>
>
> can you use the the toolchain from OE-Core and see if it happens with
that too ?
>

I've built standalone/external toolchains with poky from both densil and
master branches.  So you want me to try distro-less OE Core toolchain?
Just making sure I'm following you.

Regards,

Brian

--089e01228aeed86b4c04e4130857
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 16, 2013 11:37 AM, &quot;Khem Raj&quot; &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Aug 16, 2013 at 8:12 AM, Brian Hutchinson &lt;<a href=3D"mailt=
o:b.hutchman@gmail.com">b.hutchman@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =A0At this point I&#39;m using the toolchains outside of OE (meta-=
toolchain from denzil branch and Linaro 4.8) to make life a bit simpler.<br=
>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; can you use the the toolchain from OE-Core and see if it happens with =
that too ?<br>
&gt;</p>
<p dir=3D"ltr">I&#39;ve built standalone/external toolchains with poky from=
 both densil and master branches.=A0 So you want me to try distro-less OE C=
ore toolchain?=A0 Just making sure I&#39;m following you.</p>
<p dir=3D"ltr">Regards,</p>
<p dir=3D"ltr">Brian<br>
</p>

--089e01228aeed86b4c04e4130857--
