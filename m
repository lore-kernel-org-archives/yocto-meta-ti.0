Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58EF5E00AB9; Wed, 17 Oct 2018 15:21:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.194 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BBF4E00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 15:21:48 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id p6-v6so17622358qkg.1
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 15:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LMGD8tLD57Kai1hZQNM/7zyTxpxkYi/Tk38KJw4mKNY=;
	b=mXK8p61yKNCVqZM6le13mkkCZGSbSIZPkwkYXAzmTCYUXGh0rZjkW1u/6eV2Uvopw7
	ndYvefRc410FbO852RwZCM0OiBtZXi80haYC04n4VyQI/Mp97ieOEWNJukGIukFoiy/7
	OWumuZtyDTy0Fe8DxTSHWzIr4fV3yHPVs51ssa8uDo0QXCfwbsZvM3nG5dqgT7xH6Nwa
	1rlTelfSJkFqhG99r0PV80onOMGZ6JNMtIxPPpJRqVQp532Mm7caPbNwbyWVz4KKiSDU
	c5UktjNRTUEOGjPtVCnf/RJfCEh6yWtwPVS9GqKzZlqVHEWSOeSerSqao2TlJg+bhqO4
	mJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LMGD8tLD57Kai1hZQNM/7zyTxpxkYi/Tk38KJw4mKNY=;
	b=mSvDD7IftjbpZLpv7lyOxGwHLphDA+z5Ia61zUmLju7MReFXXJbqkvgiiuayivLw9X
	nEnB3y7yy9xK1JWPlr4lRYqaqKdkpYbHzEt5ikieBfCEtTSvq6qEvKk26l/NSsXqmK4/
	JARWL5o53LsUQRulUJeLbWqEZ0FON2X9FzkJrrwKC+bz8+6L+5jIA8auy2JW8tdi/ZUb
	D2RnehIkQSKju3SZ2+LssQijjFRQcWr0WofVEqkRqINR7v5XmnGjS5EpIxmUR5CfBbil
	DaYjiyyCWFBlVNhoMoOOrtyfxNbvhzURZVK/GD4MYPRSTZ8znypGPuiTLTpN+QojctjB
	4xew==
X-Gm-Message-State: ABuFfoiynCZwTKAukqH5r9YUlBHFcpb9+/g/g7CsV5uhd5FMUGWuNWxD
	O6FXmcLI0VtmIzSLb51UsAsjhrc1KklyIjD2DRA=
X-Google-Smtp-Source: ACcGV63n1KjcPWoIWovKYPd2UgoEe6ASoPvkzfSMxQKTEWzFwCQh5xwkOSDU6HckgcC0F9HHb48FFAYEjw3z0ooiOaY=
X-Received: by 2002:ae9:f408:: with SMTP id y8-v6mr27419806qkl.2.1539814907307;
	Wed, 17 Oct 2018 15:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20181017192853.42942-1-raj.khem@gmail.com>
	<20181017192853.42942-2-raj.khem@gmail.com>
	<20181017201146.GL4031@beryl>
In-Reply-To: <20181017201146.GL4031@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 15:21:35 -0700
Message-ID: <CAMKF1spKKL=KZeH+JN8OVWRh5yBu2DzdzD39XQZNwk7W08=QUg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/5] recips: Mark more recipes to be ti-soc specific
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
X-List-Received-Date: Wed, 17 Oct 2018 22:21:49 -0000
Content-Type: multipart/alternative; boundary="00000000000091eb8d0578741815"

--00000000000091eb8d0578741815
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 17, 2018 at 1:11 PM Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Oct 17, 2018 at 12:28:50PM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 3 +++
> >  recipes-bsp/cmem/cmem.inc                   | 2 ++
> >  recipes-ti/devtools/ti-xdctools-common.inc  | 5 +++++
> >  recipes-ti/osal/ti-osal.inc                 | 4 ++++
> >  4 files changed, 14 insertions(+)
> >
> > diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> > index 93cebd71..e1f21054 100644
> > --- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> > +++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> > @@ -24,3 +24,6 @@ do_install() {
> >  }
> >
> >  FILES_${PN} += "${base_libdir}/firmware"
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti33x = "(.*)"
>
> This is incorrect - it's not limited to ti33x soc, but multiple socs with
> Cortex-M3 used for PM...


Ok tell me which ones and we can add compatible host statements may be
ti-soc is right if it is on all socs

>
>
>
> > +
>
> I noticed bunch of "new blank line at EOF" from git, so I'm cleaning it up
> and
> while at it, I'll squash these 2 similar patches...
>
>
> > diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > index 11cebe8d..abbf2492 100644
> > --- a/recipes-bsp/cmem/cmem.inc
> > +++ b/recipes-bsp/cmem/cmem.inc
> > @@ -12,3 +12,5 @@ PV = "4.15.00.02+git${SRCPV}"
> >  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}
> <http://git.ti.com/ipc/ludev.git;protocol=git;branch=$%7BBRANCH%7D>"
> >
> >  S = "${WORKDIR}/git"
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > diff --git a/recipes-ti/devtools/ti-xdctools-common.inc
> b/recipes-ti/devtools/ti-xdctools-common.inc
> > index a3949cad..0e86ef7a 100644
> > --- a/recipes-ti/devtools/ti-xdctools-common.inc
> > +++ b/recipes-ti/devtools/ti-xdctools-common.inc
> > @@ -61,3 +61,8 @@ libhpi.so \
> >  lib.so \
> >  libcairo.so.2 \
> >  "
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > +COMPATIBLE_HOST_class-native = "(.*)"
> > +COMPATIBLE_HOST_class-nativesdk = "(.*)"
> > +
> > diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc
> > index cb8da354..bbbdf517 100644
> > --- a/recipes-ti/osal/ti-osal.inc
> > +++ b/recipes-ti/osal/ti-osal.inc
> > @@ -19,3 +19,7 @@ INSANE_SKIP_${PN}-dev = "staticdev"
> >
> >  ALLOW_EMPTY_${PN} = "1"
> >  FILES_${PN}-dev += "${OSAL_INSTALL_DIR_RECIPE}"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > +
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--00000000000091eb8d0578741815
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Oct 17, 2018 at 1:11 PM Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.c=
om">denys@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Wed, Oct 17, 2018 at 12:28:50PM -0700, Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-bsp/cm3-pm-firmware/<a href=3D"http://amx3-cm3_git.bb" r=
el=3D"noreferrer" target=3D"_blank">amx3-cm3_git.bb</a> | 3 +++<br>
&gt;=C2=A0 recipes-bsp/cmem/cmem.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 recipes-ti/devtools/ti-xdctools-common.inc=C2=A0 | 5 +++++<br>
&gt;=C2=A0 recipes-ti/osal/ti-osal.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt;=C2=A0 4 files changed, 14 insertions(+)<br>
&gt; <br>
&gt; diff --git a/recipes-bsp/cm3-pm-firmware/<a href=3D"http://amx3-cm3_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">amx3-cm3_git.bb</a> b/recipes-bs=
p/cm3-pm-firmware/<a href=3D"http://amx3-cm3_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">amx3-cm3_git.bb</a><br>
&gt; index 93cebd71..e1f21054 100644<br>
&gt; --- a/recipes-bsp/cm3-pm-firmware/<a href=3D"http://amx3-cm3_git.bb" r=
el=3D"noreferrer" target=3D"_blank">amx3-cm3_git.bb</a><br>
&gt; +++ b/recipes-bsp/cm3-pm-firmware/<a href=3D"http://amx3-cm3_git.bb" r=
el=3D"noreferrer" target=3D"_blank">amx3-cm3_git.bb</a><br>
&gt; @@ -24,3 +24,6 @@ do_install() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES_${PN} +=3D &quot;${base_libdir}/firmware&quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti33x =3D &quot;(.*)&quot;<br>
<br>
This is incorrect - it&#39;s not limited to ti33x soc, but multiple socs wi=
th <br>
Cortex-M3 used for PM...</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Ok tell me which ones and we can add compatible host statements m=
ay be ti-soc is right if it is on all socs=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><br>
<br>
<br>
&gt; +<br>
<br>
I noticed bunch of &quot;new blank line at EOF&quot; from git, so I&#39;m c=
leaning it up and <br>
while at it, I&#39;ll squash these 2 similar patches...<br>
<br>
<br>
&gt; diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc<br>
&gt; index 11cebe8d..abbf2492 100644<br>
&gt; --- a/recipes-bsp/cmem/cmem.inc<br>
&gt; +++ b/recipes-bsp/cmem/cmem.inc<br>
&gt; @@ -12,3 +12,5 @@ PV =3D &quot;4.15.00.02+git${SRCPV}&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.ti.com/ipc/ludev.g=
it;protocol=3Dgit;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer" target=3D"_bla=
nk">git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BRANCH}</a>&quot;<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/d=
evtools/ti-xdctools-common.inc<br>
&gt; index a3949cad..0e86ef7a 100644<br>
&gt; --- a/recipes-ti/devtools/ti-xdctools-common.inc<br>
&gt; +++ b/recipes-ti/devtools/ti-xdctools-common.inc<br>
&gt; @@ -61,3 +61,8 @@ libhpi.so \<br>
&gt;=C2=A0 lib.so \<br>
&gt;=C2=A0 libcairo.so.2 \<br>
&gt;=C2=A0 &quot;<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; +COMPATIBLE_HOST_class-native =3D &quot;(.*)&quot;<br>
&gt; +COMPATIBLE_HOST_class-nativesdk =3D &quot;(.*)&quot;<br>
&gt; +<br>
&gt; diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc=
<br>
&gt; index cb8da354..bbbdf517 100644<br>
&gt; --- a/recipes-ti/osal/ti-osal.inc<br>
&gt; +++ b/recipes-ti/osal/ti-osal.inc<br>
&gt; @@ -19,3 +19,7 @@ INSANE_SKIP_${PN}-dev =3D &quot;staticdev&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt;=C2=A0 FILES_${PN}-dev +=3D &quot;${OSAL_INSTALL_DIR_RECIPE}&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST ?=3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST_ti-soc =3D &quot;(.*)&quot;<br>
&gt; +<br>
&gt; -- <br>
&gt; 2.19.1<br>
&gt; <br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
</blockquote></div></div>

--00000000000091eb8d0578741815--
