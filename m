Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C266FCCA47B
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 13:36:10 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.6500.1654176965274543663
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 06:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pIEM07yx;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id a23so5266257ljd.9
        for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fViO6W/V+cR5wQTVsdaaSUclaZ1nIGxS53VtxrQso6A=;
        b=pIEM07yx1uLJh5jV7T8kWLQJXLS1zZVtqu9oOtIE05WuB1nxaeo9CdC1lLf5nQuTnh
         SaSs9vRiEKrQosXxudKR0QmO02yWrw/hfvFAdYh0uXDIuFskSWMwab4IZTGjXLcsw7MV
         QYMgLImpYKAgEvFsjeSl9wP7H+w5FGLpIQifvDcG4z62AC6bKaO5Y09a944SWIL7R4hy
         4yJepghX8BiLktFRuW3Z8Ny6fZ+rTd895gusjFzF32PwCMdNFBY8VSgibYZLdGyGJhI/
         iVg77FmFs3R/r/yYLye0mEZxHIH4mviB5Ybwkox0BPxAZKQD48ECyYUuTaSirbXychab
         cznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fViO6W/V+cR5wQTVsdaaSUclaZ1nIGxS53VtxrQso6A=;
        b=TwH8WmZR646hYCuydgqCp/2r/SsV1D/b1tASj/LCN8Jwk4FzNv/RWC6mHOJ3JZMzk9
         G3Mi7oWaVmt2SWOVbHKnRdAz+9SfDws7uwgiXpKc4srwEyET8TyM3GR4TqvRVCNjokOI
         o/gD1V9LsUvE+eJZVUR2snk3RR5RWbWOaciPQFDQarW09+AsLS3dFdDLO3LoJQWPI/+5
         BPbUjxHMJxZxHecZizU+AtmPD+b2+pToPaUd3ngqsJxmfB837PQXQZX/VtySp7aRwf6h
         43JoBjE/kxIQx2MKqOvetuz6NDKCF2sbEv9oD7hOAHBhKrkXgFUtzGfojIcLN8BoF+YD
         SbGw==
X-Gm-Message-State: AOAM530Hmt/wBOaoGcNX+pcO4Q0a5LBoLGvHuYGCFWb+2yLgP/dcho/W
	U+XOKx5X75wZDx0XiZrRdgfpzZOYsojUPU/uniE=
X-Google-Smtp-Source: 
 ABdhPJxOHnRIQQA0ikZNs9dkOwwyx9p4Inw4DaZBafPx+ufciF2lO+7GEdhJ99EhajKGRhW/FTn9ABh2Wwjttm80CqE=
X-Received: by 2002:a2e:b753:0:b0:255:3a90:9d2 with SMTP id
 k19-20020a2eb753000000b002553a9009d2mr18250094ljo.91.1654176962832; Thu, 02
 Jun 2022 06:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220530143810.4064720-1-jose.quaresma@foundries.io>
 <20220531193302.GC9834@denix.org>
 <CANPvuRkX=xftYt2RWasxE-E2MJJuKBhdQdV+jQg15tH3TpSMwg@mail.gmail.com>
 <CABcZAN=0fXtmoVK2WfvUjOuptOpDbqk-uvk_EJAesdXR2c71pg@mail.gmail.com>
 <20220601164856.GH9834@denix.org>
In-Reply-To: <20220601164856.GH9834@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 2 Jun 2022 14:35:51 +0100
Message-ID: 
 <CANPvuRkrZVwBqASxEf5D8B0uSvFoHkoVtAsc1GNoHqPL2QC=rA@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] multiconfig: use diferent TMPDIR for each
 machine
To: Denys Dmytriyenko <denis@denix.org>
Cc: Christopher Larson <kergoth@gmail.com>, meta-ti@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000043edf705e07716b9"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jun 2022 13:36:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14772

--00000000000043edf705e07716b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia quarta, 1/06/2022 =C3=
=A0(s)
17:49:

> On Wed, Jun 01, 2022 at 09:32:58AM -0700, Christopher Larson wrote:
> > Multi-machine builds in a single tmpdir has been supported by oe since
> > before multiconfig existed, and certainly works fine with multiconfig,
> it's
> > only other configuration changes, such as distro, that result in
> conflicts
> > and failures when using multiconfig in a single tmpdir. I don't think
> it's
> > a good idea to force the matter due to flaws in archiver, personally.
>

I will investigate a bit more but for now the only issue I see is on the
archiver.


>
> Yes, I agree that in this case it is best to fix the archiver class.
>

I will try this approach instead.


>
> The reason everything else just works is because there's already
> per-machine
> separation in many places - deploy, images, work, cache, stamps, etc.
>

yes, everything seems to work except for the archiver class so for sure the
problem is here.


>
> There's also a great re-use of shared components between similar machines
> built in the same tmpdir. As Chris says, this always worked even before
> multiconfig - you just change MACHINE and re-run bitbake. And multiconfig
> simply allows doing it in one invocation of bitbake, that's all.
>

Right and I totally agree.
Thanks for your input which always helps to better understand how this
beast called bitbake works ;)

Jose


>
> Denys
>
>
> > On Wed, Jun 1, 2022 at 2:17 AM Jose Quaresma <quaresma.jose@gmail.com>
> > wrote:
> >
> > >
> > >
> > > Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=C3=A7a, 31/05=
/2022
> > > =C3=A0(s) 20:33:
> > >
> > >> On Mon, May 30, 2022 at 03:38:10PM +0100, Jose Quaresma wrote:
> > >> > Bitbake manual [1] recomends to use one TMPDIR for each machine:
> > >> >
> > >> >  "Minimally, each configuration file must define the machine and t=
he
> > >> >  temporary directory BitBake uses for the build.
> > >> >  Suggested practice dictates that you do not overlap the temporary
> > >> >  directories used during the builds."
> > >>
> > >> What specific issue are you trying to fix with this?
> > >>
> > >
> > > The issue that I have is in the OE-core archiver.bbclasse that doesn'=
t
> > > support multiconfig when
> > > using the same TMPDIR, this because the shared recipes like gcc, kern=
el
> > >
> > > It can be replicates in kirkstone using the am64xx-evm with the
> following:
> > >
> > > # archive sources for target recipes in conf/local.conf
> > > INHERIT +=3D "archiver"
> > > COPYLEFT_RECIPE_TYPES =3D "target"
> > > ARCHIVER_MODE[src] =3D "original"
> > > ARCHIVER_MODE[diff] =3D "1"
> > >
> > > # and run bitbake with:
> > > bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c
> do_unpack_and_patch
> > > -f
> > >
> > > more info in following patch:
> > > https://lists.openembedded.org/g/openembedded-core/message/166203
> > >
> > >
> > >> I'm not aware of any immediate issues (because here multiconfig is
> used
> > >> for
> > >> completely separate machines and those are well isolated inside the
> temp
> > >> dir),
> > >> but I see few problems this will cause down the road, so I'm against
> this
> > >> change.
> > >>
> > >
> > > What you are saying is that this change will introduce new  problems =
or
> > > regressions?
> > >
> > > Jose
> > >
> > >
> > >>
> > >>
> > >> > [1]
> > >>
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-intro.html#executing-a-multiple-configuration-build
> > >> >
> > >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > >> > ---
> > >> >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
> > >> >  1 file changed, 2 insertions(+)
> > >> >
> > >> > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > >> b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > >> > index deb07210..0ba163ae 100644
> > >> > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > >> > +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > >> > @@ -3,3 +3,5 @@ MAINMACHINE :=3D "${MACHINE}"
> > >> >  DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"
> > >> >
> > >> >  MACHINE:append =3D "-k3r5"
> > >> > +
> > >> > +TMPDIR =3D "${TOPDIR}/tmp-${MACHINE}"
> > >> > --
> > >> > 2.36.1
> > >>
> > >
> > >
> > > --
> > > Best regards,
> > >
> > > Jos=C3=A9 Quaresma
> > >
> > >
> > >
> > >
> >
> > --
> > Christopher Larson
> > chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
> > Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
> > Industries Software
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14771):
> https://lists.yoctoproject.org/g/meta-ti/message/14771
> Mute This Topic: https://lists.yoctoproject.org/mt/91431962/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000043edf705e07716b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; escreveu no dia quarta, 1/06/20=
22 =C3=A0(s) 17:49:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Wed, Jun 01, 2022 at 09:32:58AM -0700, Christopher Larson wrote:<br>
&gt; Multi-machine builds in a single tmpdir has been supported by oe since=
<br>
&gt; before multiconfig existed, and certainly works fine with multiconfig,=
 it&#39;s<br>
&gt; only other configuration changes, such as distro, that result in confl=
icts<br>
&gt; and failures when using multiconfig in a single tmpdir. I don&#39;t th=
ink it&#39;s<br>
&gt; a good idea to force the matter due to flaws in archiver, personally.<=
br></blockquote><div><br></div><div>I will investigate a bit more but for n=
ow the only issue I see is on the archiver.</div><div>=C2=A0<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Yes, I agree that in this case it is best to fix the archiver class.<br></b=
lockquote><div><br></div><div>I will try this approach=C2=A0instead.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The reason everything else just works is because there&#39;s already per-ma=
chine <br>
separation in many places - deploy, images, work, cache, stamps, etc.<br></=
blockquote><div><br></div><div>yes, everything seems to work except for the=
 archiver class so for sure the problem is here.</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
There&#39;s also a great re-use of shared components between similar machin=
es <br>
built in the same tmpdir. As Chris says, this always worked even before <br=
>
multiconfig - you just change MACHINE and re-run bitbake. And multiconfig <=
br>
simply allows doing it in one invocation of bitbake, that&#39;s all.<br></b=
lockquote><div><br></div><div>Right=C2=A0and I totally=C2=A0agree.</div><di=
v>Thanks=C2=A0for your input=C2=A0which always helps to better understand h=
ow this beast called bitbake works ;)</div><div><br></div><div>Jose</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Denys<br>
<br>
<br>
&gt; On Wed, Jun 1, 2022 at 2:17 AM Jose Quaresma &lt;<a href=3D"mailto:qua=
resma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=
=3D"_blank">denis@denix.org</a>&gt; escreveu no dia ter=C3=A7a, 31/05/2022<=
br>
&gt; &gt; =C3=A0(s) 20:33:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Mon, May 30, 2022 at 03:38:10PM +0100, Jose Quaresma wrote=
:<br>
&gt; &gt;&gt; &gt; Bitbake manual [1] recomends to use one TMPDIR for each =
machine:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;=C2=A0 &quot;Minimally, each configuration file must defi=
ne the machine and the<br>
&gt; &gt;&gt; &gt;=C2=A0 temporary directory BitBake uses for the build.<br=
>
&gt; &gt;&gt; &gt;=C2=A0 Suggested practice dictates that you do not overla=
p the temporary<br>
&gt; &gt;&gt; &gt;=C2=A0 directories used during the builds.&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; What specific issue are you trying to fix with this?<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; The issue that I have is in the OE-core archiver.bbclasse that do=
esn&#39;t<br>
&gt; &gt; support multiconfig when<br>
&gt; &gt; using the same TMPDIR, this because the shared recipes like gcc, =
kernel<br>
&gt; &gt;<br>
&gt; &gt; It can be replicates in kirkstone using the am64xx-evm with the f=
ollowing:<br>
&gt; &gt;<br>
&gt; &gt; # archive sources for target recipes in conf/local.conf<br>
&gt; &gt; INHERIT +=3D &quot;archiver&quot;<br>
&gt; &gt; COPYLEFT_RECIPE_TYPES =3D &quot;target&quot;<br>
&gt; &gt; ARCHIVER_MODE[src] =3D &quot;original&quot;<br>
&gt; &gt; ARCHIVER_MODE[diff] =3D &quot;1&quot;<br>
&gt; &gt;<br>
&gt; &gt; # and run bitbake with:<br>
&gt; &gt; bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c do_unpack_=
and_patch<br>
&gt; &gt; -f<br>
&gt; &gt;<br>
&gt; &gt; more info in following patch:<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/166203" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/166203</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; I&#39;m not aware of any immediate issues (because here multi=
config is used<br>
&gt; &gt;&gt; for<br>
&gt; &gt;&gt; completely separate machines and those are well isolated insi=
de the temp<br>
&gt; &gt;&gt; dir),<br>
&gt; &gt;&gt; but I see few problems this will cause down the road, so I&#3=
9;m against this<br>
&gt; &gt;&gt; change.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; What you are saying is that this change will introduce new=C2=A0 =
problems or<br>
&gt; &gt; regressions?<br>
&gt; &gt;<br>
&gt; &gt; Jose<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; [1]<br>
&gt; &gt;&gt; <a href=3D"https://docs.yoctoproject.org/bitbake/bitbake-user=
-manual/bitbake-user-manual-intro.html#executing-a-multiple-configuration-b=
uild" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/bi=
tbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-a-multip=
le-configuration-build</a><br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.=
quaresma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;=
<br>
&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;=C2=A0 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++<br>
&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt;&gt; b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt;&gt; &gt; index deb07210..0ba163ae 100644<br>
&gt; &gt;&gt; &gt; --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt;&gt; &gt; +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; &gt;&gt; &gt; @@ -3,3 +3,5 @@ MAINMACHINE :=3D &quot;${MACHINE}&quot;<=
br>
&gt; &gt;&gt; &gt;=C2=A0 DEPLOY_DIR_IMAGE =3D &quot;${DEPLOY_DIR}/images/${=
MAINMACHINE}&quot;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;=C2=A0 MACHINE:append =3D &quot;-k3r5&quot;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +TMPDIR =3D &quot;${TOPDIR}/tmp-${MACHINE}&quot;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; 2.36.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; -- <br>
&gt; Christopher Larson<br>
&gt; <a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_lar=
son@mentor.com</a>, <a href=3D"mailto:chris.larson@siemens.com" target=3D"_=
blank">chris.larson@siemens.com</a>, <a href=3D"mailto:kergoth@gmail.com" t=
arget=3D"_blank">kergoth@gmail.com</a><br>
&gt; Principal Software Engineer, Embedded Linux Solutions, Siemens Digital=
<br>
&gt; Industries Software<br>
<br>
-- <br>
Regards,<br>
Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">=
denis@denix.org</a>&gt;<br>
PGP: 0x420902729A92C964 - <a href=3D"https://denix.org/0x420902729A92C964" =
rel=3D"noreferrer" target=3D"_blank">https://denix.org/0x420902729A92C964</=
a><br>
Fingerprint: 25FC E4A5 8A72 2F69 1186=C2=A0 6D76 4209 0272 9A92 C964<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#14771): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/14771" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/14771</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/91431962/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/91431962/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">qua=
resma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000043edf705e07716b9--

