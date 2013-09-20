Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EEB1E015FD
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2013 15:42:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KMgtwJ028433
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2013 17:42:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KMgtMn016883
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2013 17:42:55 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 20 Sep 2013 17:42:55 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Murphy, Dan" <dmurphy@ti.com>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with
	platform-base and PMIC merged
Thread-Index: AQHOtkPaTDcTkk6dRk6tFxlRD0OtPZnPdX2AgAAOfAD//7T+kQ==
Date: Fri, 20 Sep 2013 22:42:55 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E8A7B15@DLEE08.ent.ti.com>
References: <1379710561-16000-1-git-send-email-denis@denix.org>,
	<8F29D6B095ED194EA1980491A5E029710C5583FF@DFLE08.ent.ti.com>,
	<1hnmpuqwd05i99mkxx408jea.1379715079255@email.android.com>
In-Reply-To: <1hnmpuqwd05i99mkxx408jea.1379715079255@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: bump to 3.12-rc1 with platform-base and PMIC merged
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
X-List-Received-Date: Fri, 20 Sep 2013 22:42:57 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E8A7B15DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E8A7B15DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, I know the integration kernel changes frequently. This is a base recip=
e in meta-ti and I don't allow autorevs in meta-ti. I do autorev in meta-ar=
ago distro layer though, until it stabilizes. Same was done for 3.8 before.


Denys


-----Original Message-----
From: Murphy, Dan [dmurphy@ti.com]
Received: Friday, 20 Sep 2013, 18:39
To: Cooper Jr., Franklin [fcooper@ti.com]
CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with plat=
form-base and PMIC merged

You should auto rev this branch.  It can change at any hour.  And so much c=
an be added.

Dan

"Cooper Jr., Franklin" <fcooper@ti.com> wrote:


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, September 20, 2013 3:56 PM
> To: meta-ti@yoctoproject.org
> Cc: Murphy, Dan
> Subject: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with platfo=
rm-base
> and PMIC merged
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Dan Murphy <DMurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> kernel/linux/linux-ti-staging_git.bb
> index 7d84cc4..694a164 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -31,11 +31,11 @@ S =3D "${WORKDIR}/git"
>
>  BRANCH =3D "ti-linux-3.12.y"
>
> -SRCREV =3D "b36f4be3de1b123d8601de062e7dbfc904f305fb"
> -PV =3D "3.10+3.11-rc6"
> +SRCREV =3D "351da8b4c2ff277b2d816a2108ada357a63fadbe"
> +PV =3D "3.11+3.12-rc1"
[Franklin] What does the 3.11+ mean?
>
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild -MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>
>  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
> --
> 1.8.3.2
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE72E8A7B15DLEE08entticom_
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Yes, I know the integration kernel changes frequently. Thi=
s is a base recipe in meta-ti and I don't allow autorevs in meta-ti. I do a=
utorev in meta-arago distro layer
 though, until it stabilizes. Same was done for 3.8 before.<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Murphy, Dan [dmurphy@ti.com]<br>
<b>Received:</b> Friday, 20 Sep 2013, 18:39<br>
<b>To:</b> Cooper Jr., Franklin [fcooper@ti.com]<br>
<b>CC:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 wi=
th platform-base and PMIC merged<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">You should auto rev this branch.&nbsp; It can chan=
ge at any hour.&nbsp; And so much can be added.<br>
<br>
Dan<br>
<br>
&quot;Cooper Jr., Franklin&quot; &lt;fcooper@ti.com&gt; wrote:<br>
<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: meta-ti-bounces@yoctoproject.org [<a href=3D""></a>mailto:meta-t=
i-<br>
&gt; bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko<br>
&gt; Sent: Friday, September 20, 2013 3:56 PM<br>
&gt; To: meta-ti@yoctoproject.org<br>
&gt; Cc: Murphy, Dan<br>
&gt; Subject: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with pla=
tform-base<br>
&gt; and PMIC merged<br>
&gt;<br>
&gt; From: Denys Dmytriyenko &lt;denys@ti.com&gt;<br>
&gt;<br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;denys@ti.com&gt;<br>
&gt; Cc: Dan Murphy &lt;DMurphy@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; recipes-kernel/linux/linux-ti-staging_git.bb | 6 &#43;&#43;&#43;=
---<br>
&gt;&nbsp; 1 file changed, 3 insertions(&#43;), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-<b=
r>
&gt; kernel/linux/linux-ti-staging_git.bb<br>
&gt; index 7d84cc4..694a164 100644<br>
&gt; --- a/recipes-kernel/linux/linux-ti-staging_git.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging_git.bb<br>
&gt; @@ -31,11 &#43;31,11 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;&nbsp; BRANCH =3D &quot;ti-linux-3.12.y&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;b36f4be3de1b123d8601de062e7dbfc904f305fb&quot;<br>
&gt; -PV =3D &quot;3.10&#43;3.11-rc6&quot;<br>
&gt; &#43;SRCREV =3D &quot;351da8b4c2ff277b2d816a2108ada357a63fadbe&quot;<b=
r>
&gt; &#43;PV =3D &quot;3.11&#43;3.12-rc1&quot;<br>
[Franklin] What does the 3.11&#43; mean?<br>
&gt;<br>
&gt;&nbsp; # Append to the MACHINE_KERNEL_PR so that a new SRCREV will caus=
e a<br>
&gt; rebuild -MACHINE_KERNEL_PR_append =3D &quot;b&#43;gitr${SRCPV}&quot;<b=
r>
&gt; &#43;MACHINE_KERNEL_PR_append =3D &quot;a&#43;gitr${SRCPV}&quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI =3D &quot;git://git.ti.com/ti-linux-kernel/ti-linux-<br>
&gt; kernel.git;protocol=3Dgit;branch=3D${BRANCH} \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://defconfig">file://defconfig</a> \<br>
&gt; --<br>
&gt; 1.8.3.2<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; meta-ti@yoctoproject.org<br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E8A7B15DLEE08entticom_--
