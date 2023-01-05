Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33E4C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 10:44:40 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.9999.1672915475507260999
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 02:44:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S5OQmRME;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id i10so16022259vsr.12
        for <meta-ti@lists.yoctoproject.org>; Thu, 05 Jan 2023 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r4Oup8be5YBMqZHx35JlPM12/8wE3xfIryPeb4ZCWbc=;
        b=S5OQmRMEkLCcEyM8zHhhZcJbfgUX4hjVNKZo3sY6cbPOTCC5zvYQQCEhudSqXxQjqG
         MB10CFDAXILlgQdWcyZwfeHeQQzsln5TSU/dTqKdFaByu0KcczD08klOOC2VhDlGdpAx
         ChwHw83ZPLykusHLCARzpB8rxMCsxESLhTPkI9l+4XfO2Xqd4lyRJ5/he2E0Q+UqK7H4
         1Ll1JnzCL1U6fmTC1+aYZZ7Iy+orDcMw/qm9a5tHl3CCVfJ5n5r3txerlA9eJhiMWE60
         c7TUr4K3HTjLlxqlcAfyAduJSckayY8K0Bf8cf8kgw1GEnMr6m8XMf3FoBZa88Lek+EP
         HLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4Oup8be5YBMqZHx35JlPM12/8wE3xfIryPeb4ZCWbc=;
        b=00t2T7GFoLElRDgJ38ki8oDV75h6guzHNiQm8AizgV+VLoFoLWEUbF+VKXEA7Che1m
         g4IRueFREbPx1F3nGnoGKixINlxz6jWHob2TqsK1GF/MfE6w9XlxiBd+VWxzWfQ76a7H
         8M9KRwWuXQdviRDbbz/DnZLbslVqrWht5U4ZTdxsKqbmRc+4OdnESKtJ3BfS+jfH2mCX
         eKqWoii6IcE2aiZ4gPc+Pwr/kRA/0RSbUDuoqaNZgtIoWiBAqx0SsXv+jtEqdk8AY/4m
         9zsaEuBKl/0bfo6bQ/uFgb8O+1IywEOtzztZZg2ea3q/hKhWwJ6Wb5LdbXnrBaF/SVFE
         t8wQ==
X-Gm-Message-State: AFqh2kqx7w2rnqfOGg4gEQIRstsu5yKg+5dFyFwBA0WcvSZnOKFa70wm
	SF7eIxVqLnOwvGiWL80IaAJjZ3MoO/KqbP/9GQM=
X-Google-Smtp-Source: AMrXdXv13Vafz3jvMPXNHIQ8xQwt/Vqzf2s05YBaG1r4bDZ9QZ8DyAaZTibCqEikbTWRBEYPS1+kTyNBU0uJEKXdL3k=
X-Received: by 2002:a05:6102:22fb:b0:3cb:ba4:3831 with SMTP id
 b27-20020a05610222fb00b003cb0ba43831mr3866730vsh.87.1672915474438; Thu, 05
 Jan 2023 02:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20221213183818.206660-1-jose.quaresma@foundries.io>
 <17306E4919830D85.9432@lists.yoctoproject.org> <CANPvuRmgtz2dJARawU8GBi=2_8o6qGbVL9vUAtRS78_1=ORHmQ@mail.gmail.com>
 <20230104205405.GJ22689@denix.org>
In-Reply-To: <20230104205405.GJ22689@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 5 Jan 2023 10:44:23 +0000
Message-ID: <CANPvuR=-bhSicc3eS4X-X76k5jZh=MOiwgvjp2Yjtu6NKKG7sA@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH 2/2] optee-os: add back allow-setting-sysroot-for-libgcc-lookup.patch
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000097df3b05f181fc31"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Jan 2023 10:44:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15530

--00000000000097df3b05f181fc31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

I can reproduce this issue with kas and using their container that is
debian 11 based.

builder@96ee80f74a76:/build$ lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 11 (bullseye)
Release:        11
Codename:       bullseye


The ti-dunfell-optee.yml reproduces the issue and
the ti-dunfell-optee-fixed.yml uses this patch.
Here is the steps to reproduce:

# kas install
mkdir -p ti-dunfell-optee && \
cd ti-dunfell-optee && \
python -m venv kas && \
source kas/bin/activate && \
pip install kas

# kas config
cat <<EOF > ti-dunfell-optee.yml
header:
  version: 8

local_conf_header:
  poky: |
    DISTRO_FEATURES:remove =3D "ptest"

distro: poky

target: optee-os

defaults:
  repos:
    refspec: dunfell

repos:
  poky:
    url: https://git.yoctoproject.org/git/poky
    layers:
      meta:
      meta-poky:

  meta-ti:
    url: "https://git.yoctoproject.org/meta-ti"

  meta-arm:
    url: "https://git.yoctoproject.org/meta-arm"
    layers:
      meta-arm:
      meta-arm-toolchain:

  meta-openembedded:
    url: "https://git.openembedded.org/meta-openembedded"
    layers:
      meta-oe:
      meta-python:
EOF

# kas build
KAS_MACHINE=3Dam62xx-evm kas-container build ti-dunfell-optee.yml
KAS_MACHINE=3Dam64xx-evm kas-container build ti-dunfell-optee.yml

# kas config
# patch path:
ti-dunfell-optee/0001-optee-os-add-back-allow-setting-sysroot-for-libgcc-l.=
patch
cat <<EOF > ti-dunfell-optee-fixed.yml
header:
  version: 8
  includes:
    - ti-dunfell-optee.yml

repos:
  meta-ti:
    patches:
      libgcc:
        repo: meta-ti
        path:
../0001-optee-os-add-back-allow-setting-sysroot-for-libgcc-l.patch
EOF

# kas build
KAS_MACHINE=3Dam62xx-evm kas-container build ti-dunfell-optee.yml
KAS_MACHINE=3Dam64xx-evm kas-container build ti-dunfell-optee.yml

Jose

Denys Dmytriyenko <denis@denix.org> escreveu no dia quarta, 4/01/2023 =C3=
=A0(s)
20:54:

> Not being able to reproduce the issue here:
>
> $ MACHINE=3Dam64xx-evm bitbake optee-os
>
> Builds just fine.
>
> Any more pointers - host OS/version, etc? I'm building Dunfell in Ubuntu
> 18.04
> container, but can try a newer one if that's the culprit.
>
>
> On Wed, Jan 04, 2023 at 07:18:50PM +0000, Jose Quaresma wrote:
> > Friendly ping :)
> >
> > thanks
> >
> > Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
> > gmail.com@lists.yoctoproject.org> escreveu no dia ter=C3=A7a, 13/12/202=
2 =C3=A0(s)
> > 18:38:
> >
> > > f8182afd optee: Upgrade to upstream 3.17.0
> > > removes this patch but this is still required
> > >
> > > Currently building with am62xx-evm/am64xx-evm machine fails with:
> > >
> > > | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or
> > > directory
> > > | make: *** [ldelf/link.mk:60: out/arm-plat-k3/ldelf/ldelf.elf] Error
> 1
> > > | make: *** Waiting for unfinished jobs....
> > >
> > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > ---
> > >  ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 +++++++++++++++++=
++
> > >  recipes-security/optee/optee-os_%.bbappend    |  6 +++-
> > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > >  create mode 100644
> > >
> recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-loo=
kup.patch
> > >
> > > diff --git
> > >
> a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-l=
ookup.patch
> > >
> b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-l=
ookup.patch
> > > new file mode 100644
> > > index 00000000..17005396
> > > --- /dev/null
> > > +++
> > >
> b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-l=
ookup.patch
> > > @@ -0,0 +1,34 @@
> > > +From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 20=
01
> > > +From: Ross Burton <ross.burton@arm.com>
> > > +Date: Tue, 26 May 2020 14:38:02 -0500
> > > +Subject: [PATCH] allow setting sysroot for libgcc lookup
> > > +
> > > +Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when
> > > searching
> > > +for the compiler libraries as there's no easy way to reliably pass
> > > --sysroot
> > > +otherwise.
> > > +
> > > +Upstream-Status: Pending [
> https://github.com/OP-TEE/optee_os/issues/4188]
> > > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > +---
> > > + mk/gcc.mk | 6 +++---
> > > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/mk/gcc.mk b/mk/gcc.mk
> > > +index adc77a24..81bfa78a 100644
> > > +--- a/mk/gcc.mk
> > > ++++ b/mk/gcc.mk
> > > +@@ -13,11 +13,11 @@ nostdinc$(sm)      :=3D -nostdinc -isystem $(she=
ll
> > > $(CC$(sm)) \
> > > +                       -print-file-name=3Dinclude 2> /dev/null)
> > > +
> > > + # Get location of libgcc from gcc
> > > +-libgcc$(sm)   :=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
> > > ++libgcc$(sm)   :=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS)
> > > $(CFLAGS$(arch-bits-$(sm))) \
> > > +                       -print-libgcc-file-name 2> /dev/null)
> > > +-libstdc++$(sm)        :=3D $(shell $(CXX$(sm))
> > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> > > ++libstdc++$(sm)        :=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLA=
GS)
> > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> > > +                       -print-file-name=3Dlibstdc++.a 2> /dev/null)
> > > +-libgcc_eh$(sm)        :=3D $(shell $(CXX$(sm))
> > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> > > ++libgcc_eh$(sm)        :=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLA=
GS)
> > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> > > +                       -print-file-name=3Dlibgcc_eh.a 2> /dev/null)
> > > +
> > > + # Define these to something to discover accidental use
> > > diff --git a/recipes-security/optee/optee-os_%.bbappend
> > > b/recipes-security/optee/optee-os_%.bbappend
> > > index 751dc3d0..e8af0124 100644
> > > --- a/recipes-security/optee/optee-os_%.bbappend
> > > +++ b/recipes-security/optee/optee-os_%.bbappend
> > > @@ -1,6 +1,10 @@
> > > +FILESEXTRAPATHS_prepend_ti-soc :=3D "${THISDIR}/${PN}:"
> > > +
> > >  PV_ti-soc =3D "3.19.0+git${SRCPV}"
> > >  SRCREV_ti-soc =3D "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
> > > -SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3D=
https
> "
> > > +SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3D=
https
> \
> > > +    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > > +"
> > >
> > >  DEPENDS_append_ti-soc =3D " python3-cryptography-native"
> > >
> > > --
> > > 2.38.2
> > >
> > >
> > >
> > >
> > >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000097df3b05f181fc31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Denys,<br><br>I can reproduce this issue with kas =
and using their container that is debian 11 based.<br><br>builder@96ee80f74=
a76:/build$ lsb_release -a<br>No LSB modules are available.<br>Distributor =
ID: Debian<br>Description: =C2=A0 =C2=A0Debian GNU/Linux 11 (bullseye)<br>R=
elease: =C2=A0 =C2=A0 =C2=A0 =C2=A011<br>Codename: =C2=A0 =C2=A0 =C2=A0 bul=
lseye<br><br></div><div><br>The ti-dunfell-optee.yml reproduces the issue a=
nd the=C2=A0ti-dunfell-optee-fixed.yml uses this patch.<br></div><div><div>=
Here is the steps to reproduce:</div><div><br># kas install<br>mkdir -p ti-=
dunfell-optee &amp;&amp; \</div><div>cd ti-dunfell-optee &amp;&amp; \<br></=
div>python -m venv kas &amp;&amp; \</div><div>source kas/bin/activate &amp;=
&amp; \<br>pip install kas<br><br></div><div># kas config<br>cat &lt;&lt;EO=
F &gt; ti-dunfell-optee.yml<br>header:<br>=C2=A0 version: 8<br><br>local_co=
nf_header:<br>=C2=A0 poky: |<br>=C2=A0 =C2=A0 DISTRO_FEATURES:remove =3D &q=
uot;ptest&quot;<br><br>distro: poky<br><br>target: optee-os<br><br>defaults=
:<br>=C2=A0 repos:<br>=C2=A0 =C2=A0 refspec: dunfell<br><br>repos:<br>=C2=
=A0 poky:<br>=C2=A0 =C2=A0 url: <a href=3D"https://git.yoctoproject.org/git=
/poky">https://git.yoctoproject.org/git/poky</a><br>=C2=A0 =C2=A0 layers:<b=
r>=C2=A0 =C2=A0 =C2=A0 meta:<br>=C2=A0 =C2=A0 =C2=A0 meta-poky:<br><br>=C2=
=A0 meta-ti:<br>=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoprojec=
t.org/meta-ti">https://git.yoctoproject.org/meta-ti</a>&quot;<br><br>=C2=A0=
 meta-arm:<br>=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.=
org/meta-arm">https://git.yoctoproject.org/meta-arm</a>&quot;<br>=C2=A0 =C2=
=A0 layers:<br>=C2=A0 =C2=A0 =C2=A0 meta-arm:<br>=C2=A0 =C2=A0 =C2=A0 meta-=
arm-toolchain:<br><br>=C2=A0 meta-openembedded:<br>=C2=A0 =C2=A0 url: &quot=
;<a href=3D"https://git.openembedded.org/meta-openembedded">https://git.ope=
nembedded.org/meta-openembedded</a>&quot;<br>=C2=A0 =C2=A0 layers:<br>=C2=
=A0 =C2=A0 =C2=A0 meta-oe:<br>=C2=A0 =C2=A0 =C2=A0 meta-python:<br>EOF<br><=
/div><br># kas build<br>KAS_MACHINE=3Dam62xx-evm kas-container build ti-dun=
fell-optee.yml<br>KAS_MACHINE=3Dam64xx-evm kas-container build ti-dunfell-o=
ptee.yml<br><br># kas config<div># patch path: ti-dunfell-optee/0001-optee-=
os-add-back-allow-setting-sysroot-for-libgcc-l.patch<br>cat &lt;&lt;EOF &gt=
; ti-dunfell-optee-fixed.yml<br>header:<br>=C2=A0 version: 8<br>=C2=A0 incl=
udes:<br>=C2=A0 =C2=A0 - ti-dunfell-optee.yml<br><br>repos:<br>=C2=A0 meta-=
ti:<br>=C2=A0 =C2=A0 patches:<br>=C2=A0 =C2=A0 =C2=A0 libgcc:<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 repo: meta-ti<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 path: ../000=
1-optee-os-add-back-allow-setting-sysroot-for-libgcc-l.patch<br>EOF<br><div=
><br># kas build<br>KAS_MACHINE=3Dam62xx-evm kas-container build ti-dunfell=
-optee.yml<br>KAS_MACHINE=3Dam64xx-evm kas-container build ti-dunfell-optee=
.yml<br><br>Jose<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">de=
nis@denix.org</a>&gt; escreveu no dia quarta, 4/01/2023 =C3=A0(s) 20:54:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Not being able to =
reproduce the issue here:<br>
<br>
$ MACHINE=3Dam64xx-evm bitbake optee-os<br>
<br>
Builds just fine.<br>
<br>
Any more pointers - host OS/version, etc? I&#39;m building Dunfell in Ubunt=
u 18.04 <br>
container, but can try a newer one if that&#39;s the culprit.<br>
<br>
<br>
On Wed, Jan 04, 2023 at 07:18:50PM +0000, Jose Quaresma wrote:<br>
&gt; Friendly ping :)<br>
&gt; <br>
&gt; thanks<br>
&gt; <br>
&gt; Jose Quaresma via <a href=3D"http://lists.yoctoproject.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;quaresma.jose=3D<=
br>
&gt; <a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">=
gmail.com@lists.yoctoproject.org</a>&gt; escreveu no dia ter=C3=A7a, 13/12/=
2022 =C3=A0(s)<br>
&gt; 18:38:<br>
&gt; <br>
&gt; &gt; f8182afd optee: Upgrade to upstream 3.17.0<br>
&gt; &gt; removes this patch but this is still required<br>
&gt; &gt;<br>
&gt; &gt; Currently building with am62xx-evm/am64xx-evm machine fails with:=
<br>
&gt; &gt;<br>
&gt; &gt; | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file o=
r<br>
&gt; &gt; directory<br>
&gt; &gt; | make: *** [ldelf/<a href=3D"http://link.mk:60" rel=3D"noreferre=
r" target=3D"_blank">link.mk:60</a>: out/arm-plat-k3/ldelf/ldelf.elf] Error=
 1<br>
&gt; &gt; | make: *** Waiting for unfinished jobs....<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@=
foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 ++++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 recipes-security/optee/optee-os_%.bbappend=C2=A0 =C2=A0 |=
=C2=A0 6 +++-<br>
&gt; &gt;=C2=A0 2 files changed, 39 insertions(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-li=
bgcc-lookup.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-=
libgcc-lookup.patch<br>
&gt; &gt; b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-=
libgcc-lookup.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000..17005396<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt; b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-=
libgcc-lookup.patch<br>
&gt; &gt; @@ -0,0 +1,34 @@<br>
&gt; &gt; +From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" tar=
get=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 26 May 2020 14:38:02 -0500<br>
&gt; &gt; +Subject: [PATCH] allow setting sysroot for libgcc lookup<br>
&gt; &gt; +<br>
&gt; &gt; +Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable w=
hen<br>
&gt; &gt; searching<br>
&gt; &gt; +for the compiler libraries as there&#39;s no easy way to reliabl=
y pass<br>
&gt; &gt; --sysroot<br>
&gt; &gt; +otherwise.<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending [<a href=3D"https://github.com/OP-TEE/o=
ptee_os/issues/4188" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/OP-TEE/optee_os/issues/4188</a>]<br>
&gt; &gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm=
.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D"_blan=
k">gcc.mk</a> | 6 +++---<br>
&gt; &gt; + 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" tar=
get=3D"_blank">gcc.mk</a> b/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer"=
 target=3D"_blank">gcc.mk</a><br>
&gt; &gt; +index adc77a24..81bfa78a 100644<br>
&gt; &gt; +--- a/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D"=
_blank">gcc.mk</a><br>
&gt; &gt; ++++ b/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D"=
_blank">gcc.mk</a><br>
&gt; &gt; +@@ -13,11 +13,11 @@ nostdinc$(sm)=C2=A0 =C2=A0 =C2=A0 :=3D -nost=
dinc -isystem $(shell<br>
&gt; &gt; $(CC$(sm)) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-print-file-name=3Dinclude 2&gt; /dev/null)<br>
&gt; &gt; +<br>
&gt; &gt; + # Get location of libgcc from gcc<br>
&gt; &gt; +-libgcc$(sm)=C2=A0 =C2=A0:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-=
bits-$(sm))) \<br>
&gt; &gt; ++libgcc$(sm)=C2=A0 =C2=A0:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE=
_CFLAGS)<br>
&gt; &gt; $(CFLAGS$(arch-bits-$(sm))) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-print-libgcc-file-name 2&gt; /dev/null)<br>
&gt; &gt; +-libstdc++$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(CXX$(s=
m))<br>
&gt; &gt; $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
&gt; &gt; ++libstdc++$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(CXX$(s=
m)) $(LIBGCC_LOCATE_CFLAGS)<br>
&gt; &gt; $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-print-file-name=3Dlibstdc++.a 2&gt; /dev/null)<br>
&gt; &gt; +-libgcc_eh$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(CXX$(s=
m))<br>
&gt; &gt; $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
&gt; &gt; ++libgcc_eh$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(CXX$(s=
m)) $(LIBGCC_LOCATE_CFLAGS)<br>
&gt; &gt; $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-print-file-name=3Dlibgcc_eh.a 2&gt; /dev/null)<br>
&gt; &gt; +<br>
&gt; &gt; + # Define these to something to discover accidental use<br>
&gt; &gt; diff --git a/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &gt; b/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &gt; index 751dc3d0..e8af0124 100644<br>
&gt; &gt; --- a/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &gt; +++ b/recipes-security/optee/optee-os_%.bbappend<br>
&gt; &gt; @@ -1,6 +1,10 @@<br>
&gt; &gt; +FILESEXTRAPATHS_prepend_ti-soc :=3D &quot;${THISDIR}/${PN}:&quot=
;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 PV_ti-soc =3D &quot;3.19.0+git${SRCPV}&quot;<br>
&gt; &gt;=C2=A0 SRCREV_ti-soc =3D &quot;d6c5d0037b46f46caf71d67d7825d4b722c=
bcddf&quot;<br>
&gt; &gt; -SRC_URI_ti-soc =3D &quot;git://<a href=3D"http://github.com/OP-T=
EE/optee_os.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/OP-TEE/optee_os.git;protocol=3Dhttps</a>&quot;<br>
&gt; &gt; +SRC_URI_ti-soc =3D &quot;git://<a href=3D"http://github.com/OP-T=
EE/optee_os.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/OP-TEE/optee_os.git;protocol=3Dhttps</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 file://0006-allow-setting-sysroot-for-libgcc-looku=
p.patch \<br>
&gt; &gt; +&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS_append_ti-soc =3D &quot; python3-cryptography-nativ=
e&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.38.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div></div></div>

--00000000000097df3b05f181fc31--

