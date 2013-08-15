Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31628E0073F
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:33:07 -0700 (PDT)
Received: by mail-ie0-f181.google.com with SMTP id x14so2031746ief.26
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=woGfy0I5J+2rnBN3mPb0IAkrgXC0YbaIn4Tl8DOBWFI=;
	b=TYh4SxkYOrVQBWrB/Uum1yd9RDXdmeGeh9QVDHi4vCsGab33sY23V3IJXKBgqkyq+p
	jrTwc7MVlWh4vDG2Gh+pORm0LTcH4VRJ9WZvvLgdl0MNYWEyjOqrPuR1q0AI+jW+rwcB
	hTcUY1o6K2bL92DDCsqPgOp2rfOOjqOF0xpyhTF3HCjsqKi9gxSKZjFDaccEQTAdJScu
	y0w6/zcwVBLFRH+8WIi8vJ5byN0xnopQyalA+It7PptPyXpLgE0wnre7hbMGFboYxpxs
	2gk62Z+k2IHmrDUhLkQQ7j4cupFJla6HGniywHh80e54vyR8zUF2B5NZitkY8kQolubo
	cYsg==
X-Received: by 10.50.61.179 with SMTP id q19mr2589525igr.33.1376602386743;
	Thu, 15 Aug 2013 14:33:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Thu, 15 Aug 2013 14:32:36 -0700 (PDT)
In-Reply-To: <CAFZh4h92PbtVfz3q0nknoRNe3nHaGGNurOa-T0HSGzRinvHCsA@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h92PbtVfz3q0nknoRNe3nHaGGNurOa-T0HSGzRinvHCsA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Aug 2013 14:32:36 -0700
Message-ID: <CAMKF1srWwdOs+d5EWFSYbup3hvUmBxXH+wf04msajpcVpYDiAA@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Aug 2013 21:33:08 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109e4250c004e4033898

--047d7bdc109e4250c004e4033898
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2013 at 2:14 PM, Brian Hutchinson <b.hutchman@gmail.com>wro=
te:

> Update.  Well, adding Sakoman's patch to head.S and compiling with -mno-u=
naligned-access
> didn't appear to help so far ... :(
>
>
=E2=80=8BIf its gcc 4.8+ then you also need more patches see my fixes for b=
eagle
e.g.

https://github.com/beagleboard/meta-beagleboard/commit/87efc663c4f76d3051ce=
cf1e2c3e2bbd461d200b
=E2=80=8B



> Regards,
>
> Brian
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--047d7bdc109e4250c004e4033898
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:&#39;cou=
rier new&#39;,monospace;font-size:small"><br></div><div class=3D"gmail_extr=
a"><br><br><div class=3D"gmail_quote">On Thu, Aug 15, 2013 at 2:14 PM, Bria=
n Hutchinson <span dir=3D"ltr">&lt;<a href=3D"mailto:b.hutchman@gmail.com" =
target=3D"_blank">b.hutchman@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr">Update. =C2=A0Well, adding Sakoman&#39;s =
patch to head.S and compiling with=C2=A0<span style=3D"white-space:pre-wrap=
">-mno-unaligned-access didn&#39;t appear to help so far ... :(</span><div>

<span style=3D"white-space:pre-wrap"><br></span></div></div></blockquote><d=
iv><br></div><div><div style=3D"font-family:&#39;courier new&#39;,monospace=
;font-size:small" class=3D"gmail_default">=E2=80=8BIf its gcc 4.8+ then you=
 also need more patches see my fixes for beagle e.g.</div>

<div style=3D"font-family:&#39;courier new&#39;,monospace;font-size:small" =
class=3D"gmail_default"><br></div><div style=3D"font-family:&#39;courier ne=
w&#39;,monospace;font-size:small" class=3D"gmail_default"><a href=3D"https:=
//github.com/beagleboard/meta-beagleboard/commit/87efc663c4f76d3051cecf1e2c=
3e2bbd461d200b">https://github.com/beagleboard/meta-beagleboard/commit/87ef=
c663c4f76d3051cecf1e2c3e2bbd461d200b</a>=E2=80=8B</div>

<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><div><span sty=
le=3D"white-space:pre-wrap">
</span></div><div><font color=3D"#000000"><span style=3D"white-space:pre-wr=
ap">Regards,</span></font></div><div><font color=3D"#000000"><span style=3D=
"white-space:pre-wrap"><br></span></font></div><div><font color=3D"#000000"=
><span style=3D"white-space:pre-wrap">Brian</span></font></div>


</div>
<br>_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br></blockquote></div><br></div></div>

--047d7bdc109e4250c004e4033898--
