Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90B4AE0053A
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 06:07:44 -0800 (PST)
Received: by mail-pb0-f54.google.com with SMTP id uo5so9247591pbc.41
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 06:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=VeYaKgRZN8MP56R479avpMWP88fy3ogQjocGOtyQLHA=;
	b=MUt6iQz+tKZ7os9sTX8qFcQTfYD4YGPiGbBsZPxyGsXEjwEq3NILbPZvnukeoSihRt
	ozso+OcjbxFAKLQQ4KkbnidX7C8mZfvhsGUrqfpPYBwGRf7gJG6YHwCaAEQj+VFTkby9
	/V5m7Ir8vGZhb1eVQpuNCIiRESrMqlVTjueOSy9YqYl0mOMSOQOkh5BQAfcp1l+c/JMk
	gb7FhIxW1EWg9DrVwutA9B/LkqpenNTVCT/0DBBAvvkjBz6et9wWsqDRIKTLhDAl5UJK
	j9glqsiIL5Gi81DCSDAsh7RKSoLttYWVAX7M4LNrgBEI77iqQj+uvBFi2RzlWymRRFuf
	g2Sw==
X-Received: by 10.68.198.97 with SMTP id jb1mr51402066pbc.104.1392214063108;
	Wed, 12 Feb 2014 06:07:43 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	lh13sm162010057pab.4.2014.02.12.06.07.41 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 06:07:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHB-PjmYZUT03PPzHCkasVOoMBMUJWojbL8pMRpipATH6yGpjw@mail.gmail.com>
Date: Wed, 12 Feb 2014 06:07:39 -0800
Message-Id: <FFA7CA3D-C695-4C6D-90EC-F49E23F9E2E2@gmail.com>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
	<CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
	<C969B5B7-2CF7-4815-819E-98FED7D07820@gmail.com>
	<CAHB-PjmYZUT03PPzHCkasVOoMBMUJWojbL8pMRpipATH6yGpjw@mail.gmail.com>
To: =?iso-8859-1?Q?Richard_R=F6jfors?= <richard.rojfors@gmail.com>
X-Mailer: Apple Mail (2.1827)
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
X-List-Received-Date: Wed, 12 Feb 2014 14:07:45 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7BE7C158-BEF2-4EC8-AA46-CE9096CD3F50"

--Apple-Mail=_7BE7C158-BEF2-4EC8-AA46-CE9096CD3F50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Feb 12, 2014, at 6:03 AM, Richard R=F6jfors =
<richard.rojfors@gmail.com> wrote:

> On Wed, Feb 12, 2014 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> what incompatibilities do you see between 4.7 and 4.8 ?=20
>=20
> I saw this in the gcc 4.8 changelog:
> "On ARM, a bug has been fixed in GCC's implementation of the AAPCS =
rules for the layout of vectors that could lead to wrong code being =
generated. Vectors larger than 8 bytes in size are now by default =
aligned to an 8-byte boundary. This is an ABI change: code that makes =
explicit use of vector types may be incompatible with binary objects =
built with older versions of GCC. Auto-vectorized code is not affected =
by this change.=94=20

OK. are you seeing this use case here ?

>=20
> --Richard


--Apple-Mail=_7BE7C158-BEF2-4EC8-AA46-CE9096CD3F50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=windows-1252

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dwindows-1252"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;"><br><div><div>On Feb 12, 2014, at 6:03 AM, Richard =
R=F6jfors &lt;<a =
href=3D"mailto:richard.rojfors@gmail.com">richard.rojfors@gmail.com</a>&gt=
; wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_extra"><div =
class=3D"gmail_quote">On Wed, Feb 12, 2014 at 2:52 PM, Khem Raj <span =
dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><div =
class=3D""><br><div>
what incompatibilities do you see between 4.7 and 4.8 =
?&nbsp;<br></div></div></div></blockquote><div><br></div>I saw this in =
the gcc 4.8 changelog:<br><div>"On ARM, a bug has been fixed in GCC's =
implementation of the AAPCS rules for the layout of vectors that could =
lead to wrong code being generated. Vectors larger than 8 bytes in size =
are now by default aligned to an 8-byte boundary. This is an ABI change: =
code that makes explicit use of vector types may be incompatible with =
binary objects built with older versions of GCC. Auto-vectorized code is =
not affected by this =
change.=94&nbsp;</div></div></div></div></blockquote><div><br></div><div>O=
K. are you seeing this use case here ?</div><br><blockquote =
type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_extra"><div =
class=3D"gmail_quote">
<div><br></div><div>--Richard</div></div></div></div>
</blockquote></div><br></body></html>=

--Apple-Mail=_7BE7C158-BEF2-4EC8-AA46-CE9096CD3F50--
