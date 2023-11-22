Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CACCC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:05:38 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.17806.1700654731546941367
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 04:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pub1Eggl;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4ac211e5bbbso458050e0c.1
        for <meta-ti@lists.yoctoproject.org>; Wed, 22 Nov 2023 04:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700654730; x=1701259530; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KtIkgb8lES43RgzWpLZDhXigql35iNxf4Yyusw+jugI=;
        b=Pub1Eggl7dtCF7kBpUQ0L7DSWkYCwU0ZT3w5cVup3se5utEdg0Go19KuNELpX3hKxl
         IGOOd824j8dg9SCN8h2oWqxZnMwOiAFYcTKQVlcsT1APfLlAGTEwvx9/LDgOi9LdCCLJ
         DI3TEioP2wU9sBG1PBqjA5PZDXHO2LLpQAqSoYsSHdTcNtmRqQOMa7y5G7ScHj0p+Ex1
         RJUmCM6BujJKcg6J8Wl/hlG6ph8oWRd56JZVReusCanHOZc7E6o1CxFffwK+ieQpWDll
         EnAVQg67RpbuO6dG8ykocKxDfN4QDZfVduQZmV4bDOVBZWtvkR5GlYboB3L+w7lYg08Y
         zCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700654730; x=1701259530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtIkgb8lES43RgzWpLZDhXigql35iNxf4Yyusw+jugI=;
        b=PrcVK9p9P/Fm6vlHBBLRIFpZGhGrJe8C3ZLSP2tL2MihV5mNv0a6TXzgiJHhy0R/jT
         wkUUjAFL1UUaoKqqUPNU0ll3Bv1uIL2eGyCzBnrTlOHdnliJdpDnnCiwWdWTp9FtOeD9
         YRwtcEWZz73oXRt/tDtmcDE/nU9Gq9x4x4OWwHHhlnj+59cUSD8DUw2S85wfrZVYuBrE
         jWXwtke6HqiyArXQj1Nj6SA5vGeWMqlrVwEw+D6QHEOLbZ6EvOi98ZdoBDaWUNZi3Qvj
         H2UJPI4S7H9HDcSIVT2LGmYeXJPo2z8nOSQ19ISCDaxPKsHb7HTupOWntPuxG52q5JLY
         dLbQ==
X-Gm-Message-State: AOJu0YwcC9k9urAJUft07eA9IvgR6XGU3pPqoWMQQdzp+cE9NJ0PAopY
	Lg3vC4i00ASdOs+u6OJiXV2HDKNIQdIbupBghBma0lGrEAA=
X-Google-Smtp-Source: AGHT+IFWIdSr4YkkyOS63awLuUQb/Cp6NLOgeZ1lGcm81e7uHAoJWiDjw4sWc5vfLfsEqUrHhqwbPgd1EVjYX2j9+/k=
X-Received: by 2002:a05:6122:d81:b0:49a:c528:10ab with SMTP id
 bc1-20020a0561220d8100b0049ac52810abmr6401126vkb.1.1700654730428; Wed, 22 Nov
 2023 04:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20231112190743.1496752-1-denis@denix.org> <CANPvuRmdh8EteVzjJto1BgLYdiO1HGdUxihvsDrEYgv3YykOJg@mail.gmail.com>
 <20231121214834.GC26739@denix.org>
In-Reply-To: <20231121214834.GC26739@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 22 Nov 2023 12:05:19 +0000
Message-ID: <CANPvuRnf6dPwTEzVugSy89ddpePBdbsfoBem43jQ=PkXoD+H7Q@mail.gmail.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] k3r5: ensure separate TMPDIR
 used for this multiconfig
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000017c58a060abc89b7"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Nov 2023 12:05:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17326

--00000000000017c58a060abc89b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=C3=A7a, 21/11/2023 =
=C3=A0(s)
21:48:

> On Mon, Nov 13, 2023 at 01:20:25PM +0000, Jose Quaresma wrote:
> > Denys Dmytriyenko <denis@denix.org> escreveu no dia domingo, 12/11/2023
> > =C3=A0(s) 19:07:
> >
> > > From: Denys Dmytriyenko <denys@konsulko.com>
> > >
> > > This k3r5 multiconfig builds baremetal components (and corresponding
> > > native,
> > > nativesdk and cross tools) and sets TCLIBC accordingly to "baremetal"=
.
> The
> > > expectation is that those components and tools will use a separate
> TMPDIR
> > > to isolate from the main Linux build that uses "glibc" TCLIBC and to
> avoid
> > > potential conflicts.
> > >
> > > OE-Core "nodistro" default configuration already sets TCLIBCAPPEND
> facility
> > > to automatically add a suffix to TMPDIR, resulting in "tmp-baremetal"
> temp
> > > directory for this multiconfig and "tmp-glibc" for the main Linux one=
.
> > > Other
> > > distros like Arago follow this convention and even extend a bit (e.g.
> Arago
> > > also adds TCMODE suffix to TMPDIR for external toolchain support
> > > separation).
> > >
> > > But Poky (and derivative distros, like AGL or YoE) disable
> TCLIBCAPPEND and
> > > result in a combined TMPDIR, leading to potential conflicts, such as:
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15273
> > >
> > > And that's just the beginning, there were other conflicts observed
> later in
> > > the build, e.g. during nativesdk builds - that's why we also set a
> unique
> > > SDKPKGSUFFIX here.
> > >
> > > To force a separate TMPDIR for k3r5 multiconfig, we have to directly
> append
> > > a suffix to it. Multiple other options were tested in hopes of making
> it
> > > slightly cleaner, but they either didn't work or were dismissed. For
> > > example,
> > > trying to override TCLIBCAPPEND getting cleared by a distro would
> require
> > > using a machine/soc-override, which doesn't have enough scope
> (nativesdk)
> > > or forcing it with :forcevariable would also change the main Linux
> TMPDIR
> > > and affect existing CI flows. Also, using TCLIBC itself as a suffix t=
o
> add
> > > to TMPDIR may result in getting it appended twice
> (tmp-baremetal-baremetal)
> > > when normal TCLIBCAPPEND facility is used. Hence the least
> > > invasive/confusing
> > > option is to always append "-k3r5" suffix to this multiconfig TMPDIR.
> That
> > > results in "tmp-k3r5" in Poky (leaving main TMPDIR as "tmp"), while
> OE-Core
> > > "nodistro" and Arago would end up with "tmp-baremetal-k3r5" (and
> > > "tmp-glibc"
> > > for the main).
> > >
> > > Also note, meta-ti-bsp layer.conf sets up images and sdks to be
> deployed
> > > into a common location outside of TMPDIRs, but TI_COMMON_DEPLOY
> variable
> > > that controls it is set weakly, allowing to be modified from a distro
> > > configuration or local.conf. It means that all images and sdks can be
> > > deployed into the main TMPDIR if one's CI flow expects tmp/deploy/ as
> > > the final destination, by using :=3D for immediate variable expansion=
:
> > > TI_COMMON_DEPLOY :=3D "${TMPDIR}/deploy"
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > > ---
> > >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > > b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > > index 04b9a746..e36c87ed 100644
> > > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > > +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > > @@ -4,4 +4,6 @@ DEPLOY_DIR_IMAGE:k3r5 =3D
> > > "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
> > >
> > >  MACHINE:append =3D "-k3r5"
> > >  TCLIBC =3D "baremetal"
> > > +TMPDIR:append =3D "-k3r5"
> > > +
> > >
> >
> > Thanks for fixing this long remaining issue on the kirkstone branch.
> >
> > AFAIK all the collision issues are mostly fixed on oe-core master.
>
> Yes, there were several related fixes in oe-core master recently, correct=
.
> But not everything was fixes yet even in master.
>
>
> > For me there are still sporadic failures with the SPDX bbclass.
>
> And SPDX was one of the areas that seen collision fixes in master.
> Unfortunately, those fixes have very little chances to get backported
> to kirkstone. Hence this change.
>

I'm not opposed to having that in kirkstone.
I am working on this SPDX backport but as you said it will be very hard
because some
of these backports requires sstate, siggen and also bitbake patches.


>
>
> > Can this change be optional? with something like:
> >
> > TMPDIRAPPEND ?=3D "-k3r5"
> > TMPDIR:append =3D "${TMPDIRAPPEND}"
> >
> > This adds the possibility of more easily reverting this change
> > to being able to fix what is pending in oe-core master.
>
> The point of this fix was to force separate TMPDIRs to avoid potential
> breakage - I was not planning on making it optional...
>

I've been using a separate TMPDIR directory for some time now on kirkstone
and it was quite difficult to do so
because there is no way to change multiconfig/k3r5.conf in place.
I was told several times here on this list that such a change was not
necessary.


> The request seems to be very specific to layer/framework debugging
> purposes
> at which point this can be modified directly in the conf file. Allowing i=
t
> to
> be disabled cleanly for a build seems dubious. But if there's a strong
> desire,
> I can send a v2...
>

Having something like the above gives more freedom to change it back to a
single TMPDIR.
I prefer a v2 where the user can choose what suits your build best.

Jose


>
> --
> Denys
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000017c58a060abc89b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; escreveu no dia ter=C3=A7a, 21/=
11/2023 =C3=A0(s) 21:48:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Nov 13, 2023 at 01:20:25PM +0000, Jose Quaresma wrote:<b=
r>
&gt; Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_bl=
ank">denis@denix.org</a>&gt; escreveu no dia domingo, 12/11/2023<br>
&gt; =C3=A0(s) 19:07:<br>
&gt; <br>
&gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com"=
 target=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This k3r5 multiconfig builds baremetal components (and correspond=
ing<br>
&gt; &gt; native,<br>
&gt; &gt; nativesdk and cross tools) and sets TCLIBC accordingly to &quot;b=
aremetal&quot;. The<br>
&gt; &gt; expectation is that those components and tools will use a separat=
e TMPDIR<br>
&gt; &gt; to isolate from the main Linux build that uses &quot;glibc&quot; =
TCLIBC and to avoid<br>
&gt; &gt; potential conflicts.<br>
&gt; &gt;<br>
&gt; &gt; OE-Core &quot;nodistro&quot; default configuration already sets T=
CLIBCAPPEND facility<br>
&gt; &gt; to automatically add a suffix to TMPDIR, resulting in &quot;tmp-b=
aremetal&quot; temp<br>
&gt; &gt; directory for this multiconfig and &quot;tmp-glibc&quot; for the =
main Linux one.<br>
&gt; &gt; Other<br>
&gt; &gt; distros like Arago follow this convention and even extend a bit (=
e.g. Arago<br>
&gt; &gt; also adds TCMODE suffix to TMPDIR for external toolchain support<=
br>
&gt; &gt; separation).<br>
&gt; &gt;<br>
&gt; &gt; But Poky (and derivative distros, like AGL or YoE) disable TCLIBC=
APPEND and<br>
&gt; &gt; result in a combined TMPDIR, leading to potential conflicts, such=
 as:<br>
&gt; &gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15=
273" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D15273</a><br>
&gt; &gt;<br>
&gt; &gt; And that&#39;s just the beginning, there were other conflicts obs=
erved later in<br>
&gt; &gt; the build, e.g. during nativesdk builds - that&#39;s why we also =
set a unique<br>
&gt; &gt; SDKPKGSUFFIX here.<br>
&gt; &gt;<br>
&gt; &gt; To force a separate TMPDIR for k3r5 multiconfig, we have to direc=
tly append<br>
&gt; &gt; a suffix to it. Multiple other options were tested in hopes of ma=
king it<br>
&gt; &gt; slightly cleaner, but they either didn&#39;t work or were dismiss=
ed. For<br>
&gt; &gt; example,<br>
&gt; &gt; trying to override TCLIBCAPPEND getting cleared by a distro would=
 require<br>
&gt; &gt; using a machine/soc-override, which doesn&#39;t have enough scope=
 (nativesdk)<br>
&gt; &gt; or forcing it with :forcevariable would also change the main Linu=
x TMPDIR<br>
&gt; &gt; and affect existing CI flows. Also, using TCLIBC itself as a suff=
ix to add<br>
&gt; &gt; to TMPDIR may result in getting it appended twice (tmp-baremetal-=
baremetal)<br>
&gt; &gt; when normal TCLIBCAPPEND facility is used. Hence the least<br>
&gt; &gt; invasive/confusing<br>
&gt; &gt; option is to always append &quot;-k3r5&quot; suffix to this multi=
config TMPDIR. That<br>
&gt; &gt; results in &quot;tmp-k3r5&quot; in Poky (leaving main TMPDIR as &=
quot;tmp&quot;), while OE-Core<br>
&gt; &gt; &quot;nodistro&quot; and Arago would end up with &quot;tmp-bareme=
tal-k3r5&quot; (and<br>
&gt; &gt; &quot;tmp-glibc&quot;<br>
&gt; &gt; for the main).<br>
&gt; &gt;<br>
&gt; &gt; Also note, meta-ti-bsp layer.conf sets up images and sdks to be d=
eployed<br>
&gt; &gt; into a common location outside of TMPDIRs, but TI_COMMON_DEPLOY v=
ariable<br>
&gt; &gt; that controls it is set weakly, allowing to be modified from a di=
stro<br>
&gt; &gt; configuration or local.conf. It means that all images and sdks ca=
n be<br>
&gt; &gt; deployed into the main TMPDIR if one&#39;s CI flow expects tmp/de=
ploy/ as<br>
&gt; &gt; the final destination, by using :=3D for immediate variable expan=
sion:<br>
&gt; &gt; TI_COMMON_DEPLOY :=3D &quot;${TMPDIR}/deploy&quot;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@kons=
ulko.com" target=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt; b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt; index 04b9a746..e36c87ed 100644<br>
&gt; &gt; --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt; +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt; @@ -4,4 +4,6 @@ DEPLOY_DIR_IMAGE:k3r5 =3D<br>
&gt; &gt; &quot;${TI_COMMON_DEPLOY}/images/${MAINMACHINE}&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 MACHINE:append =3D &quot;-k3r5&quot;<br>
&gt; &gt;=C2=A0 TCLIBC =3D &quot;baremetal&quot;<br>
&gt; &gt; +TMPDIR:append =3D &quot;-k3r5&quot;<br>
&gt; &gt; +<br>
&gt; &gt;<br>
&gt; <br>
&gt; Thanks for fixing this long remaining issue on the kirkstone branch.<b=
r>
&gt; <br>
&gt; AFAIK all the collision issues are mostly fixed on oe-core master.<br>
<br>
Yes, there were several related fixes in oe-core master recently, correct. =
<br>
But not everything was fixes yet even in master.<br>
<br>
<br>
&gt; For me there are still sporadic failures with the SPDX bbclass.<br>
<br>
And SPDX was one of the areas that seen collision fixes in master. <br>
Unfortunately, those fixes have very little chances to get backported <br>
to kirkstone. Hence this change.<br></blockquote><div><br>I&#39;m not oppos=
ed to having that in kirkstone.<br>I am working on this SPDX backport but a=
s you said it will be very hard because some</div><div>of these backports r=
equires=C2=A0sstate, siggen and also bitbake patches.<br>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; Can this change be optional? with something like:<br>
&gt; <br>
&gt; TMPDIRAPPEND ?=3D &quot;-k3r5&quot;<br>
&gt; TMPDIR:append =3D &quot;${TMPDIRAPPEND}&quot;<br>
&gt; <br>
&gt; This adds the possibility of more easily reverting this change<br>
&gt; to being able to fix what is pending in oe-core master.<br>
<br>
The point of this fix was to force separate TMPDIRs to avoid potential <br>
breakage - I was not planning on making it optional...<br></blockquote><div=
><br></div><div>I&#39;ve been using a separate TMPDIR directory for some ti=
me now on kirkstone and it was quite difficult to do so</div><div>because t=
here is no way to change multiconfig/k3r5.conf in place.<br>I was told seve=
ral times here on this list that such a change was not necessary.<br><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The request seems to be very specific to layer/framework debugging purposes=
 <br>
at which point this can be modified directly in the conf file. Allowing it =
to <br>
be disabled cleanly for a build seems dubious. But if there&#39;s a strong =
desire, <br>
I can send a v2...<br></blockquote><div><br></div><div>Having something lik=
e the above=C2=A0gives more freedom=C2=A0to change it back to a single TMPD=
IR.</div>I prefer a v2 where the user can choose what suits your build best=
.<br><br>Jose<br class=3D"gmail-Apple-interchange-newline"><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Denys<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000017c58a060abc89b7--

