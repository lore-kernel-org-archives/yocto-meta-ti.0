Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF65EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 08:18:05 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.12250.1688545076289707641
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 01:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Wg7mBwkS;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-794d1714617so679243241.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 01:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688545075; x=1691137075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NBlkX7BAm9GJyYRKRcSmfqgIchBCWenX8j0FBOKdL7c=;
        b=Wg7mBwkS9tisgPd/LQlwup4B3fshB7LnVlVSnJYIyk7pJv5I4e244ku+Bu6jnRCRmq
         gKaUj9HK9tYAYVt3Fw/Jr0Vl/58TgY5kis/ty0gMf0BNC8Y4uqQWsx/d7dTcRp+bnUlk
         Cx89JDwuYzxGhe7dyst3XUdsfFRrDvWiJcpRIoiJJTcleIy5DhQwzOfX9bV1+fIQuBjd
         zkbYNZb/d1d932i5WNjiq/IPMpbbOTU7DdsadaXkx1RpzoEj4780vicWmbgdKkcs7wWL
         im2QRf00d5qIEdYy6rExoqabFrqo1jMpk3CcrUt7cWdCfGyZ3B6wrrWR0aSMjL+Sqrdt
         In1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688545075; x=1691137075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBlkX7BAm9GJyYRKRcSmfqgIchBCWenX8j0FBOKdL7c=;
        b=e4UTnPnCJDV8zxK4diCr5viExmUpcrzQFALlwSrkQXQRs1+zyF6ocEKQEVPU/cc6yB
         S3vEfHPkmkwf0ebwOHXPPakkuCNM3tAb67bbZx7A9Gf6YnnOeTwN25wJvAblKEvRTl+P
         OMwSgWjMB92iuH8FI3mB3VL3HF5QTyTNlvFrwszpC7cGieh/OgoC29yNLMSXPQl/hs8y
         jXmlrrYlG1LJS9c6iFRRmIK6sqVb0MDylfsdFQdgJojEXpsGafKqOadseVhvYEyUNoik
         bn9fUYW3mTXlGqjw9QdJnZdxhOSDKGnpmgMtKpt4lYGieergS0f+Y5H+EyjVmNBJRDeY
         197g==
X-Gm-Message-State: ABy/qLZKjKYt05zKEZlm2xXVCCzV4LUtwe5b4McQzy6s4n/fXE5FBSub
	qYqAiUrPS+e3fRcZhxiQ1MG2mGd56pg+XVWa5fc=
X-Google-Smtp-Source: APBJJlFDKaB8JZYcGBj8cFGXuzFiNnOWKVMHoFTeLeDE7W9S3hDm+ifvWCp38fmBVJ/YRqhrjWTsBB10EUrIapQInaE=
X-Received: by 2002:a05:6102:274c:b0:444:c7fa:1aad with SMTP id
 p12-20020a056102274c00b00444c7fa1aadmr6739209vsu.17.1688545075092; Wed, 05
 Jul 2023 01:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230130152000.705123-1-jose.quaresma@foundries.io>
 <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com> <20230130171811.GJ22689@denix.org>
 <CANPvuR=x6wZ7x1kPndVuWtSTgy12+wUyw4zpzZ7SgP-OPms4Qg@mail.gmail.com> <CAAaKDhGj8oTZ-j-gnTfHs5Ra3d3qAYbgiSR+5YYzcvJ+wKiQXQ@mail.gmail.com>
In-Reply-To: <CAAaKDhGj8oTZ-j-gnTfHs5Ra3d3qAYbgiSR+5YYzcvJ+wKiQXQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 5 Jul 2023 09:17:44 +0100
Message-ID: <CANPvuRnuzyKntNsVW_6xuLiSVdzuaHghKsqPUDMcyKajEu5O6g@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5: allow
 customization by donwstream layers
To: Ricardo Salveti <ricardo@foundries.io>
Cc: Denys Dmytriyenko <denis@denix.org>, reatmon@ti.com, meta-ti@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000063616105ffb909ce"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 08:18:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16811

--00000000000063616105ffb909ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just for your information there are more complaints about that issue [1] of
some bad side effects of sharing the TMP folder in multi configs.

[1] https://lists.openembedded.org/g/bitbake-devel/message/14860

Jose

Ricardo Salveti <ricardo@foundries.io> escreveu no dia segunda, 30/01/2023
=C3=A0(s) 18:27:

> On Mon, Jan 30, 2023 at 2:57 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> > Denys Dmytriyenko <denis@denix.org> escreveu no dia segunda, 30/01/2023
> =C3=A0(s) 17:18:
> >>
> >> On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via
> lists.yoctoproject.org wrote:
> >> >
> >> >
> >> > On 1/30/2023 9:20, Jose Quaresma wrote:
> >> > >This patch adds the possibility to change some bitbake variable
> >> > >that cannot be changed anywhere else, one of then is the TMPDIR.
> >> > >
> >> > >Using the same TMPDIR it is very sensitive and prone to several
> errors
> >> > >when used in more complex situations.
> >> > >This configuration forces that all native packages have to be the
> same between all
> >> > >machines and this requirement is very easy to break.
> >> > >Suppose you use a macinhe override somewhere on a native recipe
> >>
> >> Even w/o multiconfig, this will break for multi-machine builds. Native
> >> packages are for the build host and have no knowledge about the target=
.
> >> You should probably look into cross packages instead of native ones fo=
r
> >> this use case.
> >>
> >> Altering native packages between different targets will cause them to
> >> rebuild, which they shouldn't. Moreover, it will mess up your sstate
> >> and lead to weird issues down the road when trying to re-use your
> >> sstate mirror/cache.
> >
> > Is that the issue of rebuilding some native packages that I am trying t=
o
> avoid.
> > But it is very hard to fix this in OE-core and everything else layers
> what happens.
> >
> > For your information I have some other issues with multiconfig and
> native packages
> > that have the source files provided on the layer. this two recipes don'=
t
> work with the
> > rm_work bbclass because the in one of the machines
> > texinfo-dummy-native gettext-minimal-native
> >
> > Another issue is that sometimes one of the machines uses the
> SOURCE_DATE_EPOCH_FALLBACK
> > and the other uses  SOURCE_DATE_EPOCH and this also triggers a rebuild
> of one of the machines.
> >
> > Recently a new issue with the rm_work and the spdx
> > comes in
> https://lists.openembedded.org/g/openembedded-core/message/174276
> > where I have the steps to reproduce.
> >
> > All of these issues can be solved easily with TMDIR for each machine,
> > but because I understand it can be invasive I submit this patch that
> doesn't change anything
> > in meta-ti but can add the possibility to use a different TMPDIR for
> each machine.
> >
> > A different TMPDIR for each machine is also referenced in the official
> documentation
> > "Minimally, each configuration file must define the machine and the
> temporary directory BitBake uses for the build. Suggested practice dictat=
es
> that you do not overlap the temporary directories used during the builds.=
"
> >
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-intro.html#executing-a-multiple-configuration-build
> >
> >> > >and this requirement is no longer met.
> >> > >Many of these anomalies can be verified with the use of the rm_work
> and
> >> > >create-spdx bitbake classes.
> >> > >
> >> > >A previous attempt [1] had already been made but was refused
> >> > >but this way it can be done without side effects for other users.
> >> > >
> >> > >[1] https://lists.yoctoproject.org/g/meta-ti/message/14767
> >> >
> >> >
> >> > So the difference between this patch and the previous one, is that
> >> > you are now included a file that is not there normally so that you
> >> > can put the contents of the previous patch in the new include file
> >> > to get around the issue in the archiver.
> >
> > The archiver issue is fixed but it will be very easy to break again.
> > Myself recently broke it again so I added a test to help there
> >
> https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c532d97=
a44120346b5edd
> >
> >> >
> >> > I'm not saying I'm opposed to this approach (yet), I'm just trying
> >> > to understand the entire story.
> >> >
> >> > Did you find anything in looking at fixing the archiver to better
> >> > support the multi-config issue?
> >
> > The issue now is different and is related with spdx and rm_work
> > https://lists.openembedded.org/g/openembedded-core/message/174276
> >
> > With this patch I can set a new TMPDIR folder for each machine and
> > can build successfully.
>
> If you don't have spdx enabled then these sort of issues happen less
> often, but after the above patch was merged in oe-core (and also
> backported to kirkstone), we cannot build multiconfig targets from
> meta-ti anymore with spdx enabled.
>
> This is special to spdx because of the way the task dependencies are
> done, which requires it to be executed before rm_work. This is OK when
> a machine specific TMPDIR is used and explodes quite quickly (due
> races) when sharing TMPDIR because of the parallel rm_work tasks that
> end up removing stuff that is still required by other parallel tasks.
>
> Cheers,
> --
> Ricardo Salveti
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000063616105ffb909ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just for your information there are more complaints a=
bout that issue [1]=C2=A0of some bad side effects of sharing the TMP folder=
 in multi configs.</div><div><br>[1] <a href=3D"https://lists.openembedded.=
org/g/bitbake-devel/message/14860">https://lists.openembedded.org/g/bitbake=
-devel/message/14860</a><br></div><div><br></div><div>Jose</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ricardo Salveti &=
lt;<a href=3D"mailto:ricardo@foundries.io">ricardo@foundries.io</a>&gt; esc=
reveu no dia segunda, 30/01/2023 =C3=A0(s) 18:27:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Mon, Jan 30, 2023 at 2:57 PM Jose Quar=
esma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quare=
sma.jose@gmail.com</a>&gt; wrote:<br>
&gt; Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_bl=
ank">denis@denix.org</a>&gt; escreveu no dia segunda, 30/01/2023 =C3=A0(s) =
17:18:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via <a href=
=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.yoctoproject.org</a> wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 1/30/2023 9:20, Jose Quaresma wrote:<br>
&gt;&gt; &gt; &gt;This patch adds the possibility to change some bitbake va=
riable<br>
&gt;&gt; &gt; &gt;that cannot be changed anywhere else, one of then is the =
TMPDIR.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;Using the same TMPDIR it is very sensitive and prone to s=
everal errors<br>
&gt;&gt; &gt; &gt;when used in more complex situations.<br>
&gt;&gt; &gt; &gt;This configuration forces that all native packages have t=
o be the same between all<br>
&gt;&gt; &gt; &gt;machines and this requirement is very easy to break.<br>
&gt;&gt; &gt; &gt;Suppose you use a macinhe override somewhere on a native =
recipe<br>
&gt;&gt;<br>
&gt;&gt; Even w/o multiconfig, this will break for multi-machine builds. Na=
tive<br>
&gt;&gt; packages are for the build host and have no knowledge about the ta=
rget.<br>
&gt;&gt; You should probably look into cross packages instead of native one=
s for<br>
&gt;&gt; this use case.<br>
&gt;&gt;<br>
&gt;&gt; Altering native packages between different targets will cause them=
 to<br>
&gt;&gt; rebuild, which they shouldn&#39;t. Moreover, it will mess up your =
sstate<br>
&gt;&gt; and lead to weird issues down the road when trying to re-use your<=
br>
&gt;&gt; sstate mirror/cache.<br>
&gt;<br>
&gt; Is that the issue of rebuilding some native packages that I am trying =
to avoid.<br>
&gt; But it is very hard to fix this in OE-core and everything else layers =
what happens.<br>
&gt;<br>
&gt; For your information I have some other issues with multiconfig and nat=
ive packages<br>
&gt; that have the source files provided on the layer. this two recipes don=
&#39;t work with the<br>
&gt; rm_work bbclass because the in one of the machines<br>
&gt; texinfo-dummy-native gettext-minimal-native<br>
&gt;<br>
&gt; Another issue is that sometimes one of the machines uses the SOURCE_DA=
TE_EPOCH_FALLBACK<br>
&gt; and the other uses=C2=A0 SOURCE_DATE_EPOCH and this also triggers a re=
build of one of the machines.<br>
&gt;<br>
&gt; Recently a new issue with the rm_work and the spdx<br>
&gt; comes in <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/message/174276" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/message/174276</a><br>
&gt; where I have the steps to reproduce.<br>
&gt;<br>
&gt; All of these issues can be solved easily with TMDIR for each machine,<=
br>
&gt; but because I understand it can be invasive I submit this patch that d=
oesn&#39;t change anything<br>
&gt; in meta-ti but can add the possibility to use a different TMPDIR for e=
ach machine.<br>
&gt;<br>
&gt; A different TMPDIR for each machine is also referenced in the official=
 documentation<br>
&gt; &quot;Minimally, each configuration file must define the machine and t=
he temporary directory BitBake uses for the build. Suggested practice dicta=
tes that you do not overlap the temporary directories used during the build=
s.&quot;<br>
&gt; <a href=3D"https://docs.yoctoproject.org/bitbake/bitbake-user-manual/b=
itbake-user-manual-intro.html#executing-a-multiple-configuration-build" rel=
=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake/bit=
bake-user-manual/bitbake-user-manual-intro.html#executing-a-multiple-config=
uration-build</a><br>
&gt;<br>
&gt;&gt; &gt; &gt;and this requirement is no longer met.<br>
&gt;&gt; &gt; &gt;Many of these anomalies can be verified with the use of t=
he rm_work and<br>
&gt;&gt; &gt; &gt;create-spdx bitbake classes.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;A previous attempt [1] had already been made but was refu=
sed<br>
&gt;&gt; &gt; &gt;but this way it can be done without side effects for othe=
r users.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;[1] <a href=3D"https://lists.yoctoproject.org/g/meta-ti/m=
essage/14767" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-ti/message/14767</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; So the difference between this patch and the previous one, is=
 that<br>
&gt;&gt; &gt; you are now included a file that is not there normally so tha=
t you<br>
&gt;&gt; &gt; can put the contents of the previous patch in the new include=
 file<br>
&gt;&gt; &gt; to get around the issue in the archiver.<br>
&gt;<br>
&gt; The archiver issue is fixed but it will be very easy to break again.<b=
r>
&gt; Myself recently broke it again so I added a test to help there<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1=
c0d2d78c532d97a44120346b5edd" rel=3D"noreferrer" target=3D"_blank">https://=
git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c532d97a44120346b=
5edd</a><br>
&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m not saying I&#39;m opposed to this approach (yet), I&=
#39;m just trying<br>
&gt;&gt; &gt; to understand the entire story.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Did you find anything in looking at fixing the archiver to be=
tter<br>
&gt;&gt; &gt; support the multi-config issue?<br>
&gt;<br>
&gt; The issue now is different and is related with spdx and rm_work<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
174276" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/174276</a><br>
&gt;<br>
&gt; With this patch I can set a new TMPDIR folder for each machine and<br>
&gt; can build successfully.<br>
<br>
If you don&#39;t have spdx enabled then these sort of issues happen less<br=
>
often, but after the above patch was merged in oe-core (and also<br>
backported to kirkstone), we cannot build multiconfig targets from<br>
meta-ti anymore with spdx enabled.<br>
<br>
This is special to spdx because of the way the task dependencies are<br>
done, which requires it to be executed before rm_work. This is OK when<br>
a machine specific TMPDIR is used and explodes quite quickly (due<br>
races) when sharing TMPDIR because of the parallel rm_work tasks that<br>
end up removing stuff that is still required by other parallel tasks.<br>
<br>
Cheers,<br>
-- <br>
Ricardo Salveti<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000063616105ffb909ce--

