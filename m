Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.3674.1616829005601450561
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 27 Mar 2021 00:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JeffSVW/;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: praneeth@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1642138C0877
	for <meta-ti@yoctoproject.org>; Sat, 27 Mar 2021 07:10:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12R79tYw085017;
	Sat, 27 Mar 2021 02:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616828995;
	bh=82NkFS/eMpKOJJzVMejxr9R2icAwbZ2ZU64oWz1fZSk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=JeffSVW/7V4ACq8Ghazu5IwFqjy3x2jEx+FwVwdouaX1jRJ/Ebwm8Fy1QQ/JfgD+6
	 aHPjjNgH1Mg0SxCYlJ5uxS65shEvrt8Cqr31vQxY/xfM7SKB8tFKqH8gYrpbV5Lkbj
	 v1gpn5+3FWQHwYJhqMjJD8YqtDFQheB70TyPJf9I=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12R79t4Z023231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 27 Mar 2021 02:09:55 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 27
 Mar 2021 02:09:55 -0500
Received: from DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce]) by
 DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce%20]) with mapi id
 15.01.2176.009; Sat, 27 Mar 2021 02:09:55 -0500
From: "praneeth" <praneeth@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "Tammana, Gowtham" <g-tammana@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>,
        "denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [meta-ti][dunfell/master][PATCH] ti-img-rogue-umlibs: Update to pick rpath fixes
Thread-Topic: [meta-ti][dunfell/master][PATCH] ti-img-rogue-umlibs: Update to
 pick rpath fixes
Thread-Index: AQHXIDlFNkZqrqPAFkm4uYcZdwPboaqXrnQA///Beu4=
Date: Sat, 27 Mar 2021 07:09:55 +0000
Message-ID: <4e19c4f9-f9ca-4a67-ae10-a687a7d65789@email.android.com>
References: <20210323230709.9607-1-g-tammana@ti.com>,<20210327055342.GZ18041@denix.org>
In-Reply-To: <20210327055342.GZ18041@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4e19c4f9f9ca4a67ae10a687a7d65789emailandroidcom_"

--_000_4e19c4f9f9ca4a67ae10a687a7d65789emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In dunfell-next,
Will pick to Dunfell and master in a day.

On Mar 27, 2021 12:53 AM, Denys Dmytriyenko <denis@denix.org> wrote:
On Tue, Mar 23, 2021 at 06:07:09PM -0500, Gowtham Tammana via lists.yoctopr=
oject.org wrote:
> Update srcrev to pick the rpath warning fixes.
>
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>

Praneeth,

Has this been picked up yet? Especially needed for the master, where it's n=
o
longer a warning, but an error.


> ---
>  recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb=
 b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> index d8fae3dd..dafb9dd8 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> @@ -10,13 +10,13 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE =3D "j7"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  BRANCH =3D "linuxws/dunfell/k5.4/${PV}"
>
>  SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=3D=
${BRANCH}"
>
> -SRCREV =3D "3c4cabc8df10a066569e5f959cbbd4c0ce9961cd"
> +SRCREV =3D "5ef38353c38d921a65ea6df75c7b6ce710b66034"
>
>  PVR_SOC ?=3D "j721e_linux"
>  PVR_BUILD ?=3D "release"
> --
> 2.31.0
>

--_000_4e19c4f9f9ca4a67ae10a687a7d65789emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">In dunfell-next,
<div dir=3D"auto">Will pick to Dunfell and master in a day.</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On Mar 27, 2021 12:53 AM, Denys Dmytriyenko &l=
t;denis@denix.org&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Tue, Mar 23, 2021 at 06:07:09PM -0500, Gowtham =
Tammana via lists.yoctoproject.org wrote:<br>
&gt; Update srcrev to pick the rpath warning fixes.<br>
&gt; <br>
&gt; Signed-off-by: Gowtham Tammana &lt;g-tammana@ti.com&gt;<br>
<br>
Tested-by: Denys Dmytriyenko &lt;denys@konsulko.com&gt;<br>
<br>
Praneeth,<br>
<br>
Has this been picked up yet? Especially needed for the master, where it's n=
o <br>
longer a warning, but an error.<br>
<br>
<br>
&gt; ---<br>
&gt;&nbsp; recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb | 4=
 &#43;&#43;--<br>
&gt;&nbsp; 1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728=
.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb<br>
&gt; index d8fae3dd..dafb9dd8 100644<br>
&gt; --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb<br>
&gt; &#43;&#43;&#43; b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.57=
76728.bb<br>
&gt; @@ -10,13 &#43;10,13 @@ REQUIRED_MACHINE_FEATURES =3D &quot;gpu&quot;<=
br>
&gt;&nbsp; PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;j7&quot;<br>
&gt;&nbsp; <br>
&gt; -PR =3D &quot;r1&quot;<br>
&gt; &#43;PR =3D &quot;r2&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; BRANCH =3D &quot;linuxws/dunfell/k5.4/${PV}&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI =3D &quot;git://git.ti.com/graphics/ti-img-rogue-umlibs.=
git;branch=3D${BRANCH}&quot;<br>
&gt;&nbsp; <br>
&gt; -SRCREV =3D &quot;3c4cabc8df10a066569e5f959cbbd4c0ce9961cd&quot;<br>
&gt; &#43;SRCREV =3D &quot;5ef38353c38d921a65ea6df75c7b6ce710b66034&quot;<b=
r>
&gt;&nbsp; <br>
&gt;&nbsp; PVR_SOC ?=3D &quot;j721e_linux&quot;<br>
&gt;&nbsp; PVR_BUILD ?=3D &quot;release&quot;<br>
&gt; -- <br>
&gt; 2.31.0<br>
&gt; <br>
</div>
</span></font>
</body>
</html>

--_000_4e19c4f9f9ca4a67ae10a687a7d65789emailandroidcom_--
