Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7921C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 16:52:36 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web10.93104.1673628748273521852
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 08:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k+UTyyXQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id z190so10452095vka.4
        for <meta-ti@lists.yoctoproject.org>; Fri, 13 Jan 2023 08:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0BAQd9gb16i962BzuGJ2FYzEog0xdkB8cIJKd9we+c4=;
        b=k+UTyyXQC7fTjVVHNhD9TsG9J3rTyPkVNE07iyoEzN9YkSRsgJJBMkdVvksCfsTh20
         tfMqzZq0Ncz3uhdjG3fhIQRECd6HRMDBwFUNBY9+5yzFywcMIOaUx8TPey1LsJ11wIEx
         1yyRi2tMTrDR1trv0L7B0u3LsBDNGdZ0yXl4uvEn8xtQbS+FG6Ie1TzrDa05P/I0F8ha
         PWFroeESG3EvRsGFaRQgOxs22s+NJrDHdLROad3BJTjFG9WRE6mgpsb9GExEkaLgw7zq
         1GCjp56Y+ZYfa5yUfisGmh7TY33XLzudELclrCYT/41+RTe54OgXh4cQtaM4nawYsJ0f
         NqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BAQd9gb16i962BzuGJ2FYzEog0xdkB8cIJKd9we+c4=;
        b=ao1b8EFlXDhGGkNgc487dL0GlYKpRK72hgiIie2rQ00vygIyv5UKDpJurUY+1E9pKy
         Jo4sOaSmWBF6+lczMw081LDiBD++Mw3IIgWKZtxpvDLV6w8yxbfs/ueoWCtpa9RjGuCb
         svu6ek0IuJfLbv4Sc1ndWMlnoyV3P8W33PZikMttckzkRlHPqIqYVU8yG72IWC7aOPQX
         ntph540pF2zF24S/3uKvwcvp/QNVra8j7nKuCNRG6SAKR2puaYIxUUNnFS0x008psR4s
         Nh8QjIeGOXmiQqQ2FzHk4aObSy9mMhKrFDVYhW8nQkSUZP71r/4JYxdT9OnZW9tAcXUi
         KpjQ==
X-Gm-Message-State: AFqh2kpfHbLnzbNtjHNJ51uAeq2cuO+U5iyWI+kR7/obbg4HFLifK7ye
	EjAS6n8TkXMBektQCzVnEil3CaWggfWyY519xwo=
X-Google-Smtp-Source: AMrXdXvvTdQrLOjTiVMYSNNIDaIP9CBjHF/mR0HuVpb84wWtA8Jj5QjA0CFen70KvJjEXiKXWefZE8ZR+vHgkxQ715M=
X-Received: by 2002:a1f:2696:0:b0:3ab:52b4:8c08 with SMTP id
 m144-20020a1f2696000000b003ab52b48c08mr10579112vkm.9.1673628747209; Fri, 13
 Jan 2023 08:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20221213183818.206660-1-jose.quaresma@foundries.io>
 <17306E4919830D85.9432@lists.yoctoproject.org> <CANPvuRmgtz2dJARawU8GBi=2_8o6qGbVL9vUAtRS78_1=ORHmQ@mail.gmail.com>
 <17373675ABC771C1.27663@lists.yoctoproject.org> <20230110233843.GT22689@denix.org>
 <1739398CFDAA7E61.25137@lists.yoctoproject.org>
In-Reply-To: <1739398CFDAA7E61.25137@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 13 Jan 2023 16:52:16 +0000
Message-ID: <CANPvuR=QX=g4yqKUSAXT+w=jXZqkbDqJOeP2LnmyhyvmcKqS3g@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH 2/2] optee-os: add back allow-setting-sysroot-for-libgcc-lookup.patch
To: quaresma.jose@gmail.com
Cc: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000f6a1f205f2280eda"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Jan 2023 16:52:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15564

--000000000000f6a1f205f2280eda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Should meta-ti build also with OE default toolchain and without meta-arago
or not?

Jose

Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
gmail.com@lists.yoctoproject.org> escreveu no dia quarta, 11/01/2023 =C3=A0=
(s)
10:13:

>
>
> Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=C3=A7a, 10/01/202=
3
> =C3=A0(s) 23:39:
>
>> Ok, this is not specific to the host OS.
>>
>> It is toolchain-specific though - it doesn't fail with the external Arm
>> toolchain, but fails with the toolchain built by OE, i.e. Poky, etc.
>>
>
> So this can be the reason to build with meta-arago and not without it.
> Thanks for looking at this.
>
> Jose
>
>
>>
>> On Wed, Jan 04, 2023 at 03:54:05PM -0500, Denys Dmytriyenko wrote:
>> > Not being able to reproduce the issue here:
>> >
>> > $ MACHINE=3Dam64xx-evm bitbake optee-os
>> >
>> > Builds just fine.
>> >
>> > Any more pointers - host OS/version, etc? I'm building Dunfell in
>> Ubuntu 18.04
>> > container, but can try a newer one if that's the culprit.
>> >
>> >
>> > On Wed, Jan 04, 2023 at 07:18:50PM +0000, Jose Quaresma wrote:
>> > > Friendly ping :)
>> > >
>> > > thanks
>> > >
>> > > Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
>> > > gmail.com@lists.yoctoproject.org> escreveu no dia ter=C3=A7a, 13/12/=
2022
>> =C3=A0(s)
>> > > 18:38:
>> > >
>> > > > f8182afd optee: Upgrade to upstream 3.17.0
>> > > > removes this patch but this is still required
>> > > >
>> > > > Currently building with am62xx-evm/am64xx-evm machine fails with:
>> > > >
>> > > > | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or
>> > > > directory
>> > > > | make: *** [ldelf/link.mk:60: out/arm-plat-k3/ldelf/ldelf.elf]
>> Error 1
>> > > > | make: *** Waiting for unfinished jobs....
>> > > >
>> > > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > > > ---
>> > > >  ...ow-setting-sysroot-for-libgcc-lookup.patch | 34
>> +++++++++++++++++++
>> > > >  recipes-security/optee/optee-os_%.bbappend    |  6 +++-
>> > > >  2 files changed, 39 insertions(+), 1 deletion(-)
>> > > >  create mode 100644
>> > > >
>> recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lo=
okup.patch
>> > > >
>> > > > diff --git
>> > > >
>> a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-=
lookup.patch
>> > > >
>> b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-=
lookup.patch
>> > > > new file mode 100644
>> > > > index 00000000..17005396
>> > > > --- /dev/null
>> > > > +++
>> > > >
>> b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-=
lookup.patch
>> > > > @@ -0,0 +1,34 @@
>> > > > +From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00
>> 2001
>> > > > +From: Ross Burton <ross.burton@arm.com>
>> > > > +Date: Tue, 26 May 2020 14:38:02 -0500
>> > > > +Subject: [PATCH] allow setting sysroot for libgcc lookup
>> > > > +
>> > > > +Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable wh=
en
>> > > > searching
>> > > > +for the compiler libraries as there's no easy way to reliably pas=
s
>> > > > --sysroot
>> > > > +otherwise.
>> > > > +
>> > > > +Upstream-Status: Pending [
>> https://github.com/OP-TEE/optee_os/issues/4188]
>> > > > +Signed-off-by: Ross Burton <ross.burton@arm.com>
>> > > > +---
>> > > > + mk/gcc.mk | 6 +++---
>> > > > + 1 file changed, 3 insertions(+), 3 deletions(-)
>> > > > +
>> > > > +diff --git a/mk/gcc.mk b/mk/gcc.mk
>> > > > +index adc77a24..81bfa78a 100644
>> > > > +--- a/mk/gcc.mk
>> > > > ++++ b/mk/gcc.mk
>> > > > +@@ -13,11 +13,11 @@ nostdinc$(sm)      :=3D -nostdinc -isystem
>> $(shell
>> > > > $(CC$(sm)) \
>> > > > +                       -print-file-name=3Dinclude 2> /dev/null)
>> > > > +
>> > > > + # Get location of libgcc from gcc
>> > > > +-libgcc$(sm)   :=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))=
) \
>> > > > ++libgcc$(sm)   :=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS)
>> > > > $(CFLAGS$(arch-bits-$(sm))) \
>> > > > +                       -print-libgcc-file-name 2> /dev/null)
>> > > > +-libstdc++$(sm)        :=3D $(shell $(CXX$(sm))
>> > > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>> > > > ++libstdc++$(sm)        :=3D $(shell $(CXX$(sm))
>> $(LIBGCC_LOCATE_CFLAGS)
>> > > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>> > > > +                       -print-file-name=3Dlibstdc++.a 2> /dev/nul=
l)
>> > > > +-libgcc_eh$(sm)        :=3D $(shell $(CXX$(sm))
>> > > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>> > > > ++libgcc_eh$(sm)        :=3D $(shell $(CXX$(sm))
>> $(LIBGCC_LOCATE_CFLAGS)
>> > > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
>> > > > +                       -print-file-name=3Dlibgcc_eh.a 2> /dev/nul=
l)
>> > > > +
>> > > > + # Define these to something to discover accidental use
>> > > > diff --git a/recipes-security/optee/optee-os_%.bbappend
>> > > > b/recipes-security/optee/optee-os_%.bbappend
>> > > > index 751dc3d0..e8af0124 100644
>> > > > --- a/recipes-security/optee/optee-os_%.bbappend
>> > > > +++ b/recipes-security/optee/optee-os_%.bbappend
>> > > > @@ -1,6 +1,10 @@
>> > > > +FILESEXTRAPATHS_prepend_ti-soc :=3D "${THISDIR}/${PN}:"
>> > > > +
>> > > >  PV_ti-soc =3D "3.19.0+git${SRCPV}"
>> > > >  SRCREV_ti-soc =3D "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
>> > > > -SRC_URI_ti-soc =3D "git://
>> github.com/OP-TEE/optee_os.git;protocol=3Dhttps"
>> > > > +SRC_URI_ti-soc =3D "git://
>> github.com/OP-TEE/optee_os.git;protocol=3Dhttps \
>> > > > +    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
>> > > > +"
>> > > >
>> > > >  DEPENDS_append_ti-soc =3D " python3-cryptography-native"
>> > > >
>> > > > --
>> > > > 2.38.2
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
> View/Reply Online (#15546):
> https://lists.yoctoproject.org/g/meta-ti/message/15546
> Mute This Topic: https://lists.yoctoproject.org/mt/96057453/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f6a1f205f2280eda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"color:rgb(0,0,0)">Should me=
ta-ti build also with OE default=C2=A0toolchain and without meta-arago or n=
ot?<br><br>Jose</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.yoctoproject=
.org">lists.yoctoproject.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmai=
l.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; escr=
eveu no dia quarta, 11/01/2023 =C3=A0(s) 10:13:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Deny=
s Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">deni=
s@denix.org</a>&gt; escreveu no dia ter=C3=A7a, 10/01/2023 =C3=A0(s) 23:39:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ok, this is not=
 specific to the host OS.<br>
<br>
It is toolchain-specific though - it doesn&#39;t fail with the external Arm=
 <br>
toolchain, but fails with the toolchain built by OE, i.e. Poky, etc.<br></b=
lockquote><div><br>So this can be the reason to build with meta-arago and n=
ot without it.=C2=A0</div><div>Thanks for looking at this.<br><br>Jose<br><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
On Wed, Jan 04, 2023 at 03:54:05PM -0500, Denys Dmytriyenko wrote:<br>
&gt; Not being able to reproduce the issue here:<br>
&gt; <br>
&gt; $ MACHINE=3Dam64xx-evm bitbake optee-os<br>
&gt; <br>
&gt; Builds just fine.<br>
&gt; <br>
&gt; Any more pointers - host OS/version, etc? I&#39;m building Dunfell in =
Ubuntu 18.04 <br>
&gt; container, but can try a newer one if that&#39;s the culprit.<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jan 04, 2023 at 07:18:50PM +0000, Jose Quaresma wrote:<br>
&gt; &gt; Friendly ping :)<br>
&gt; &gt; <br>
&gt; &gt; thanks<br>
&gt; &gt; <br>
&gt; &gt; Jose Quaresma via <a href=3D"http://lists.yoctoproject.org" rel=
=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;quaresma.j=
ose=3D<br>
&gt; &gt; <a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_bl=
ank">gmail.com@lists.yoctoproject.org</a>&gt; escreveu no dia ter=C3=A7a, 1=
3/12/2022 =C3=A0(s)<br>
&gt; &gt; 18:38:<br>
&gt; &gt; <br>
&gt; &gt; &gt; f8182afd optee: Upgrade to upstream 3.17.0<br>
&gt; &gt; &gt; removes this patch but this is still required<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Currently building with am62xx-evm/am64xx-evm machine fails =
with:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such f=
ile or<br>
&gt; &gt; &gt; directory<br>
&gt; &gt; &gt; | make: *** [ldelf/<a href=3D"http://link.mk:60" rel=3D"nore=
ferrer" target=3D"_blank">link.mk:60</a>: out/arm-plat-k3/ldelf/ldelf.elf] =
Error 1<br>
&gt; &gt; &gt; | make: *** Waiting for unfinished jobs....<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quar=
esma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 +++=
++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 recipes-security/optee/optee-os_%.bbappend=C2=A0 =C2=
=A0 |=C2=A0 6 +++-<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 39 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; &gt; recipes-security/optee/optee-os/0006-allow-setting-sysroot-f=
or-libgcc-lookup.patch<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git<br>
&gt; &gt; &gt; a/recipes-security/optee/optee-os/0006-allow-setting-sysroot=
-for-libgcc-lookup.patch<br>
&gt; &gt; &gt; b/recipes-security/optee/optee-os/0006-allow-setting-sysroot=
-for-libgcc-lookup.patch<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 00000000..17005396<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++<br>
&gt; &gt; &gt; b/recipes-security/optee/optee-os/0006-allow-setting-sysroot=
-for-libgcc-lookup.patch<br>
&gt; &gt; &gt; @@ -0,0 +1,34 @@<br>
&gt; &gt; &gt; +From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com=
" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; &gt; &gt; +Date: Tue, 26 May 2020 14:38:02 -0500<br>
&gt; &gt; &gt; +Subject: [PATCH] allow setting sysroot for libgcc lookup<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS varia=
ble when<br>
&gt; &gt; &gt; searching<br>
&gt; &gt; &gt; +for the compiler libraries as there&#39;s no easy way to re=
liably pass<br>
&gt; &gt; &gt; --sysroot<br>
&gt; &gt; &gt; +otherwise.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream-Status: Pending [<a href=3D"https://github.com/OP-=
TEE/optee_os/issues/4188" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/OP-TEE/optee_os/issues/4188</a>]<br>
&gt; &gt; &gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burto=
n@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D"=
_blank">gcc.mk</a> | 6 +++---<br>
&gt; &gt; &gt; + 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer=
" target=3D"_blank">gcc.mk</a> b/mk/<a href=3D"http://gcc.mk" rel=3D"norefe=
rrer" target=3D"_blank">gcc.mk</a><br>
&gt; &gt; &gt; +index adc77a24..81bfa78a 100644<br>
&gt; &gt; &gt; +--- a/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" targe=
t=3D"_blank">gcc.mk</a><br>
&gt; &gt; &gt; ++++ b/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" targe=
t=3D"_blank">gcc.mk</a><br>
&gt; &gt; &gt; +@@ -13,11 +13,11 @@ nostdinc$(sm)=C2=A0 =C2=A0 =C2=A0 :=3D =
-nostdinc -isystem $(shell<br>
&gt; &gt; &gt; $(CC$(sm)) \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-print-file-name=3Dinclude 2&gt; /dev/null)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + # Get location of libgcc from gcc<br>
&gt; &gt; &gt; +-libgcc$(sm)=C2=A0 =C2=A0:=3D $(shell $(CC$(sm)) $(CFLAGS$(=
arch-bits-$(sm))) \<br>
&gt; &gt; &gt; ++libgcc$(sm)=C2=A0 =C2=A0:=3D $(shell $(CC$(sm)) $(LIBGCC_L=
OCATE_CFLAGS)<br>
&gt; &gt; &gt; $(CFLAGS$(arch-bits-$(sm))) \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-print-libgcc-file-name 2&gt; /dev/null)<br>
&gt; &gt; &gt; +-libstdc++$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(C=
XX$(sm))<br>
&gt; &gt; &gt; $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
&gt; &gt; &gt; ++libstdc++$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(C=
XX$(sm)) $(LIBGCC_LOCATE_CFLAGS)<br>
&gt; &gt; &gt; $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-print-file-name=3Dlibstdc++.a 2&gt; /dev/null)<br>
&gt; &gt; &gt; +-libgcc_eh$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(C=
XX$(sm))<br>
&gt; &gt; &gt; $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
&gt; &gt; &gt; ++libgcc_eh$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(C=
XX$(sm)) $(LIBGCC_LOCATE_CFLAGS)<br>
&gt; &gt; &gt; $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-print-file-name=3Dlibgcc_eh.a 2&gt; /dev/null)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + # Define these to something to discover accidental use<br>
&gt; &gt; &gt; diff --git a/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &gt; &gt; b/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &gt; &gt; index 751dc3d0..e8af0124 100644<br>
&gt; &gt; &gt; --- a/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &gt; &gt; +++ b/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &gt; &gt; @@ -1,6 +1,10 @@<br>
&gt; &gt; &gt; +FILESEXTRAPATHS_prepend_ti-soc :=3D &quot;${THISDIR}/${PN}:=
&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 PV_ti-soc =3D &quot;3.19.0+git${SRCPV}&quot;<br>
&gt; &gt; &gt;=C2=A0 SRCREV_ti-soc =3D &quot;d6c5d0037b46f46caf71d67d7825d4=
b722cbcddf&quot;<br>
&gt; &gt; &gt; -SRC_URI_ti-soc =3D &quot;git://<a href=3D"http://github.com=
/OP-TEE/optee_os.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/OP-TEE/optee_os.git;protocol=3Dhttps</a>&quot;<br>
&gt; &gt; &gt; +SRC_URI_ti-soc =3D &quot;git://<a href=3D"http://github.com=
/OP-TEE/optee_os.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/OP-TEE/optee_os.git;protocol=3Dhttps</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 file://0006-allow-setting-sysroot-for-libgcc-=
lookup.patch \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 DEPENDS_append_ti-soc =3D &quot; python3-cryptography-=
native&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.38.2<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15546): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15546" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15546</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96057453/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/96057453/5052612</a><br>
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

--000000000000f6a1f205f2280eda--

