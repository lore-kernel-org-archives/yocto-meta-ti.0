Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD018EB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 09:15:18 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.8489.1688721312854592621
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 02:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YGuWhCuW;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-784f7f7deddso643264241.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688721312; x=1691313312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c9OnqZwSrxsVL7ig5CgrdegX2m+JtrSHVmtfea/PsXE=;
        b=YGuWhCuWCgE75GEXbDQTe9YBTHRr9gPEVlFu1PKi7jukawH7BGi+htGCWMqBc8Gtbb
         KdjpaAMXYnmAOAlsNySynvdRsP2eiaMQoTXLfnJfkCx8kpzAXtNK3DWJqWa3eoAcwgnZ
         I73vdsWIEDUTiNZleTMgYUw429o9QqwOkMwABN5n8s/nYya1xiB88kMruGvdSPdr1s0V
         TDQMRmLfFj7zUgdONSGgcRN92jAOZTSGdudr7FtOZTOfGRI87GcjX2fmD9bIJU0tArmx
         1x2xF0qJtNYGiyIxgaCEmq39yTpU939wcgyp1FbScuEC1dDJgXvRHRSeyCUNaySkdvL3
         Cv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688721312; x=1691313312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9OnqZwSrxsVL7ig5CgrdegX2m+JtrSHVmtfea/PsXE=;
        b=cBe/Kquaip0yl+aMmzVKQXQICtWSj4CS+kT+/thwkE9gDbFVnJe4svV+0xNH1K0yS7
         +GXhK8xpngWDi8stt7QYKrxsovwjejasn8+A5TubCqxaaP6wYh20YQjNKC9n+Jf7pGaQ
         hgNW0/CCES8Na21jmDQrSgd/z9MEA2HgUDCkq91wUK0dF1sUGPsQ4LgLGIRzPR9ybB5f
         /fwkcPbbg6aOMoYyMhpKtv/Jat1OUgfPcTtpso6BB0w/HUrLcj9QLxihNw886zYjaQ62
         blgYHAQqIsUO9VYhqgQSdgpWKSdOSfMSVWisYzCzes6jtu2CjMabfK6fVMYhajw+yrzc
         zurQ==
X-Gm-Message-State: ABy/qLaOtJlW0VlSA0pnGGXMhHcGOoQtYUZIihNZRGdaGStubHrVMXLe
	7hVJoyJ4TNUjeWNUYEXHQaommiiX8o9F50RfERg=
X-Google-Smtp-Source: APBJJlF6cKck56HYsN07Rm+vraW4OnAKERh00WjDoN2pLUNdSPwBBXHE6CpMduXUnCj4GTrHPKo1ZXpW4TXHt8nIZG4=
X-Received: by 2002:a67:fbd2:0:b0:440:b7df:767b with SMTP id
 o18-20020a67fbd2000000b00440b7df767bmr2832565vsr.11.1688721311676; Fri, 07
 Jul 2023 02:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230130152000.705123-1-jose.quaresma@foundries.io>
 <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com> <20230130171811.GJ22689@denix.org>
 <CANPvuR=x6wZ7x1kPndVuWtSTgy12+wUyw4zpzZ7SgP-OPms4Qg@mail.gmail.com>
 <CAAaKDhGj8oTZ-j-gnTfHs5Ra3d3qAYbgiSR+5YYzcvJ+wKiQXQ@mail.gmail.com>
 <CANPvuRnuzyKntNsVW_6xuLiSVdzuaHghKsqPUDMcyKajEu5O6g@mail.gmail.com> <20230706183939.GE1518@denix.org>
In-Reply-To: <20230706183939.GE1518@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 7 Jul 2023 10:14:54 +0100
Message-ID: <CANPvuRnkF+xit-M0wkwTcVtVAypbWfiuQGWhiADcUa3MAMtPXg@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5: allow
 customization by donwstream layers
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ricardo Salveti <ricardo@foundries.io>, reatmon@ti.com, meta-ti@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000e840c905ffe21162"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 09:15:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16829

--000000000000e840c905ffe21162
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia quinta, 6/07/2023 =C3=
=A0(s)
19:39:

> As you noted yourself in that thread, your patches were workarounds and
> just
> masking the actual issue w/o clearly articulating it. The actual race
> issue
> has been under investigation for quite some time and I've discussed it
> with
> Richard before. Luckily he was finally able to root-cause and fix it!
>

I have reverted my hack to unshare the tmp directory in my distro when
using the oe-core master branch
after the recent spdx changes [1] and everything seems to be okay on my
tests.
The Richard bitbake multiconfig patch to fix the licence collision is for
sure another help to use the shared tmp folder.
However on kisstone I still use the tmp unshared between machines in
multiconfig because the problems were many and
I still don't feel safe to revert to the method used on meta-ti kirkstone.

[1]
https://git.yoctoproject.org/poky/commit/meta/classes/create-spdx-2.2.bbcla=
ss?id=3D42071227f6f54055d8ac44126ab1d95f83f5b264


> BTW, I'm working on a change that I'm about to submit here, which
> indirectly
> gives you separate TMPDIR for k3r5 - stay tuned.
>

I'm looking forward to it because the hack I'm using is really ugly and I'd
like to drop it also on the kirkstone branch.

Cheers,
Jose


>
>
> On Wed, Jul 05, 2023 at 09:17:44AM +0100, Jose Quaresma wrote:
> > Just for your information there are more complaints about that issue [1=
]
> of
> > some bad side effects of sharing the TMP folder in multi configs.
> >
> > [1] https://lists.openembedded.org/g/bitbake-devel/message/14860
> >
> > Jose
> >
> > Ricardo Salveti <ricardo@foundries.io> escreveu no dia segunda,
> 30/01/2023
> > =C3=A0(s) 18:27:
> >
> > > On Mon, Jan 30, 2023 at 2:57 PM Jose Quaresma <quaresma.jose@gmail.co=
m
> >
> > > wrote:
> > > > Denys Dmytriyenko <denis@denix.org> escreveu no dia segunda,
> 30/01/2023
> > > =C3=A0(s) 17:18:
> > > >>
> > > >> On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via
> > > lists.yoctoproject.org wrote:
> > > >> >
> > > >> >
> > > >> > On 1/30/2023 9:20, Jose Quaresma wrote:
> > > >> > >This patch adds the possibility to change some bitbake variable
> > > >> > >that cannot be changed anywhere else, one of then is the TMPDIR=
.
> > > >> > >
> > > >> > >Using the same TMPDIR it is very sensitive and prone to several
> > > errors
> > > >> > >when used in more complex situations.
> > > >> > >This configuration forces that all native packages have to be t=
he
> > > same between all
> > > >> > >machines and this requirement is very easy to break.
> > > >> > >Suppose you use a macinhe override somewhere on a native recipe
> > > >>
> > > >> Even w/o multiconfig, this will break for multi-machine builds.
> Native
> > > >> packages are for the build host and have no knowledge about the
> target.
> > > >> You should probably look into cross packages instead of native one=
s
> for
> > > >> this use case.
> > > >>
> > > >> Altering native packages between different targets will cause them
> to
> > > >> rebuild, which they shouldn't. Moreover, it will mess up your ssta=
te
> > > >> and lead to weird issues down the road when trying to re-use your
> > > >> sstate mirror/cache.
> > > >
> > > > Is that the issue of rebuilding some native packages that I am
> trying to
> > > avoid.
> > > > But it is very hard to fix this in OE-core and everything else laye=
rs
> > > what happens.
> > > >
> > > > For your information I have some other issues with multiconfig and
> > > native packages
> > > > that have the source files provided on the layer. this two recipes
> don't
> > > work with the
> > > > rm_work bbclass because the in one of the machines
> > > > texinfo-dummy-native gettext-minimal-native
> > > >
> > > > Another issue is that sometimes one of the machines uses the
> > > SOURCE_DATE_EPOCH_FALLBACK
> > > > and the other uses  SOURCE_DATE_EPOCH and this also triggers a
> rebuild
> > > of one of the machines.
> > > >
> > > > Recently a new issue with the rm_work and the spdx
> > > > comes in
> > > https://lists.openembedded.org/g/openembedded-core/message/174276
> > > > where I have the steps to reproduce.
> > > >
> > > > All of these issues can be solved easily with TMDIR for each machin=
e,
> > > > but because I understand it can be invasive I submit this patch tha=
t
> > > doesn't change anything
> > > > in meta-ti but can add the possibility to use a different TMPDIR fo=
r
> > > each machine.
> > > >
> > > > A different TMPDIR for each machine is also referenced in the
> official
> > > documentation
> > > > "Minimally, each configuration file must define the machine and the
> > > temporary directory BitBake uses for the build. Suggested practice
> dictates
> > > that you do not overlap the temporary directories used during the
> builds."
> > > >
> > >
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-intro.html#executing-a-multiple-configuration-build
> > > >
> > > >> > >and this requirement is no longer met.
> > > >> > >Many of these anomalies can be verified with the use of the
> rm_work
> > > and
> > > >> > >create-spdx bitbake classes.
> > > >> > >
> > > >> > >A previous attempt [1] had already been made but was refused
> > > >> > >but this way it can be done without side effects for other user=
s.
> > > >> > >
> > > >> > >[1] https://lists.yoctoproject.org/g/meta-ti/message/14767
> > > >> >
> > > >> >
> > > >> > So the difference between this patch and the previous one, is th=
at
> > > >> > you are now included a file that is not there normally so that y=
ou
> > > >> > can put the contents of the previous patch in the new include fi=
le
> > > >> > to get around the issue in the archiver.
> > > >
> > > > The archiver issue is fixed but it will be very easy to break again=
.
> > > > Myself recently broke it again so I added a test to help there
> > > >
> > >
> https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c532d97=
a44120346b5edd
> > > >
> > > >> >
> > > >> > I'm not saying I'm opposed to this approach (yet), I'm just tryi=
ng
> > > >> > to understand the entire story.
> > > >> >
> > > >> > Did you find anything in looking at fixing the archiver to bette=
r
> > > >> > support the multi-config issue?
> > > >
> > > > The issue now is different and is related with spdx and rm_work
> > > > https://lists.openembedded.org/g/openembedded-core/message/174276
> > > >
> > > > With this patch I can set a new TMPDIR folder for each machine and
> > > > can build successfully.
> > >
> > > If you don't have spdx enabled then these sort of issues happen less
> > > often, but after the above patch was merged in oe-core (and also
> > > backported to kirkstone), we cannot build multiconfig targets from
> > > meta-ti anymore with spdx enabled.
> > >
> > > This is special to spdx because of the way the task dependencies are
> > > done, which requires it to be executed before rm_work. This is OK whe=
n
> > > a machine specific TMPDIR is used and explodes quite quickly (due
> > > races) when sharing TMPDIR because of the parallel rm_work tasks that
> > > end up removing stuff that is still required by other parallel tasks.
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e840c905ffe21162
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; escreveu no dia quinta, 6/07/20=
23 =C3=A0(s) 19:39:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">As you noted yourself in that thread, your patches were workarounds and=
 just <br>
masking the actual issue w/o clearly articulating it. The actual race issue=
 <br>
has been under investigation for quite some time and I&#39;ve discussed it =
with <br>
Richard before. Luckily he was finally able to root-cause and fix it!<br></=
blockquote><div><br>I have reverted my hack to unshare the tmp directory in=
 my distro when using the oe-core master branch</div><div>after the recent =
spdx changes [1] and everything seems to be okay on my tests.<br>The=C2=A0R=
ichard bitbake multiconfig patch to fix the=C2=A0licence collision is for s=
ure another help to use the shared tmp folder.</div><div>However on kisston=
e I still use the tmp unshared between=C2=A0machines in multiconfig because=
 the problems were many and=C2=A0</div><div>I still don&#39;t feel safe to =
revert to the method used on meta-ti kirkstone.</div><div><br>[1] <a href=
=3D"https://git.yoctoproject.org/poky/commit/meta/classes/create-spdx-2.2.b=
bclass?id=3D42071227f6f54055d8ac44126ab1d95f83f5b264">https://git.yoctoproj=
ect.org/poky/commit/meta/classes/create-spdx-2.2.bbclass?id=3D42071227f6f54=
055d8ac44126ab1d95f83f5b264</a><br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
BTW, I&#39;m working on a change that I&#39;m about to submit here, which i=
ndirectly <br>
gives you separate TMPDIR for k3r5 - stay tuned.<br></blockquote><div><br>I=
&#39;m looking forward to it because the hack I&#39;m using is really ugly =
and I&#39;d like to drop it also on=C2=A0the kirkstone=C2=A0branch.<br><br>=
<span style=3D"color:rgb(0,0,0)">Cheers,</span><font color=3D"#888888"><br>=
</font>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
On Wed, Jul 05, 2023 at 09:17:44AM +0100, Jose Quaresma wrote:<br>
&gt; Just for your information there are more complaints about that issue [=
1] of<br>
&gt; some bad side effects of sharing the TMP folder in multi configs.<br>
&gt; <br>
&gt; [1] <a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/=
14860" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/bitbake-devel/message/14860</a><br>
&gt; <br>
&gt; Jose<br>
&gt; <br>
&gt; Ricardo Salveti &lt;<a href=3D"mailto:ricardo@foundries.io" target=3D"=
_blank">ricardo@foundries.io</a>&gt; escreveu no dia segunda, 30/01/2023<br=
>
&gt; =C3=A0(s) 18:27:<br>
&gt; <br>
&gt; &gt; On Mon, Jan 30, 2023 at 2:57 PM Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&g=
t;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" tar=
get=3D"_blank">denis@denix.org</a>&gt; escreveu no dia segunda, 30/01/2023<=
br>
&gt; &gt; =C3=A0(s) 17:18:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon vi=
a<br>
&gt; &gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; On 1/30/2023 9:20, Jose Quaresma wrote:<br>
&gt; &gt; &gt;&gt; &gt; &gt;This patch adds the possibility to change some =
bitbake variable<br>
&gt; &gt; &gt;&gt; &gt; &gt;that cannot be changed anywhere else, one of th=
en is the TMPDIR.<br>
&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt;Using the same TMPDIR it is very sensitive and =
prone to several<br>
&gt; &gt; errors<br>
&gt; &gt; &gt;&gt; &gt; &gt;when used in more complex situations.<br>
&gt; &gt; &gt;&gt; &gt; &gt;This configuration forces that all native packa=
ges have to be the<br>
&gt; &gt; same between all<br>
&gt; &gt; &gt;&gt; &gt; &gt;machines and this requirement is very easy to b=
reak.<br>
&gt; &gt; &gt;&gt; &gt; &gt;Suppose you use a macinhe override somewhere on=
 a native recipe<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Even w/o multiconfig, this will break for multi-machine =
builds. Native<br>
&gt; &gt; &gt;&gt; packages are for the build host and have no knowledge ab=
out the target.<br>
&gt; &gt; &gt;&gt; You should probably look into cross packages instead of =
native ones for<br>
&gt; &gt; &gt;&gt; this use case.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Altering native packages between different targets will =
cause them to<br>
&gt; &gt; &gt;&gt; rebuild, which they shouldn&#39;t. Moreover, it will mes=
s up your sstate<br>
&gt; &gt; &gt;&gt; and lead to weird issues down the road when trying to re=
-use your<br>
&gt; &gt; &gt;&gt; sstate mirror/cache.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is that the issue of rebuilding some native packages that I =
am trying to<br>
&gt; &gt; avoid.<br>
&gt; &gt; &gt; But it is very hard to fix this in OE-core and everything el=
se layers<br>
&gt; &gt; what happens.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For your information I have some other issues with multiconf=
ig and<br>
&gt; &gt; native packages<br>
&gt; &gt; &gt; that have the source files provided on the layer. this two r=
ecipes don&#39;t<br>
&gt; &gt; work with the<br>
&gt; &gt; &gt; rm_work bbclass because the in one of the machines<br>
&gt; &gt; &gt; texinfo-dummy-native gettext-minimal-native<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Another issue is that sometimes one of the machines uses the=
<br>
&gt; &gt; SOURCE_DATE_EPOCH_FALLBACK<br>
&gt; &gt; &gt; and the other uses=C2=A0 SOURCE_DATE_EPOCH and this also tri=
ggers a rebuild<br>
&gt; &gt; of one of the machines.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Recently a new issue with the rm_work and the spdx<br>
&gt; &gt; &gt; comes in<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/174276" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/174276</a><br>
&gt; &gt; &gt; where I have the steps to reproduce.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; All of these issues can be solved easily with TMDIR for each=
 machine,<br>
&gt; &gt; &gt; but because I understand it can be invasive I submit this pa=
tch that<br>
&gt; &gt; doesn&#39;t change anything<br>
&gt; &gt; &gt; in meta-ti but can add the possibility to use a different TM=
PDIR for<br>
&gt; &gt; each machine.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; A different TMPDIR for each machine is also referenced in th=
e official<br>
&gt; &gt; documentation<br>
&gt; &gt; &gt; &quot;Minimally, each configuration file must define the mac=
hine and the<br>
&gt; &gt; temporary directory BitBake uses for the build. Suggested practic=
e dictates<br>
&gt; &gt; that you do not overlap the temporary directories used during the=
 builds.&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://docs.yoctoproject.org/bitbake/bitbake-user-man=
ual/bitbake-user-manual-intro.html#executing-a-multiple-configuration-build=
" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/bitbak=
e/bitbake-user-manual/bitbake-user-manual-intro.html#executing-a-multiple-c=
onfiguration-build</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt;and this requirement is no longer met.<br>
&gt; &gt; &gt;&gt; &gt; &gt;Many of these anomalies can be verified with th=
e use of the rm_work<br>
&gt; &gt; and<br>
&gt; &gt; &gt;&gt; &gt; &gt;create-spdx bitbake classes.<br>
&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt;A previous attempt [1] had already been made bu=
t was refused<br>
&gt; &gt; &gt;&gt; &gt; &gt;but this way it can be done without side effect=
s for other users.<br>
&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt;[1] <a href=3D"https://lists.yoctoproject.org/g=
/meta-ti/message/14767" rel=3D"noreferrer" target=3D"_blank">https://lists.=
yoctoproject.org/g/meta-ti/message/14767</a><br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; So the difference between this patch and the previo=
us one, is that<br>
&gt; &gt; &gt;&gt; &gt; you are now included a file that is not there norma=
lly so that you<br>
&gt; &gt; &gt;&gt; &gt; can put the contents of the previous patch in the n=
ew include file<br>
&gt; &gt; &gt;&gt; &gt; to get around the issue in the archiver.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The archiver issue is fixed but it will be very easy to brea=
k again.<br>
&gt; &gt; &gt; Myself recently broke it again so I added a test to help the=
re<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3Db5baa7d=
c8bd1c0d2d78c532d97a44120346b5edd" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c532d97a4412=
0346b5edd</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; I&#39;m not saying I&#39;m opposed to this approach=
 (yet), I&#39;m just trying<br>
&gt; &gt; &gt;&gt; &gt; to understand the entire story.<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; Did you find anything in looking at fixing the arch=
iver to better<br>
&gt; &gt; &gt;&gt; &gt; support the multi-config issue?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The issue now is different and is related with spdx and rm_w=
ork<br>
&gt; &gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/message/174276" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/message/174276</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; With this patch I can set a new TMPDIR folder for each machi=
ne and<br>
&gt; &gt; &gt; can build successfully.<br>
&gt; &gt;<br>
&gt; &gt; If you don&#39;t have spdx enabled then these sort of issues happ=
en less<br>
&gt; &gt; often, but after the above patch was merged in oe-core (and also<=
br>
&gt; &gt; backported to kirkstone), we cannot build multiconfig targets fro=
m<br>
&gt; &gt; meta-ti anymore with spdx enabled.<br>
&gt; &gt;<br>
&gt; &gt; This is special to spdx because of the way the task dependencies =
are<br>
&gt; &gt; done, which requires it to be executed before rm_work. This is OK=
 when<br>
&gt; &gt; a machine specific TMPDIR is used and explodes quite quickly (due=
<br>
&gt; &gt; races) when sharing TMPDIR because of the parallel rm_work tasks =
that<br>
&gt; &gt; end up removing stuff that is still required by other parallel ta=
sks.<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000e840c905ffe21162--

