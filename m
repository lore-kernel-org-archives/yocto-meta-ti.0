Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B395FC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:33:14 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.202.1654101190892502644
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 09:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CxScoW3G;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id me5so4369334ejb.2
        for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 09:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EADKgoTQXMqg/jS3TCPIqo91rehJRvNtdfQZiM9DQCo=;
        b=CxScoW3G0q4O+F0fqhF5tiWIHz5vHgPcfcnakCrMgXz4e13qHCEjZSdX4rwD7hQPGd
         YSpz9lm0yShQHt53X1X47v92mnsSZR6IDiH5377BQmJgFYbl3IcbR40Uftm9fmxc2+cA
         TpDgkow6IYXS68waSAKXs+R5pVhq5KXdYkHDqcQlduKSt2acUYOaO28EpQ1iMpFVVjUP
         ag4AB1wiHhsLBtyGeFs/zKYmWRCfvuceTvYUxxeICWUKxLrqHcRj8kY1e5Li96An+oK9
         9J4VcXFZj3B+66IlvotCGTr8QP+nCEyLL8qPkIwCZIrvC1uScPExAW8tYtmqsAHdN/Ka
         kF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EADKgoTQXMqg/jS3TCPIqo91rehJRvNtdfQZiM9DQCo=;
        b=gTMdvna4G3g8qU3p30L5zMAqBOTJrXMG+892jME8asgwPq+FBTJXrkutjyVcWQCfS0
         P+PkDrF6mh4PR8EFEEK2NPkTAVBHZlGnOopwdSAyyxDCaQMITLPq42W5h/1y2yG1pplO
         DLkhOBg99WZvvlmKw+J4DecbN0lXWlOl+WYHzWsL+bMpPmUqyrKcfJl1B/JYfOjBt6K/
         RvuiBvh0KSaAYsksJ+nZq2nxs5ibFf1AN6PkrhAqW1OXNLj3+BIzh7ILtrexHmKU8ymB
         BrN27NpAx277DgF6u4v3OIvFk92CTpVE4OCmgkFkHqMo4z7PSMW8uxYVylfN1wow4Qzn
         Oegw==
X-Gm-Message-State: AOAM533hpzvhFqcXbfT2kh06v9GlGLRIsmRtQGc/fTkPwvPkrlcii2kE
	QhHmpo/W007rYQFdx2liicVars/TvpAqcTybcy0=
X-Google-Smtp-Source: 
 ABdhPJxEdHOGds2qxEipICjLhw4BTzItK2C/BxvNmsYfM6cSMuL8kqFiiitwsRoOSOrbfupqq3pCJu97hp2Em0acyKI=
X-Received: by 2002:a17:906:2b5a:b0:707:ce7b:94eb with SMTP id
 b26-20020a1709062b5a00b00707ce7b94ebmr302374ejg.335.1654101189291; Wed, 01
 Jun 2022 09:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220530143810.4064720-1-jose.quaresma@foundries.io>
 <20220531193302.GC9834@denix.org>
 <CANPvuRkX=xftYt2RWasxE-E2MJJuKBhdQdV+jQg15tH3TpSMwg@mail.gmail.com>
In-Reply-To: 
 <CANPvuRkX=xftYt2RWasxE-E2MJJuKBhdQdV+jQg15tH3TpSMwg@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 1 Jun 2022 09:32:58 -0700
Message-ID: 
 <CABcZAN=0fXtmoVK2WfvUjOuptOpDbqk-uvk_EJAesdXR2c71pg@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] multiconfig: use diferent TMPDIR for each
 machine
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000cf72ce05e065717c"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jun 2022 16:33:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14770

--000000000000cf72ce05e065717c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Multi-machine builds in a single tmpdir has been supported by oe since
before multiconfig existed, and certainly works fine with multiconfig, it's
only other configuration changes, such as distro, that result in conflicts
and failures when using multiconfig in a single tmpdir. I don't think it's
a good idea to force the matter due to flaws in archiver, personally.

On Wed, Jun 1, 2022 at 2:17 AM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

>
>
> Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=C3=A7a, 31/05/202=
2
> =C3=A0(s) 20:33:
>
>> On Mon, May 30, 2022 at 03:38:10PM +0100, Jose Quaresma wrote:
>> > Bitbake manual [1] recomends to use one TMPDIR for each machine:
>> >
>> >  "Minimally, each configuration file must define the machine and the
>> >  temporary directory BitBake uses for the build.
>> >  Suggested practice dictates that you do not overlap the temporary
>> >  directories used during the builds."
>>
>> What specific issue are you trying to fix with this?
>>
>
> The issue that I have is in the OE-core archiver.bbclasse that doesn't
> support multiconfig when
> using the same TMPDIR, this because the shared recipes like gcc, kernel
>
> It can be replicates in kirkstone using the am64xx-evm with the following=
:
>
> # archive sources for target recipes in conf/local.conf
> INHERIT +=3D "archiver"
> COPYLEFT_RECIPE_TYPES =3D "target"
> ARCHIVER_MODE[src] =3D "original"
> ARCHIVER_MODE[diff] =3D "1"
>
> # and run bitbake with:
> bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c do_unpack_and_patc=
h
> -f
>
> more info in following patch:
> https://lists.openembedded.org/g/openembedded-core/message/166203
>
>
>> I'm not aware of any immediate issues (because here multiconfig is used
>> for
>> completely separate machines and those are well isolated inside the temp
>> dir),
>> but I see few problems this will cause down the road, so I'm against thi=
s
>> change.
>>
>
> What you are saying is that this change will introduce new  problems or
> regressions?
>
> Jose
>
>
>>
>>
>> > [1]
>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-m=
anual-intro.html#executing-a-multiple-configuration-build
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> b/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> > index deb07210..0ba163ae 100644
>> > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> > +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> > @@ -3,3 +3,5 @@ MAINMACHINE :=3D "${MACHINE}"
>> >  DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"
>> >
>> >  MACHINE:append =3D "-k3r5"
>> > +
>> > +TMPDIR =3D "${TOPDIR}/tmp-${MACHINE}"
>> > --
>> > 2.36.1
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14769):
> https://lists.yoctoproject.org/g/meta-ti/message/14769
> Mute This Topic: https://lists.yoctoproject.org/mt/91431962/3617123
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> kergoth@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--000000000000cf72ce05e065717c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Multi-machine builds in a single tmpdir has been supported=
 by oe since before multiconfig existed, and certainly works fine with mult=
iconfig, it&#39;s only other configuration changes, such as distro, that re=
sult in conflicts and failures when using multiconfig in a single tmpdir. I=
 don&#39;t think it&#39;s a good idea to force the matter due to flaws in a=
rchiver, personally.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Wed, Jun 1, 2022 at 2:17 AM Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.=
org" target=3D"_blank">denis@denix.org</a>&gt; escreveu no dia ter=C3=A7a, =
31/05/2022 =C3=A0(s) 20:33:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Mon, May 30, 2022 at 03:38:10PM +0100, Jose Quaresma wrote:<=
br>
&gt; Bitbake manual [1] recomends to use one TMPDIR for each machine:<br>
&gt; <br>
&gt;=C2=A0 &quot;Minimally, each configuration file must define the machine=
 and the<br>
&gt;=C2=A0 temporary directory BitBake uses for the build.<br>
&gt;=C2=A0 Suggested practice dictates that you do not overlap the temporar=
y<br>
&gt;=C2=A0 directories used during the builds.&quot;<br>
<br>
What specific issue are you trying to fix with this?<br></blockquote><div><=
br></div><div>The issue that I have is in the OE-core archiver.bbclasse tha=
t doesn&#39;t support multiconfig when</div><div>using the same TMPDIR, thi=
s because the shared recipes like gcc, kernel</div><div><br></div><div>It c=
an be replicates in kirkstone using the am64xx-evm with the following:</div=
><div><span style=3D"font-family:monospace"><br></span></div><div># archive=
 sources for target recipes in conf/local.conf=C2=A0<br>INHERIT +=3D &quot;=
archiver&quot;<br>COPYLEFT_RECIPE_TYPES =3D &quot;target&quot;<br>ARCHIVER_=
MODE[src] =3D &quot;original&quot;<br>ARCHIVER_MODE[diff] =3D &quot;1&quot;=
</div><div><br># and run bitbake with:<br>bitbake mc:k3r5:gcc-source-11.2.0=
 gcc-source-11.2.0 -c do_unpack_and_patch -f<br></div><div><br></div><div>m=
ore info in following=C2=A0patch:</div><div><a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/message/166203" target=3D"_blank">https://li=
sts.openembedded.org/g/openembedded-core/message/166203</a><br></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m not aware of any immediate issues (because here multiconfig is used=
 for <br>
completely separate machines and those are well isolated inside the temp di=
r), <br>
but I see few problems this will cause down the road, so I&#39;m against th=
is <br>
change.<br></blockquote><div><br></div><div>What you are saying is that thi=
s change will introduce new=C2=A0 problems or regressions?</div><div><br></=
div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
&gt; [1] <a href=3D"https://docs.yoctoproject.org/bitbake/bitbake-user-manu=
al/bitbake-user-manual-intro.html#executing-a-multiple-configuration-build"=
 rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake=
/bitbake-user-manual/bitbake-user-manual-intro.html#executing-a-multiple-co=
nfiguration-build</a><br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf=
/multiconfig/k3r5.conf<br>
&gt; index deb07210..0ba163ae 100644<br>
&gt; --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; @@ -3,3 +3,5 @@ MAINMACHINE :=3D &quot;${MACHINE}&quot;<br>
&gt;=C2=A0 DEPLOY_DIR_IMAGE =3D &quot;${DEPLOY_DIR}/images/${MAINMACHINE}&q=
uot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MACHINE:append =3D &quot;-k3r5&quot;<br>
&gt; +<br>
&gt; +TMPDIR =3D &quot;${TOPDIR}/tmp-${MACHINE}&quot;<br>
&gt; -- <br>
&gt; 2.36.1<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#14769): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/14769" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/14769</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/91431962/3617=
123" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/91431962/3617123</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@g=
mail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D=
"#333333">Christopher Larson<br><a>chris_larson@mentor.com</a>,=C2=A0<a>chr=
is.larson@siemens.com</a>,=C2=A0<a>kergoth@gmail.com</a><br>Principal Softw=
are Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemens Digital Industrie=
s Software</font><br></div></div></div>

--000000000000cf72ce05e065717c--

