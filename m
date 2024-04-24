Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71396C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 22:47:06 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.3286.1713998822617634617
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 15:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=p5C7mB4D;
 spf=pass (domain: criticallink.com, ip: 209.85.167.46, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d2600569so396959e87.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 24 Apr 2024 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1713998820; x=1714603620; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUpS5Gm2U6S2kCjFpoILVecoBdwUGoYq4+eIrp9ZeV0=;
        b=p5C7mB4Dxk7o6mHqxvFuafORYCP4fjU/KILxJjDkVWXlmmoQatYHUEYZ6ep9/IKVHL
         soLmkTde25lUVPjxN0+CaqOT5dy2tCqY0v+ZHcdDb/SY3ZenASFUe4MAMe24tFwztvqu
         78abTdnOtZmgTAmBVU1ccLgPLRLsHRIX7r5f4WaA0wNht5Vi1rHVMWC4i82UkkVgI8v0
         QKNaSSR2JI7x1obhlXqtx5i2koYvV4qn8dj49HYI6dy6d0acmBL1dutLOFaF/GA1EWjn
         EXmfSXpJvDsGoFrUxL4QOQh60p+xilx4qIPbcmxAZnDqKAGnwJsgWZPN5TnIAllHxGdS
         xRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713998820; x=1714603620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUpS5Gm2U6S2kCjFpoILVecoBdwUGoYq4+eIrp9ZeV0=;
        b=qJ5scLg3FC4W+WrjIAiNbFFUHxqKa3pMq1OfZe60WyhL5tlTfhX+Ku6kdaQgeJvBR/
         GtFaIUuPz24grYXg4ZYgGip6rmyIEmtA6WqpdD5V6j7iZLv5uHg8h9kxx++gfg5rpH75
         Np6c0PWWtsYsNqcCw097oMJv6w5mq2z8B3SQjSx/BpuBeOpaCP7KeRXJtA5l+sccpFju
         gs8wxfGObg00Ya+ayS7sT5xMCCJ0LZqOBJLrJsyLXtyADqafNzmlBviAoLlQxNq06AV1
         ogUACTFLCph6FG4WG4lST0sSMOqjipU/nKSfDjxwUYZwkqmNnHl3SOigZTaK4dZaz7VT
         yN/g==
X-Gm-Message-State: AOJu0Yys9T4MXHXu5evX1nUiuNL88FZ1qm+NacL2C0aC2PLI2fJQPxBY
	/Hw4qOoQGL4iWLU7ioH8XpSMPHbfnHxOLt/6MkL4XPlHB67aoZplcczan4oBF/KYaheBJOXwkP4
	gFSIIeDQIacBr7lNPpTcptdDrft0UTxzofaO4
X-Google-Smtp-Source: AGHT+IGxJKzWoseBEsmP5UWFHQ+WcQUo61BuC9foHzuDTXLzZWNnXqJpCVn9rrWf9kHkSg3dfMwN+n7rqtyQOnBY/r0=
X-Received: by 2002:ac2:4e97:0:b0:51b:43d4:2f18 with SMTP id
 o23-20020ac24e97000000b0051b43d42f18mr2572247lfr.46.1713998820404; Wed, 24
 Apr 2024 15:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240424223624.1938639-1-denis@denix.org>
In-Reply-To: <20240424223624.1938639-1-denis@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 24 Apr 2024 12:46:48 -1000
Message-ID: <CADL8D3axA893RdRHLVLjhiUyAnX0XHRXtxx993J_U4LhAewpyw@mail.gmail.com>
Subject: Re: [meta-ti] [master/scarthgap/kirkstone][PATCH v2] wic: prevent
 boot FAT partition mounting under /boot
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000d60fad0616df728d"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Apr 2024 22:47:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17599

--000000000000d60fad0616df728d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>

On Wed, Apr 24, 2024, 12:36=E2=80=AFPM Denys Dmytriyenko via lists.yoctopro=
ject.org
<denis=3Ddenix.org@lists.yoctoproject.org> wrote:

> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Separate FAT boot partition holds SPL, SYSFW and U-boot images, while
> rootfs places kernel images and DTBs into /boot directory. So it is not
> desirable to mount boot FAT partition into /boot directory of the rootfs
> and shadow its original content - adjust corresponding entry in wic
> templates.
>
> While at it, remove unused ondisk parameter when using use-uuid, which
> takes precedence and is more flexible.
>
> Note: boot FAT partition will be automounted at /run/media/boot-mmcblk0p1=
/
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> v2 changes:
> * remove <mountpoint> from boot partition to avoid undocumented behavior
> * add explicit size specifier to --fixed-size 128M
>
>  meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 3 ++-
>  meta-ti-bsp/wic/sdimage-2part.wks        | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/
> sdimage-2part-efi.wks.in
> index 2213a348..ca042be1 100644
> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> @@ -2,6 +2,7 @@
>  # long-description: Creates a partitioned SD card image for TI platforms
> that
>  # supports EFI.  Boot files are located in the first vfat partition with
> extra
>  # reserved space.  We cannot use a GPT here.
> +
>  bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4"
> -part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}"
> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed-siz=
e
> 128M
> +part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER}"
> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed-siz=
e
> 128M
>  part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
> diff --git a/meta-ti-bsp/wic/sdimage-2part.wks
> b/meta-ti-bsp/wic/sdimage-2part.wks
> index 3eab9407..5073176e 100644
> --- a/meta-ti-bsp/wic/sdimage-2part.wks
> +++ b/meta-ti-bsp/wic/sdimage-2part.wks
> @@ -2,5 +2,5 @@
>  # long-description: Creates a partitioned SD card image for TI platforms=
.
>  # Boot files are located in the first vfat partition with extra reserved
> space.
>
> -part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=3Dvfat
> --label boot --active --align 1024 --fixed-size 128 --use-uuid
> -part / --source rootfs --ondisk mmcblk0 --fstype=3Dext4 --label root
> --align 1024 --use-uuid
> +part --source bootimg-partition --fstype=3Dvfat --label boot --active
> --align 1024 --use-uuid --fixed-size 128M
> +part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17598):
> https://lists.yoctoproject.org/g/meta-ti/message/17598
> Mute This Topic: https://lists.yoctoproject.org/mt/105720331/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d60fad0616df728d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"color:rgb(255,237,235);font-family:&quot;g=
oogle sans&quot;,roboto,&quot;helvetica neue&quot;,arial,sans-serif;font-si=
ze:16px;background-color:rgb(48,35,34)">Reviewed-by: Jonathan Cormier &lt;<=
a href=3D"mailto:jcormier@criticallink.com">jcormier@criticallink.com</a>&g=
t;</span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Apr 24, 2024, 12:36=E2=80=AFPM Denys Dmytriyenko via <a hr=
ef=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;denis=
=3D<a href=3D"mailto:denix.org@lists.yoctoproject.org">denix.org@lists.yoct=
oproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: D=
enys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" target=3D"_blank=
" rel=3D"noreferrer">denys@konsulko.com</a>&gt;<br>
<br>
Separate FAT boot partition holds SPL, SYSFW and U-boot images, while<br>
rootfs places kernel images and DTBs into /boot directory. So it is not<br>
desirable to mount boot FAT partition into /boot directory of the rootfs<br=
>
and shadow its original content - adjust corresponding entry in wic<br>
templates.<br>
<br>
While at it, remove unused ondisk parameter when using use-uuid, which<br>
takes precedence and is more flexible.<br>
<br>
Note: boot FAT partition will be automounted at /run/media/boot-mmcblk0p1/<=
br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" =
target=3D"_blank" rel=3D"noreferrer">denys@konsulko.com</a>&gt;<br>
---<br>
v2 changes:<br>
* remove &lt;mountpoint&gt; from boot partition to avoid undocumented behav=
ior<br>
* add explicit size specifier to --fixed-size 128M<br>
<br>
=C2=A0meta-ti-bsp/wic/<a href=3D"http://sdimage-2part-efi.wks.in" rel=3D"no=
referrer noreferrer" target=3D"_blank">sdimage-2part-efi.wks.in</a> | 3 ++-=
<br>
=C2=A0meta-ti-bsp/wic/sdimage-2part.wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--=
<br>
=C2=A02 files changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-ti-bsp/wic/<a href=3D"http://sdimage-2part-efi.wks.in" re=
l=3D"noreferrer noreferrer" target=3D"_blank">sdimage-2part-efi.wks.in</a> =
b/meta-ti-bsp/wic/<a href=3D"http://sdimage-2part-efi.wks.in" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">sdimage-2part-efi.wks.in</a><br>
index 2213a348..ca042be1 100644<br>
--- a/meta-ti-bsp/wic/<a href=3D"http://sdimage-2part-efi.wks.in" rel=3D"no=
referrer noreferrer" target=3D"_blank">sdimage-2part-efi.wks.in</a><br>
+++ b/meta-ti-bsp/wic/<a href=3D"http://sdimage-2part-efi.wks.in" rel=3D"no=
referrer noreferrer" target=3D"_blank">sdimage-2part-efi.wks.in</a><br>
@@ -2,6 +2,7 @@<br>
=C2=A0# long-description: Creates a partitioned SD card image for TI platfo=
rms that<br>
=C2=A0# supports EFI.=C2=A0 Boot files are located in the first vfat partit=
ion with extra<br>
=C2=A0# reserved space.=C2=A0 We cannot use a GPT here.<br>
+<br>
=C2=A0bootloader --timeout=3D3 --append=3D&quot;rootfstype=3Dext4&quot;<br>
-part /boot --source bootimg-efi --sourceparams=3D&quot;loader=3D${EFI_PROV=
IDER}&quot; --fstype=3Dvfat --label boot --active --align 1024 --use-uuid -=
-fixed-size 128M<br>
+part --source bootimg-efi --sourceparams=3D&quot;loader=3D${EFI_PROVIDER}&=
quot; --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed=
-size 128M<br>
=C2=A0part / --source rootfs --fstype=3Dext4 --label root --align 1024 --us=
e-uuid<br>
diff --git a/meta-ti-bsp/wic/sdimage-2part.wks b/meta-ti-bsp/wic/sdimage-2p=
art.wks<br>
index 3eab9407..5073176e 100644<br>
--- a/meta-ti-bsp/wic/sdimage-2part.wks<br>
+++ b/meta-ti-bsp/wic/sdimage-2part.wks<br>
@@ -2,5 +2,5 @@<br>
=C2=A0# long-description: Creates a partitioned SD card image for TI platfo=
rms.<br>
=C2=A0# Boot files are located in the first vfat partition with extra reser=
ved space.<br>
<br>
-part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=3Dvfat --l=
abel boot --active --align 1024 --fixed-size 128 --use-uuid<br>
-part / --source rootfs --ondisk mmcblk0 --fstype=3Dext4 --label root --ali=
gn 1024 --use-uuid<br>
+part --source bootimg-partition --fstype=3Dvfat --label boot --active --al=
ign 1024 --use-uuid --fixed-size 128M<br>
+part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-uui=
d<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17598): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17598" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/lists.yoctoproject.org/g/meta-ti/message/17598</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105720331/790=
2621" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/105720331/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank" rel=3D"noreferrer">meta-ti+owner@lists.yoctoproject.org</a><b=
r>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/g/meta-ti/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=
=3D"_blank" rel=3D"noreferrer">jcormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d60fad0616df728d--

