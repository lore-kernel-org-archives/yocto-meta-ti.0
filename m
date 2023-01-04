Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5578AC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 19:19:05 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web11.22455.1672859942279675600
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 11:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gbnGbC7H;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id i84so10304676vke.7
        for <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 11:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GU7b3aYzvYRS88DQuywHAtpST5+I+k/AxOsr9fzOUkY=;
        b=gbnGbC7H+m59CM4nzoD/vbdW32xVFJZ+Mu6n2FPR1jk3Rks+5BZQ7S4SxlisRQXj8o
         VtTa8q2NP6EHdZaaBXb1+14/ju6HqeIeLTyXv4FAUnRLUkVV6RMnrtwfUH0JguZMAKEt
         AaedUM3aGi+8Gqt2uq8tDJsU6OYQYGP+3K0Ax3x5bSOah+eJx/8bvswFcG8Lm2MPK5Ef
         G/l33VwM4+OOcgpK5PdH+cQMuLN+qgZ5hGlVWpEZhI1ZWBT9tiSlGtoU+/7wKZDxum1f
         /BgJL7NxIyhq+9GoNWhrOkWajJHLxpCoKUP+ryWvurWX2ta0jp52gPOE1bLWpKSGIebE
         tXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU7b3aYzvYRS88DQuywHAtpST5+I+k/AxOsr9fzOUkY=;
        b=rhoGdpT8WosB5Sf1v8HZ+8Mp+slg0W5sWtB0jMzgOW14ewDyq/hCHtIzDbHnYNrm+g
         T0urilEoOCfkDq4GrfNJFRjiEtdIwaJ6R6u7ITLFsXplxPIFtNym1pmbgkTijSPEMuYE
         yfRWaOGzRWKRYjxxJkUyfVxkjRCuebt8gOsBCrU7vLnx9LQlDYuwdrzAqT4BlZMXg3DN
         V5o13dKMTBwD26MATjt0ooHhiPj13YrrKvbRmYBh1OcAW3tpcIkw8lHd8KG+TXT+Tx5B
         yfojbQQ3mXrvE5pCzSFLMTZzaQKQi4g8gh7nTK3hr47KIGy8+cgG1R1nA2f+KH9DwCb0
         1Krg==
X-Gm-Message-State: AFqh2kpVOUafQ2Cx2xsIfvIB+Ezs9cwIS/HHxNOxzMoETkULTu6sWgXr
	1lHpS+RDYT+hpbBrwc/Q6ltjbAdK5Z9tyAtT400=
X-Google-Smtp-Source: AMrXdXtiCclBK3zZn3kyzHfV3P1Di19qeE6wsENYpKq4Dxn6fDTIgnruE/vMEa+TNw6S+BAaHzd4CQHFvuvqFim87cE=
X-Received: by 2002:a1f:a954:0:b0:3b8:ba98:bd43 with SMTP id
 s81-20020a1fa954000000b003b8ba98bd43mr5432490vke.34.1672859941226; Wed, 04
 Jan 2023 11:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20221213183818.206660-1-jose.quaresma@foundries.io> <17306E4919830D85.9432@lists.yoctoproject.org>
In-Reply-To: <17306E4919830D85.9432@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 4 Jan 2023 19:18:50 +0000
Message-ID: <CANPvuRmgtz2dJARawU8GBi=2_8o6qGbVL9vUAtRS78_1=ORHmQ@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH 2/2] optee-os: add back allow-setting-sysroot-for-libgcc-lookup.patch
To: quaresma.jose@gmail.com
Cc: meta-ti@lists.yoctoproject.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000008e4f2c05f1750e76"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 19:19:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15521

--0000000000008e4f2c05f1750e76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Friendly ping :)

thanks

Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
gmail.com@lists.yoctoproject.org> escreveu no dia ter=C3=A7a, 13/12/2022 =
=C3=A0(s)
18:38:

> f8182afd optee: Upgrade to upstream 3.17.0
> removes this patch but this is still required
>
> Currently building with am62xx-evm/am64xx-evm machine fails with:
>
> | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or
> directory
> | make: *** [ldelf/link.mk:60: out/arm-plat-k3/ldelf/ldelf.elf] Error 1
> | make: *** Waiting for unfinished jobs....
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 +++++++++++++++++++
>  recipes-security/optee/optee-os_%.bbappend    |  6 +++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644
> recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-loo=
kup.patch
>
> diff --git
> a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-l=
ookup.patch
> b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-l=
ookup.patch
> new file mode 100644
> index 00000000..17005396
> --- /dev/null
> +++
> b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-l=
ookup.patch
> @@ -0,0 +1,34 @@
> +From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Tue, 26 May 2020 14:38:02 -0500
> +Subject: [PATCH] allow setting sysroot for libgcc lookup
> +
> +Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when
> searching
> +for the compiler libraries as there's no easy way to reliably pass
> --sysroot
> +otherwise.
> +
> +Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + mk/gcc.mk | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/mk/gcc.mk b/mk/gcc.mk
> +index adc77a24..81bfa78a 100644
> +--- a/mk/gcc.mk
> ++++ b/mk/gcc.mk
> +@@ -13,11 +13,11 @@ nostdinc$(sm)      :=3D -nostdinc -isystem $(shell
> $(CC$(sm)) \
> +                       -print-file-name=3Dinclude 2> /dev/null)
> +
> + # Get location of libgcc from gcc
> +-libgcc$(sm)   :=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
> ++libgcc$(sm)   :=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS)
> $(CFLAGS$(arch-bits-$(sm))) \
> +                       -print-libgcc-file-name 2> /dev/null)
> +-libstdc++$(sm)        :=3D $(shell $(CXX$(sm))
> $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> ++libstdc++$(sm)        :=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS)
> $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> +                       -print-file-name=3Dlibstdc++.a 2> /dev/null)
> +-libgcc_eh$(sm)        :=3D $(shell $(CXX$(sm))
> $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> ++libgcc_eh$(sm)        :=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS)
> $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> +                       -print-file-name=3Dlibgcc_eh.a 2> /dev/null)
> +
> + # Define these to something to discover accidental use
> diff --git a/recipes-security/optee/optee-os_%.bbappend
> b/recipes-security/optee/optee-os_%.bbappend
> index 751dc3d0..e8af0124 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -1,6 +1,10 @@
> +FILESEXTRAPATHS_prepend_ti-soc :=3D "${THISDIR}/${PN}:"
> +
>  PV_ti-soc =3D "3.19.0+git${SRCPV}"
>  SRCREV_ti-soc =3D "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
> -SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3Dhttp=
s"
> +SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3Dhttp=
s \
> +    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> +"
>
>  DEPENDS_append_ti-soc =3D " python3-cryptography-native"
>
> --
> 2.38.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15466):
> https://lists.yoctoproject.org/g/meta-ti/message/15466
> Mute This Topic: https://lists.yoctoproject.org/mt/95650881/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008e4f2c05f1750e76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(0,0,0)">Friendly=C2=A0</span=
><span class=3D"gmail-il" style=3D"color:rgb(0,0,0)">ping :)<br></span><spa=
n style=3D"color:rgb(0,0,0)"><br>thanks</span><br></div><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br>Jose Quaresma via <a href=
=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;quaresma.=
jose=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.=
yoctoproject.org</a>&gt; escreveu no dia ter=C3=A7a, 13/12/2022 =C3=A0(s) 1=
8:38:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">f8182afd o=
ptee: Upgrade to upstream 3.17.0<br>
removes this patch but this is still required<br>
<br>
Currently building with am62xx-evm/am64xx-evm machine fails with:<br>
<br>
| aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or director=
y<br>
| make: *** [ldelf/<a href=3D"http://link.mk:60" rel=3D"noreferrer" target=
=3D"_blank">link.mk:60</a>: out/arm-plat-k3/ldelf/ldelf.elf] Error 1<br>
| make: *** Waiting for unfinished jobs....<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0...ow-setting-sysroot-for-libgcc-lookup.patch | 34 ++++++++++++++++++=
+<br>
=C2=A0recipes-security/optee/optee-os_%.bbappend=C2=A0 =C2=A0 |=C2=A0 6 +++=
-<br>
=C2=A02 files changed, 39 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 recipes-security/optee/optee-os/0006-allow-setting=
-sysroot-for-libgcc-lookup.patch<br>
<br>
diff --git a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for=
-libgcc-lookup.patch b/recipes-security/optee/optee-os/0006-allow-setting-s=
ysroot-for-libgcc-lookup.patch<br>
new file mode 100644<br>
index 00000000..17005396<br>
--- /dev/null<br>
+++ b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc=
-lookup.patch<br>
@@ -0,0 +1,34 @@<br>
+From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001<br>
+From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
+Date: Tue, 26 May 2020 14:38:02 -0500<br>
+Subject: [PATCH] allow setting sysroot for libgcc lookup<br>
+<br>
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when search=
ing<br>
+for the compiler libraries as there&#39;s no easy way to reliably pass --s=
ysroot<br>
+otherwise.<br>
+<br>
+Upstream-Status: Pending [<a href=3D"https://github.com/OP-TEE/optee_os/is=
sues/4188" rel=3D"noreferrer" target=3D"_blank">https://github.com/OP-TEE/o=
ptee_os/issues/4188</a>]<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+---<br>
+ mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D"_blank">gcc.mk<=
/a> | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D"_bl=
ank">gcc.mk</a> b/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D=
"_blank">gcc.mk</a><br>
+index adc77a24..81bfa78a 100644<br>
+--- a/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D"_blank">gc=
c.mk</a><br>
++++ b/mk/<a href=3D"http://gcc.mk" rel=3D"noreferrer" target=3D"_blank">gc=
c.mk</a><br>
+@@ -13,11 +13,11 @@ nostdinc$(sm)=C2=A0 =C2=A0 =C2=A0 :=3D -nostdinc -isys=
tem $(shell $(CC$(sm)) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-print-file-name=3Dinclude 2&gt; /dev/null)<br>
+ <br>
+ # Get location of libgcc from gcc<br>
+-libgcc$(sm)=C2=A0 =C2=A0:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm)=
)) \<br>
++libgcc$(sm)=C2=A0 =C2=A0:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $=
(CFLAGS$(arch-bits-$(sm))) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-print-libgcc-file-name 2&gt; /dev/null)<br>
+-libstdc++$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(CXX$(sm)) $(CXXF=
LAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
++libstdc++$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(CXX$(sm)) $(LIBG=
CC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-print-file-name=3Dlibstdc++.a 2&gt; /dev/null)<br>
+-libgcc_eh$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(CXX$(sm)) $(CXXF=
LAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
++libgcc_eh$(sm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(shell $(CXX$(sm)) $(LIBG=
CC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-print-file-name=3Dlibgcc_eh.a 2&gt; /dev/null)<br>
+ <br>
+ # Define these to something to discover accidental use<br>
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/=
optee/optee-os_%.bbappend<br>
index 751dc3d0..e8af0124 100644<br>
--- a/recipes-security/optee/optee-os_%.bbappend<br>
+++ b/recipes-security/optee/optee-os_%.bbappend<br>
@@ -1,6 +1,10 @@<br>
+FILESEXTRAPATHS_prepend_ti-soc :=3D &quot;${THISDIR}/${PN}:&quot;<br>
+<br>
=C2=A0PV_ti-soc =3D &quot;3.19.0+git${SRCPV}&quot;<br>
=C2=A0SRCREV_ti-soc =3D &quot;d6c5d0037b46f46caf71d67d7825d4b722cbcddf&quot=
;<br>
-SRC_URI_ti-soc =3D &quot;git://<a href=3D"http://github.com/OP-TEE/optee_o=
s.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/OP-=
TEE/optee_os.git;protocol=3Dhttps</a>&quot;<br>
+SRC_URI_ti-soc =3D &quot;git://<a href=3D"http://github.com/OP-TEE/optee_o=
s.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/OP-=
TEE/optee_os.git;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \<=
br>
+&quot;<br>
<br>
=C2=A0DEPENDS_append_ti-soc =3D &quot; python3-cryptography-native&quot;<br=
>
<br>
-- <br>
2.38.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15466): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15466" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15466</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95650881/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/95650881/5052612</a><br>
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

--0000000000008e4f2c05f1750e76--

