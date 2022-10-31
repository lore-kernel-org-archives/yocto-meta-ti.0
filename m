Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052E8FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 19:25:50 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.127.1667244343385815765
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 Oct 2022 12:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=asq3WhG5;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id d25so20350610lfb.7
        for <meta-ti@lists.yoctoproject.org>; Mon, 31 Oct 2022 12:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9xbMFeOaLCCes/UaWy/u7pkZQ0zoeY0PeA5HH3bihtk=;
        b=asq3WhG5lvuId/f5YjQySrFG824OfxYhjO69eKgyZ3JO2JovjxU9toBNScMKIBhUmb
         /VE7TXzlDw1bkD9NsSZdMiv8NaikPsoRFBjOMGlDCP0b/yuvLTExk8iCCthEKRp/yLLh
         od6KI/N97TgWBe/G+aMOqMbqaMrBUWQWIG60vWnQlWMlHzsYENYPzkoBPsP/dm/s79pJ
         MiUnl3Mzc1uUFjfC4PFCCzbEPJURNFiDkwHmIRH9+fZc+vgCh+KC8Ie34wsJfqh5o+J5
         3qbac0HjHFuRBpmCTxzB/R27WfZ32O2azwQXeA8jE0M8Ee07+WMqYzVQSbIxcUAILerX
         GGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xbMFeOaLCCes/UaWy/u7pkZQ0zoeY0PeA5HH3bihtk=;
        b=woQd7+4WHbTkgnAlTeeOzEs+hFHzoPIUBV6n2VS1iNNoiJbXhgFQvWRyou644FSMNU
         8H0/zA5fqf4N7dx/YMSptDAEzuBwgR2DbqBv1jel2HQXCJtgv7QwcUaMarcBfj45D353
         rTIaDOBNxlJuKgSbEajbd+OCVrXH40C1HXHfYTl1quzLKELy7QpDt7wWiGgIwuCBb8cA
         BLP2XqtY66R1A24TZBdp8TBY2s6ajRzuZn73N6Xlv8d+kCGgY5A8w+KOm8GsyxLLYIAr
         Vdz/8VODJf+gJHp8aruTXR1rR/kCLF54VdJ2aulWxzO4prYsWM4i3y9mYbIpOJmngQW/
         D6ZQ==
X-Gm-Message-State: ACrzQf0YwapZB5t986OGcf6cB/NIF0nx6UKiAIGGcq0jPAWzdt+VebN3
	sV3sjB4RCwQSnos7t3tH6/5lpytoThm2PH2qCIM=
X-Google-Smtp-Source: AMsMyM6Hj102phpVjdic1dU4/v59aGKxiY9hp3IveXXoZuEwq5ssT4klkW41X7yGTfFSNWB+L13NoCoX1OJU6k3jx5A=
X-Received: by 2002:ac2:47fc:0:b0:4a2:4e9a:64f5 with SMTP id
 b28-20020ac247fc000000b004a24e9a64f5mr6431609lfp.434.1667244341428; Mon, 31
 Oct 2022 12:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221017102508.1999292-1-jose.quaresma@foundries.io>
 <20221017102508.1999292-2-jose.quaresma@foundries.io> <17218DE3F95CEA6D.492@lists.yoctoproject.org>
In-Reply-To: <17218DE3F95CEA6D.492@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 31 Oct 2022 19:25:03 +0000
Message-ID: <CANPvuR=EvAhC+nnsLw9L3mu2vjPF7s97oemaR1AVQeodD-MQ3A@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH 2/2] optee-os-tadevkit: fix binutils segment has
 RXW permissions
To: quaresma.jose@gmail.com
Cc: meta-ti@lists.yoctoproject.org, Ricardo Salveti <ricardo@foundries.io>, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000b987e505ec599261"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 31 Oct 2022 19:25:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15213

--000000000000b987e505ec599261
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi meta-ti maintainer,

Is there any issue with this patch that I need to address?
It was sent a few days ago and there is no feedback.

Best regards,
Jose

Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
gmail.com@lists.yoctoproject.org> escreveu no dia quarta, 26/10/2022 =C3=A0=
(s)
08:29:

> Ping
>
> A segunda, 17/10/2022, 11:25, Jose Quaresma <quaresma.jose@gmail.com>
> escreveu:
>
>> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> ---
>>  ...w-warns-when-a-segment-has-RXW-permi.patch | 104 ++++++++++++++++++
>>  .../optee/optee-os-tadevkit_%.bbappend        |   2 +
>>  2 files changed, 106 insertions(+)
>>  create mode 100644
>> meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-=
now-warns-when-a-segment-has-RXW-permi.patch
>>
>> diff --git
>> a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.3=
9-now-warns-when-a-segment-has-RXW-permi.patch
>> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.3=
9-now-warns-when-a-segment-has-RXW-permi.patch
>> new file mode 100644
>> index 00000000..ed3d1973
>> --- /dev/null
>> +++
>> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.3=
9-now-warns-when-a-segment-has-RXW-permi.patch
>> @@ -0,0 +1,104 @@
>> +From 8efd62bd8aec2a45ae0e3505d2bb1d3b05d1be50 Mon Sep 17 00:00:00 2001
>> +From: Jose Quaresma <jose.quaresma@foundries.io>
>> +Date: Mon, 17 Oct 2022 08:56:59 +0000
>> +Subject: [PATCH] Binutils 2.39 now warns when a segment has RXW
>> + permissions[1].
>> +
>> +As we use the --fatal-warnings the build is falling:
>> +
>> +| aarch64-lmp-linux-ld.bfd: warning:
>> /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+git=
AUTOINC+15a746d28d-r0/build/core/all_objs.o
>> has a LOAD segment with RWX permissions
>> +| aarch64-lmp-linux-ld.bfd: warning:
>> /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+git=
AUTOINC+15a746d28d-r0/build/core/unpaged.o
>> has a LOAD segment with RWX permissions
>> +| aarch64-lmp-linux-ld.bfd: warning:
>> /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+git=
AUTOINC+15a746d28d-r0/build/core/init.o
>> has a LOAD segment with RWX permissions
>> +| aarch64-lmp-linux-ld.bfd: warning:
>> /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+git=
AUTOINC+15a746d28d-r0/build/core/tee.elf
>> has a LOAD segment with RWX permissions
>> +
>> +So as temporary solution, remove --fatal-warnings from the source code:
>> +
>> +| sed -e "s:--fatal-warnings::g" -i core/arch/arm/kernel/link.mk mk/
>> lib.mk ldelf/link.mk ta/arch/arm/link.mk ta/arch/arm/link_shlib.mk
>> +
>> +[1]
>> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dba951afb=
99912da01a6e8434126b8fac7aa75107
>> +
>> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> +---
>> + core/arch/arm/kernel/link.mk | 6 +++---
>> + ldelf/link.mk                | 2 +-
>> + mk/lib.mk                    | 2 +-
>> + ta/arch/arm/link.mk          | 2 +-
>> + ta/arch/arm/link_shlib.mk    | 2 +-
>> + 5 files changed, 7 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.m=
k
>> +index 610b22cc7..1cad09f3e 100644
>> +--- a/core/arch/arm/kernel/link.mk
>> ++++ b/core/arch/arm/kernel/link.mk
>> +@@ -23,13 +23,13 @@ ifeq ($(CFG_CORE_BTI),y)
>> + # force-bti tells the linker to warn if some object files lack the
>> .note.gnu.property
>> + # section with the BTI flag, and to turn on the BTI flag in the output
>> anyway. The
>> + # resulting executable would likely fail at runtime so we use this fla=
g
>> along
>> +-# with the --fatal-warnings below to check and prevent this situation
>> (with useful
>> ++# with the  below to check and prevent this situation (with useful
>> + # diagnostics).
>> +-link-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings
>> ++link-ldflags +=3D $(call ld-option,-z force-bti)
>> + endif
>> + link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-out-dir)/tee.map
>> + link-ldflags +=3D --sort-section=3Dalignment
>> +-link-ldflags +=3D --fatal-warnings
>> ++link-ldflags +=3D
>> + link-ldflags +=3D --gc-sections
>> +
>> + link-ldadd  =3D $(LDADD)
>> +diff --git a/ldelf/link.mk b/ldelf/link.mk
>> +index 64c8212a0..dee806428 100644
>> +--- a/ldelf/link.mk
>> ++++ b/ldelf/link.mk
>> +@@ -18,7 +18,7 @@ link-ldflags +=3D -Map=3D$(link-out-dir$(sm))/ldelf.m=
ap
>> + link-ldflags +=3D --sort-section=3Dalignment
>> + link-ldflags +=3D -z max-page-size=3D4096 # OP-TEE always uses 4K alig=
nment
>> + ifeq ($(CFG_CORE_BTI),y)
>> +-link-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings
>> ++link-ldflags +=3D $(call ld-option,-z force-bti)
>> + endif
>> + link-ldflags +=3D $(link-ldflags$(sm))
>> +
>> +diff --git a/mk/lib.mk b/mk/lib.mk
>> +index 30f2040a3..82ede2954 100644
>> +--- a/mk/lib.mk
>> ++++ b/mk/lib.mk
>> +@@ -60,7 +60,7 @@ $(lib-libfile): $(objs)
>> + endif
>> + ifeq ($(CFG_ULIBS_SHARED),y)
>> + ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
>> +-lib-ldflags$(libuuid) +=3D $$(call ld-option,-z force-bti)
>> --fatal-warnings
>> ++lib-ldflags$(libuuid) +=3D $$(call ld-option,-z force-bti)
>> + endif
>> + $(lib-shlibfile): $(objs) $(lib-needed-so-files)
>> +       @$(cmd-echo-silent) '  LD      $$@'
>> +diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
>> +index ec5c8db67..f02f7ad5b 100644
>> +--- a/ta/arch/arm/link.mk
>> ++++ b/ta/arch/arm/link.mk
>> +@@ -32,7 +32,7 @@ link-ldflags +=3D
>> -Map=3D$(link-out-dir$(sm))/$(user-ta-uuid).map
>> + link-ldflags +=3D --sort-section=3Dalignment
>> + link-ldflags +=3D -z max-page-size=3D4096 # OP-TEE always uses 4K alig=
nment
>> + ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
>> +-link-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings
>> ++link-ldflags +=3D $(call ld-option,-z force-bti)
>> + endif
>> + link-ldflags +=3D --as-needed # Do not add dependency on unused shlib
>> + link-ldflags +=3D $(link-ldflags$(sm))
>> +diff --git a/ta/arch/arm/link_shlib.mk b/ta/arch/arm/link_shlib.mk
>> +index 0cdf3bfa6..3b696b6a9 100644
>> +--- a/ta/arch/arm/link_shlib.mk
>> ++++ b/ta/arch/arm/link_shlib.mk
>> +@@ -21,7 +21,7 @@ shlink-ldflags  =3D $(LDFLAGS)
>> + shlink-ldflags +=3D -shared -z max-page-size=3D4096
>> + shlink-ldflags +=3D $(call ld-option,-z separate-loadable-segments)
>> + ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
>> +-shlink-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings
>> ++shlink-ldflags +=3D $(call ld-option,-z force-bti)
>> + endif
>> + shlink-ldflags +=3D --as-needed # Do not add dependency on unused shli=
b
>> +
>> +--
>> +2.34.1
>> +
>> diff --git
>> a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> index 4300c1a9..30ba6d35 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> @@ -1,2 +1,4 @@
>> +FILESEXTRAPATHS:prepend:ti-soc :=3D "${THISDIR}/${PN}:"
>>  PV:ti-soc =3D "3.17.0+git${SRCPV}"
>>  SRCREV:ti-soc =3D "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
>> +SRC_URI:append:ti-soc =3D "
>> file://0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch"
>> --
>> 2.34.1
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15203):
> https://lists.yoctoproject.org/g/meta-ti/message/15203
> Mute This Topic: https://lists.yoctoproject.org/mt/94381078/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b987e505ec599261
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi meta-ti maintainer,<br><br>Is there any issue with this=
 patch that I need to address?<br>It was sent a few days ago and there is n=
o feedback.<br><br>Best regards,<br>Jose</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http:/=
/lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;quaresma.jose=3D<a =
href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproje=
ct.org</a>&gt; escreveu no dia quarta, 26/10/2022 =C3=A0(s) 08:29:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Ping</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">A =
segunda, 17/10/2022, 11:25, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jo=
se@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; escreveu:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Jo=
se Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" rel=3D"norefe=
rrer" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
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
+From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" rel=
=3D"noreferrer" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
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
.io" rel=3D"noreferrer" target=3D"_blank">jose.quaresma@foundries.io</a>&gt=
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15203): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15203" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15203</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94381078/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94381078/5052612</a><br>
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
 Quaresma</div></div></div>

--000000000000b987e505ec599261--

