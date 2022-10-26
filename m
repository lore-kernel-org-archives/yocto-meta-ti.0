Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0F8C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 07:29:11 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.4906.1666769346629184902
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 00:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oqvS9iqJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id u11so8614985ljk.6
        for <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 00:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F2z5lzWjBTdKnmWvUkE7zyPvtJ9PtJ0/nSRSZnSFC5o=;
        b=oqvS9iqJ5B/UQC1yeyWZeImbvnABTG8cuMaBJCywl8z1hg8s9q/kQIwS68WA+pWaqF
         nJggEnRsBQtBWszDr4OONYWlEjOtEpwrFsgS6z7J3NI1+SsM29kK3/oKOw2VBFog+dYX
         ZAblzSdbkhBYRg6P2t5GqO9zlHhDygdpyYM0OWcHu3dx4Sv80unBdb8ZFdTKlVnCu+1C
         WN0yQZ7plAl5Y3E6og9zCkcOI8MrBcROiGzLLVBll37q/MiKVwhh920txpq6r/CmTKOg
         ztp+4aITYIMuIuEXdTet1Ch9vAYGaHUGHvlKD5HDfpBLDVtrOxtcjM4VMQ7YQyk3+D1s
         VIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2z5lzWjBTdKnmWvUkE7zyPvtJ9PtJ0/nSRSZnSFC5o=;
        b=JVZVVkgsshoj7w73b6/2d0qiVKr+h3DEyAEM1jucVXkYNLHfzmy+9HMgiriok57Ge0
         KUKxx74UW4mWR8t0ow/De2ldpFwn2Bsr7cg8U614y3mA1YP3qq9iiKPaeVwwOf4mRPwi
         X1RPg9eqCx3eiZOWJxnKN+iTVJNUuAHG7Kv4ZRcyd9XcKKVEmstec1eUq2HShy96QJKL
         Kh6/yjNzx0rU1qs5pYJPcMbctyFcSr9Uyy/ALIfpgt06bdaT+THQufwz0MRWS/fUDXjv
         qMQcLRaUVFVKnrN7JVAYmHVEl2oKVGBm7R0GVWDdzsE6Ht2qoRvgiUnIvFi/c1kN9MKs
         vuhw==
X-Gm-Message-State: ACrzQf2KFhLZn1x1kKQiDF6HVx0WmuzMIPcTzWE95c089aUeiUsg3LcB
	81S9a1HncFHcE9kxiz6ZuPkP3HmSmFoFBwnuobVj1wp+
X-Google-Smtp-Source: AMsMyM6MktbcRTfK4s1vNTAXNfhWPuxD1MZL8CiDnOujWCMDlb2W6k5TuZJDboN8zkJwkeOY7Nk1shmbx9UYChfVpgA=
X-Received: by 2002:a05:651c:208:b0:277:21c8:a90d with SMTP id
 y8-20020a05651c020800b0027721c8a90dmr423107ljn.286.1666769344058; Wed, 26 Oct
 2022 00:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221017102508.1999292-1-jose.quaresma@foundries.io> <20221017102508.1999292-2-jose.quaresma@foundries.io>
In-Reply-To: <20221017102508.1999292-2-jose.quaresma@foundries.io>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 26 Oct 2022 08:28:52 +0100
Message-ID: <CANPvuRkspyYrVwwT_jc_iXzaft_a64Jxiq_rhcog75+-=XXXjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] optee-os-tadevkit: fix binutils segment has RXW permissions
To: meta-ti@lists.yoctoproject.org
Cc: Ricardo Salveti <ricardo@foundries.io>, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000acd81905ebeafa95"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 07:29:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15203

--000000000000acd81905ebeafa95
Content-Type: text/plain; charset="UTF-8"

Ping

A segunda, 17/10/2022, 11:25, Jose Quaresma <quaresma.jose@gmail.com>
escreveu:

> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...w-warns-when-a-segment-has-RXW-permi.patch | 104 ++++++++++++++++++
>  .../optee/optee-os-tadevkit_%.bbappend        |   2 +
>  2 files changed, 106 insertions(+)
>  create mode 100644
> meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch
>
> diff --git
> a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch
> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch
> new file mode 100644
> index 00000000..ed3d1973
> --- /dev/null
> +++
> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch
> @@ -0,0 +1,104 @@
> +From 8efd62bd8aec2a45ae0e3505d2bb1d3b05d1be50 Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <jose.quaresma@foundries.io>
> +Date: Mon, 17 Oct 2022 08:56:59 +0000
> +Subject: [PATCH] Binutils 2.39 now warns when a segment has RXW
> + permissions[1].
> +
> +As we use the --fatal-warnings the build is falling:
> +
> +| aarch64-lmp-linux-ld.bfd: warning:
> /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/all_objs.o
> has a LOAD segment with RWX permissions
> +| aarch64-lmp-linux-ld.bfd: warning:
> /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/unpaged.o
> has a LOAD segment with RWX permissions
> +| aarch64-lmp-linux-ld.bfd: warning:
> /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/init.o
> has a LOAD segment with RWX permissions
> +| aarch64-lmp-linux-ld.bfd: warning:
> /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/tee.elf
> has a LOAD segment with RWX permissions
> +
> +So as temporary solution, remove --fatal-warnings from the source code:
> +
> +| sed -e "s:--fatal-warnings::g" -i core/arch/arm/kernel/link.mk mk/
> lib.mk ldelf/link.mk ta/arch/arm/link.mk ta/arch/arm/link_shlib.mk
> +
> +[1]
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> +
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +---
> + core/arch/arm/kernel/link.mk | 6 +++---
> + ldelf/link.mk                | 2 +-
> + mk/lib.mk                    | 2 +-
> + ta/arch/arm/link.mk          | 2 +-
> + ta/arch/arm/link_shlib.mk    | 2 +-
> + 5 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
> +index 610b22cc7..1cad09f3e 100644
> +--- a/core/arch/arm/kernel/link.mk
> ++++ b/core/arch/arm/kernel/link.mk
> +@@ -23,13 +23,13 @@ ifeq ($(CFG_CORE_BTI),y)
> + # force-bti tells the linker to warn if some object files lack the
> .note.gnu.property
> + # section with the BTI flag, and to turn on the BTI flag in the output
> anyway. The
> + # resulting executable would likely fail at runtime so we use this flag
> along
> +-# with the --fatal-warnings below to check and prevent this situation
> (with useful
> ++# with the  below to check and prevent this situation (with useful
> + # diagnostics).
> +-link-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
> ++link-ldflags += $(call ld-option,-z force-bti)
> + endif
> + link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
> + link-ldflags += --sort-section=alignment
> +-link-ldflags += --fatal-warnings
> ++link-ldflags +=
> + link-ldflags += --gc-sections
> +
> + link-ldadd  = $(LDADD)
> +diff --git a/ldelf/link.mk b/ldelf/link.mk
> +index 64c8212a0..dee806428 100644
> +--- a/ldelf/link.mk
> ++++ b/ldelf/link.mk
> +@@ -18,7 +18,7 @@ link-ldflags += -Map=$(link-out-dir$(sm))/ldelf.map
> + link-ldflags += --sort-section=alignment
> + link-ldflags += -z max-page-size=4096 # OP-TEE always uses 4K alignment
> + ifeq ($(CFG_CORE_BTI),y)
> +-link-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
> ++link-ldflags += $(call ld-option,-z force-bti)
> + endif
> + link-ldflags += $(link-ldflags$(sm))
> +
> +diff --git a/mk/lib.mk b/mk/lib.mk
> +index 30f2040a3..82ede2954 100644
> +--- a/mk/lib.mk
> ++++ b/mk/lib.mk
> +@@ -60,7 +60,7 @@ $(lib-libfile): $(objs)
> + endif
> + ifeq ($(CFG_ULIBS_SHARED),y)
> + ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
> +-lib-ldflags$(libuuid) += $$(call ld-option,-z force-bti) --fatal-warnings
> ++lib-ldflags$(libuuid) += $$(call ld-option,-z force-bti)
> + endif
> + $(lib-shlibfile): $(objs) $(lib-needed-so-files)
> +       @$(cmd-echo-silent) '  LD      $$@'
> +diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
> +index ec5c8db67..f02f7ad5b 100644
> +--- a/ta/arch/arm/link.mk
> ++++ b/ta/arch/arm/link.mk
> +@@ -32,7 +32,7 @@ link-ldflags +=
> -Map=$(link-out-dir$(sm))/$(user-ta-uuid).map
> + link-ldflags += --sort-section=alignment
> + link-ldflags += -z max-page-size=4096 # OP-TEE always uses 4K alignment
> + ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
> +-link-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
> ++link-ldflags += $(call ld-option,-z force-bti)
> + endif
> + link-ldflags += --as-needed # Do not add dependency on unused shlib
> + link-ldflags += $(link-ldflags$(sm))
> +diff --git a/ta/arch/arm/link_shlib.mk b/ta/arch/arm/link_shlib.mk
> +index 0cdf3bfa6..3b696b6a9 100644
> +--- a/ta/arch/arm/link_shlib.mk
> ++++ b/ta/arch/arm/link_shlib.mk
> +@@ -21,7 +21,7 @@ shlink-ldflags  = $(LDFLAGS)
> + shlink-ldflags += -shared -z max-page-size=4096
> + shlink-ldflags += $(call ld-option,-z separate-loadable-segments)
> + ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
> +-shlink-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
> ++shlink-ldflags += $(call ld-option,-z force-bti)
> + endif
> + shlink-ldflags += --as-needed # Do not add dependency on unused shlib
> +
> +--
> +2.34.1
> +
> diff --git
> a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> index 4300c1a9..30ba6d35 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> @@ -1,2 +1,4 @@
> +FILESEXTRAPATHS:prepend:ti-soc := "${THISDIR}/${PN}:"
>  PV:ti-soc = "3.17.0+git${SRCPV}"
>  SRCREV:ti-soc = "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
> +SRC_URI:append:ti-soc = "
> file://0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch"
> --
> 2.34.1
>
>

--000000000000acd81905ebeafa95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">A segunda, 17/10/2022, 11:25, Jose Quaresma &lt;<a hr=
ef=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; escre=
veu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Jose Quaresma &=
lt;<a href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank" rel=3D"n=
oreferrer">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0...w-warns-when-a-segment-has-RXW-permi.patch | 104 +++++++++++++++++=
+<br>
=C2=A0.../optee/optee-os-tadevkit_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
=C2=A02 files changed, 106 insertions(+)<br>
=C2=A0create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevk=
it/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch<br>
<br>
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binu=
tils-2.39-now-warns-when-a-segment-has-RXW-permi.patch b/meta-ti-bsp/recipe=
s-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segm=
ent-has-RXW-permi.patch<br>
new file mode 100644<br>
index 00000000..ed3d1973<br>
--- /dev/null<br>
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.=
39-now-warns-when-a-segment-has-RXW-permi.patch<br>
@@ -0,0 +1,104 @@<br>
+From 8efd62bd8aec2a45ae0e3505d2bb1d3b05d1be50 Mon Sep 17 00:00:00 2001<br>
+From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" targ=
et=3D"_blank" rel=3D"noreferrer">jose.quaresma@foundries.io</a>&gt;<br>
+Date: Mon, 17 Oct 2022 08:56:59 +0000<br>
+Subject: [PATCH] Binutils 2.39 now warns when a segment has RXW<br>
+ permissions[1].<br>
+<br>
+As we use the --fatal-warnings the build is falling:<br>
+<br>
+| aarch64-lmp-linux-ld.bfd: warning: /oe/build/tmp-lmp/work/am62xx_evm-lmp=
-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/all_obj=
s.o has a LOAD segment with RWX permissions<br>
+| aarch64-lmp-linux-ld.bfd: warning: /oe/build/tmp-lmp/work/am62xx_evm-lmp=
-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/unpaged=
.o has a LOAD segment with RWX permissions<br>
+| aarch64-lmp-linux-ld.bfd: warning: /oe/build/tmp-lmp/work/am62xx_evm-lmp=
-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/init.o =
has a LOAD segment with RWX permissions<br>
+| aarch64-lmp-linux-ld.bfd: warning: /oe/build/tmp-lmp/work/am62xx_evm-lmp=
-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/tee.elf=
 has a LOAD segment with RWX permissions<br>
+<br>
+So as temporary solution, remove --fatal-warnings from the source code:<br=
>
+<br>
+| sed -e &quot;s:--fatal-warnings::g&quot; -i core/arch/arm/kernel/<a href=
=3D"http://link.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">link.mk=
</a> mk/<a href=3D"http://lib.mk" rel=3D"noreferrer noreferrer" target=3D"_=
blank">lib.mk</a> ldelf/<a href=3D"http://link.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">link.mk</a> ta/arch/arm/<a href=3D"http://link.mk" =
rel=3D"noreferrer noreferrer" target=3D"_blank">link.mk</a> ta/arch/arm/<a =
href=3D"http://link_shlib.mk" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">link_shlib.mk</a><br>
+<br>
+[1] <a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit=
;h=3Dba951afb99912da01a6e8434126b8fac7aa75107" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dco=
mmit;h=3Dba951afb99912da01a6e8434126b8fac7aa75107</a><br>
+<br>
+Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries=
.io" target=3D"_blank" rel=3D"noreferrer">jose.quaresma@foundries.io</a>&gt=
;<br>
+---<br>
+ core/arch/arm/kernel/<a href=3D"http://link.mk" rel=3D"noreferrer norefer=
rer" target=3D"_blank">link.mk</a> | 6 +++---<br>
+ ldelf/<a href=3D"http://link.mk" rel=3D"noreferrer noreferrer" target=3D"=
_blank">link.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 2 +-<br>
+ mk/<a href=3D"http://lib.mk" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">lib.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
+ ta/arch/arm/<a href=3D"http://link.mk" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">link.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ ta/arch/arm/<a href=3D"http://link_shlib.mk" rel=3D"noreferrer noreferrer=
" target=3D"_blank">link_shlib.mk</a>=C2=A0 =C2=A0 | 2 +-<br>
+ 5 files changed, 7 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/core/arch/arm/kernel/<a href=3D"http://link.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">link.mk</a> b/core/arch/arm/kernel/<a hr=
ef=3D"http://link.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">link.=
mk</a><br>
+index 610b22cc7..1cad09f3e 100644<br>
+--- a/core/arch/arm/kernel/<a href=3D"http://link.mk" rel=3D"noreferrer no=
referrer" target=3D"_blank">link.mk</a><br>
++++ b/core/arch/arm/kernel/<a href=3D"http://link.mk" rel=3D"noreferrer no=
referrer" target=3D"_blank">link.mk</a><br>
+@@ -23,13 +23,13 @@ ifeq ($(CFG_CORE_BTI),y)<br>
+ # force-bti tells the linker to warn if some object files lack the .note.=
gnu.property<br>
+ # section with the BTI flag, and to turn on the BTI flag in the output an=
yway. The<br>
+ # resulting executable would likely fail at runtime so we use this flag a=
long<br>
+-# with the --fatal-warnings below to check and prevent this situation (wi=
th useful<br>
++# with the=C2=A0 below to check and prevent this situation (with useful<b=
r>
+ # diagnostics).<br>
+-link-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings<br>
++link-ldflags +=3D $(call ld-option,-z force-bti) <br>
+ endif<br>
+ link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-out-dir)/tee.map<br>
+ link-ldflags +=3D --sort-section=3Dalignment<br>
+-link-ldflags +=3D --fatal-warnings<br>
++link-ldflags +=3D <br>
+ link-ldflags +=3D --gc-sections<br>
+ <br>
+ link-ldadd=C2=A0 =3D $(LDADD)<br>
+diff --git a/ldelf/<a href=3D"http://link.mk" rel=3D"noreferrer noreferrer=
" target=3D"_blank">link.mk</a> b/ldelf/<a href=3D"http://link.mk" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">link.mk</a><br>
+index 64c8212a0..dee806428 100644<br>
+--- a/ldelf/<a href=3D"http://link.mk" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">link.mk</a><br>
++++ b/ldelf/<a href=3D"http://link.mk" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">link.mk</a><br>
+@@ -18,7 +18,7 @@ link-ldflags +=3D -Map=3D$(link-out-dir$(sm))/ldelf.map<=
br>
+ link-ldflags +=3D --sort-section=3Dalignment<br>
+ link-ldflags +=3D -z max-page-size=3D4096 # OP-TEE always uses 4K alignme=
nt<br>
+ ifeq ($(CFG_CORE_BTI),y)<br>
+-link-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings<br>
++link-ldflags +=3D $(call ld-option,-z force-bti) <br>
+ endif<br>
+ link-ldflags +=3D $(link-ldflags$(sm))<br>
+ <br>
+diff --git a/mk/<a href=3D"http://lib.mk" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">lib.mk</a> b/mk/<a href=3D"http://lib.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">lib.mk</a><br>
+index 30f2040a3..82ede2954 100644<br>
+--- a/mk/<a href=3D"http://lib.mk" rel=3D"noreferrer noreferrer" target=3D=
"_blank">lib.mk</a><br>
++++ b/mk/<a href=3D"http://lib.mk" rel=3D"noreferrer noreferrer" target=3D=
"_blank">lib.mk</a><br>
+@@ -60,7 +60,7 @@ $(lib-libfile): $(objs)<br>
+ endif<br>
+ ifeq ($(CFG_ULIBS_SHARED),y)<br>
+ ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)<br>
+-lib-ldflags$(libuuid) +=3D $$(call ld-option,-z force-bti) --fatal-warnin=
gs<br>
++lib-ldflags$(libuuid) +=3D $$(call ld-option,-z force-bti) <br>
+ endif<br>
+ $(lib-shlibfile): $(objs) $(lib-needed-so-files)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(cmd-echo-silent) &#39;=C2=A0 LD=C2=A0 =C2=A0=
 =C2=A0 $$@&#39;<br>
+diff --git a/ta/arch/arm/<a href=3D"http://link.mk" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">link.mk</a> b/ta/arch/arm/<a href=3D"http://link.=
mk" rel=3D"noreferrer noreferrer" target=3D"_blank">link.mk</a><br>
+index ec5c8db67..f02f7ad5b 100644<br>
+--- a/ta/arch/arm/<a href=3D"http://link.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">link.mk</a><br>
++++ b/ta/arch/arm/<a href=3D"http://link.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">link.mk</a><br>
+@@ -32,7 +32,7 @@ link-ldflags +=3D -Map=3D$(link-out-dir$(sm))/$(user-ta-=
uuid).map<br>
+ link-ldflags +=3D --sort-section=3Dalignment<br>
+ link-ldflags +=3D -z max-page-size=3D4096 # OP-TEE always uses 4K alignme=
nt<br>
+ ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)<br>
+-link-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings<br>
++link-ldflags +=3D $(call ld-option,-z force-bti) <br>
+ endif<br>
+ link-ldflags +=3D --as-needed # Do not add dependency on unused shlib<br>
+ link-ldflags +=3D $(link-ldflags$(sm))<br>
+diff --git a/ta/arch/arm/<a href=3D"http://link_shlib.mk" rel=3D"noreferre=
r noreferrer" target=3D"_blank">link_shlib.mk</a> b/ta/arch/arm/<a href=3D"=
http://link_shlib.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">link_=
shlib.mk</a><br>
+index 0cdf3bfa6..3b696b6a9 100644<br>
+--- a/ta/arch/arm/<a href=3D"http://link_shlib.mk" rel=3D"noreferrer noref=
errer" target=3D"_blank">link_shlib.mk</a><br>
++++ b/ta/arch/arm/<a href=3D"http://link_shlib.mk" rel=3D"noreferrer noref=
errer" target=3D"_blank">link_shlib.mk</a><br>
+@@ -21,7 +21,7 @@ shlink-ldflags=C2=A0 =3D $(LDFLAGS)<br>
+ shlink-ldflags +=3D -shared -z max-page-size=3D4096<br>
+ shlink-ldflags +=3D $(call ld-option,-z separate-loadable-segments)<br>
+ ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)<br>
+-shlink-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings<br>
++shlink-ldflags +=3D $(call ld-option,-z force-bti) <br>
+ endif<br>
+ shlink-ldflags +=3D --as-needed # Do not add dependency on unused shlib<b=
r>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappen=
d b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend<br>
index 4300c1a9..30ba6d35 100644<br>
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend<br>
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend<br>
@@ -1,2 +1,4 @@<br>
+FILESEXTRAPATHS:prepend:ti-soc :=3D &quot;${THISDIR}/${PN}:&quot;<br>
=C2=A0PV:ti-soc =3D &quot;3.17.0+git${SRCPV}&quot;<br>
=C2=A0SRCREV:ti-soc =3D &quot;15a746d28d10df3d79d72bc9fe4a5a654b88bcca&quot=
;<br>
+SRC_URI:append:ti-soc =3D &quot; file://0001-Binutils-2.39-now-warns-when-=
a-segment-has-RXW-permi.patch&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000acd81905ebeafa95--

