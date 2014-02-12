Return-Path: <richard.rojfors@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53A1EE0053A
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 06:03:01 -0800 (PST)
Received: by mail-ee0-f52.google.com with SMTP id e53so4382519eek.39
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 06:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+bOaqUbjIGZApskJZSPG3VU5dI4QRnCqSh4G3SXchJk=;
	b=o81O+KpRKzwUsk+HfHb/0hT9DQ1p4KE88Tib2Bg8jyMD9m+nWmtl6RrnPbeWv8ER/g
	POK+VqDhpZSsIcRxyxXqcEV2sTmCfNjOFitGzaU5KgE6X0nXAJkmAm5OyNOsijjKB15f
	RntMIqzqV1PLhDo26rD6yOcIaEnacDiS+GXZp4be+tMim0Bhw+FGYj98ajpzC9cILiSt
	JUAcCHhgTuSN5Y3x66mYAllONbXRqD4B4bBwolra71jPy9t0TbkBTsEKHjH25EXoeSYR
	CPwcuGKGMIBvwVt5VpvbeF0vtiQexJyMp1ODW6YmJIdBZ1SANL8bdKVw5/neRi9P+1bD
	Bdww==
MIME-Version: 1.0
X-Received: by 10.15.42.72 with SMTP id t48mr4161314eev.45.1392213780279; Wed,
	12 Feb 2014 06:03:00 -0800 (PST)
Received: by 10.14.178.196 with HTTP; Wed, 12 Feb 2014 06:03:00 -0800 (PST)
In-Reply-To: <C969B5B7-2CF7-4815-819E-98FED7D07820@gmail.com>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
	<CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
	<C969B5B7-2CF7-4815-819E-98FED7D07820@gmail.com>
Date: Wed, 12 Feb 2014 15:03:00 +0100
Message-ID: <CAHB-PjmYZUT03PPzHCkasVOoMBMUJWojbL8pMRpipATH6yGpjw@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Feb 2014 14:03:04 -0000
Content-Type: multipart/alternative; boundary=089e0160cd1cd3360c04f23607a2

--089e0160cd1cd3360c04f23607a2
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 12, 2014 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> what incompatibilities do you see between 4.7 and 4.8 ?
>

I saw this in the gcc 4.8 changelog:
"On ARM, a bug has been fixed in GCC's implementation of the AAPCS rules
for the layout of vectors that could lead to wrong code being generated.
Vectors larger than 8 bytes in size are now by default aligned to an 8-byte
boundary. This is an ABI change: code that makes explicit use of vector
types may be incompatible with binary objects built with older versions of
GCC. Auto-vectorized code is not affected by this change."

--Richard

--089e0160cd1cd3360c04f23607a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Feb 12, 2014 at 2:52 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"word-wrap:break-word"><div class=3D""><br><d=
iv><div>
what incompatibilities do you see between 4.7 and 4.8 ?=C2=A0<br></div></di=
v></div></div></blockquote><div><br></div>I saw this in the gcc 4.8 changel=
og:<br><div>&quot;On ARM, a bug has been fixed in GCC&#39;s implementation =
of the AAPCS rules for the layout of vectors that could lead to wrong code =
being generated. Vectors larger than 8 bytes in size are now by default ali=
gned to an 8-byte boundary. This is an ABI change: code that makes explicit=
 use of vector types may be incompatible with binary objects built with old=
er versions of GCC. Auto-vectorized code is not affected by this change.&qu=
ot;=C2=A0</div>
<div><br></div><div>--Richard</div></div></div></div>

--089e0160cd1cd3360c04f23607a2--
