Return-Path: <richard.rojfors@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B4F7E00575
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 06:15:40 -0800 (PST)
Received: by mail-ea0-f182.google.com with SMTP id r15so4419268ead.41
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E1uGLogDtEAEOAipvQyYlbjQmeXPM2BybT9FzRCl40k=;
	b=NusPR3m1PMsYRJvTG37tQ6CPb9RrnLFkjc/OES5hbPZjCd84GZXitaODENJb+jVqAh
	/mSCKd35K5knloVhnKiHurpdfkQNbjhxqMefotvla1cVnZOJm2uidwPYteIl4vzkGodZ
	5zFUqx+yTOuLsmqj7Dnkxk9rpkF6czhhieAl1XixWT49KszIWgqE4YxRHyZJ30ijZWd2
	LPa2szFw9bKdFQ225iSGjqgmn+BGCJi9B5B+/eQsJsVL+pwQR3c1CHEatinlDTBQR2fZ
	U5i4rikoePubKQb2nV1NXjSZdApkG4vF3NnXBcm7a9YH0+dFSkhkW+lkBbZCEMYvR9JN
	10tQ==
MIME-Version: 1.0
X-Received: by 10.14.93.199 with SMTP id l47mr4337735eef.58.1392214539012;
	Wed, 12 Feb 2014 06:15:39 -0800 (PST)
Received: by 10.14.178.196 with HTTP; Wed, 12 Feb 2014 06:15:38 -0800 (PST)
In-Reply-To: <FFA7CA3D-C695-4C6D-90EC-F49E23F9E2E2@gmail.com>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
	<CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
	<C969B5B7-2CF7-4815-819E-98FED7D07820@gmail.com>
	<CAHB-PjmYZUT03PPzHCkasVOoMBMUJWojbL8pMRpipATH6yGpjw@mail.gmail.com>
	<FFA7CA3D-C695-4C6D-90EC-F49E23F9E2E2@gmail.com>
Date: Wed, 12 Feb 2014 15:15:38 +0100
Message-ID: <CAHB-Pj=_sDdkbd0qjZVAWVs0f7c1HMiwfMnm13Ckys-UocVL=A@mail.gmail.com>
From: =?UTF-8?Q?Richard_R=C3=B6jfors?= <richard.rojfors@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard/omap4 support
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
X-List-Received-Date: Wed, 12 Feb 2014 14:15:43 -0000
Content-Type: multipart/alternative; boundary=001a11c2707c0d2def04f23635ab

--001a11c2707c0d2def04f23635ab
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2014 at 3:07 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Feb 12, 2014, at 6:03 AM, Richard R=C3=B6jfors <richard.rojfors@gmail.=
com>
> wrote:
>
> On Wed, Feb 12, 2014 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> what incompatibilities do you see between 4.7 and 4.8 ?
>>
>
> I saw this in the gcc 4.8 changelog:
> "On ARM, a bug has been fixed in GCC's implementation of the AAPCS rules
> for the layout of vectors that could lead to wrong code being generated.
> Vectors larger than 8 bytes in size are now by default aligned to an 8-by=
te
> boundary. This is an ABI change: code that makes explicit use of vector
> types may be incompatible with binary objects built with older versions o=
f
> GCC. Auto-vectorized code is not affected by this change.=E2=80=9D
>
>
> OK. are you seeing this use case here ?
>

Nope I've not hit it nor gone through the calls between the blobs and the
surrounding code.

I just think it makes sense to compile the blobs with a compiler similar to
the one provided by oe-core, to avoid the risk...

--Richard

--001a11c2707c0d2def04f23635ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Feb 12, 2014 at 3:07 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><br><div=
><div><div class=3D"h5"><div>On Feb 12, 2014, at 6:03 AM, Richard R=C3=B6jf=
ors &lt;<a href=3D"mailto:richard.rojfors@gmail.com" target=3D"_blank">rich=
ard.rojfors@gmail.com</a>&gt; wrote:</div>
<br></div></div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gm=
ail_extra"><div class=3D"gmail_quote"><div><div class=3D"h5">On Wed, Feb 12=
, 2014 at 2:52 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"word-wrap:break-word"><div><br><div>
what incompatibilities do you see between 4.7 and 4.8 ?=C2=A0<br></div></di=
v></div></blockquote><div><br></div>I saw this in the gcc 4.8 changelog:<br=
></div></div><div>&quot;On ARM, a bug has been fixed in GCC&#39;s implement=
ation of the AAPCS rules for the layout of vectors that could lead to wrong=
 code being generated. Vectors larger than 8 bytes in size are now by defau=
lt aligned to an 8-byte boundary. This is an ABI change: code that makes ex=
plicit use of vector types may be incompatible with binary objects built wi=
th older versions of GCC. Auto-vectorized code is not affected by this chan=
ge.=E2=80=9D=C2=A0</div>
</div></div></div></blockquote><div><br></div><div>OK. are you seeing this =
use case here ?</div></div></div></blockquote><div><br></div><div>Nope I&#3=
9;ve not hit it nor gone through the calls between the blobs and the surrou=
nding code.</div>
<div><br></div><div>I just think it makes sense to compile the blobs with a=
 compiler similar to the one provided by oe-core, to avoid the risk...</div=
><div><br></div><div>--Richard</div><div><br></div></div></div></div>

--001a11c2707c0d2def04f23635ab--
