Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8E3C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 19:26:53 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.155.1672860405267274421
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 11:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AMNg8RUk;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id k4so31830460vsc.4
        for <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 11:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yxI90711i2LARze35b1Waof3AZzhoz5+ikog6oOZGpQ=;
        b=AMNg8RUkw0jLVTsnzqWl6sBcI2UgDEFry7oaD25z9TRKiBniBSVvSnwGwbUIZMEWjl
         g9A+zFJ/1JHTBUfsBAuR6VDgeHBjU/s25BnZ3XzmJB2o3/iypn6meipJC/9yoWBV3IIP
         mXId1lFZrUcHK/viXmgDmx+kVLJak3Jy6xNuL/0fcsWEAZSjA9t3s+HUHGz9YUPubJO1
         fYRK2m+hRSL730w8MPJbAWt0d3v5ICXwPxemDuCfuQ+vr8sZwCOOfIor+MbEKVQJZYnw
         ZLaKcnmCvmzcnPpgk76gWB8sV43qFHwH5oWuQk+msAbU+eamG71i75pi0pZcM1tPQ6K+
         y3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxI90711i2LARze35b1Waof3AZzhoz5+ikog6oOZGpQ=;
        b=OGSUoINtJZ9RT9/BsVvw/p1yMR0rK4mOiOAFpuxXzP41LMo/dYTNL9sBisHfnsVmol
         dp1fCn0E6yyQsDQ8gV5p/KZzSXhAF3cvw1DwxCJsOOvYDkaDUuJH/sdk+xz4ThpC8tcx
         Ju7CyC6AdwDknylPeUvl+vbSPNn+KP5xFrNPlDCoUycN9ry8nOaODXZldOTRX1Z5sYos
         BJq3KTT2ALwloVII0SMqoQtfDGhAciE/eBCGJYTMAK6hRL3cxPb6BrqQAiY0cH0xuAan
         +JxW5nIz6b26SgZaKyyovwHNydNdsKsFQwFDgkgbggnzbRr2SWpR1fxrAUHgMBVKJ7kN
         W+ug==
X-Gm-Message-State: AFqh2krvHg/ENXH11DLg66Tv6iYYKjKP1o+Xs+gZzWA4uhAb3KopBGHE
	KT1MR5WzNYuBMU81YRB8oFHBLOr4bGnFZIbOxfizbZZdnOtKRb5E
X-Google-Smtp-Source: AMrXdXtHH6yKDBbryPpE9xE8ygpNdizBbb+HDfVbYgAu6A8eVYQxlNPt1AIdVlbdCfNfZzq7XS2Hq1+KNKHGUV5Ov7I=
X-Received: by 2002:a05:6102:2912:b0:3ce:a98f:151e with SMTP id
 cz18-20020a056102291200b003cea98f151emr760437vsb.60.1672860404335; Wed, 04
 Jan 2023 11:26:44 -0800 (PST)
MIME-Version: 1.0
References: <20221213210653.2450345-1-denis@denix.org> <17309F13F05580D3.9432@lists.yoctoproject.org>
In-Reply-To: <17309F13F05580D3.9432@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 4 Jan 2023 19:26:33 +0000
Message-ID: <CANPvuRk6he2gUYCRe91omhw8ryyN2AmLA4UsDBMvxp_HeeS55w@mail.gmail.com>
Subject: Re: [meta-ti] [dunfell][PATCH] k3: also inherit kernel-fitimage class
 for FIT image generation
To: quaresma.jose@gmail.com
Cc: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org, 
	Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
Content-Type: multipart/alternative; boundary="00000000000028c9f105f1752ad1"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 19:26:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15523

--00000000000028c9f105f1752ad1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Friendly ping :)

thanks

Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
gmail.com@lists.yoctoproject.org> escreveu no dia quarta, 14/12/2022 =C3=A0=
(s)
09:32:

> Hi Denys,
>
> Tested this locally and it fixes the following issue:
>
> | make[1]: *** No rule to make target 'fitImage'.  Stop.
> | make: *** [/build/tmp/work-shared/am64xx-evm/kernel-source/Makefile:185=
:
> __sub-make] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of
> '/build/tmp/work/am64xx_evm-poky-linux/linux-ti-staging/5.10.158+gitAUTOI=
NC+14d010266b-r0b/temp/run.do_compile.2076'
> failed with exit code 1
> ERROR: Task
> (/build/../work/meta-ti/recipes-kernel/linux/linux-ti-staging_5.10.bb:do_=
compile)
> failed with exit code '1'
>
> Tested-by: Jose Quaresma <jose.quaresma@foundries.io>
>
> Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=C3=A7a, 13/12/202=
2
> =C3=A0(s) 21:06:
>
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> In order to support fitImage image type, kernel-fitimage class is needed=
.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> (cherry picked from kirkstone/master commit
>> 48b22e8266ba0358b5b7319faa75ad731a350db7)
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>  conf/machine/include/k3.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
>> index 349f4fda..81139571 100644
>> --- a/conf/machine/include/k3.inc
>> +++ b/conf/machine/include/k3.inc
>> @@ -16,6 +16,7 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>>
>>  KERNEL_IMAGETYPE =3D "Image"
>>  KERNEL_IMAGETYPES =3D "Image fitImage"
>> +KERNEL_CLASSES +=3D "kernel-fitimage"
>>
>>  UBOOT_ARCH =3D "arm"
>>  UBOOT_ENTRYPOINT =3D "0x80008000"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15474):
> https://lists.yoctoproject.org/g/meta-ti/message/15474
> Mute This Topic: https://lists.yoctoproject.org/mt/95653946/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000028c9f105f1752ad1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(0,0,0)">Friendly=C2=A0</span><spa=
n style=3D"color:rgb(0,0,0)">ping :)<br></span><span style=3D"color:rgb(0,0=
,0)"><br>thanks</span><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.yoctopr=
oject.org">lists.yoctoproject.org</a> &lt;quaresma.jose=3D<a href=3D"mailto=
:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt;=
 escreveu no dia quarta, 14/12/2022 =C3=A0(s) 09:32:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi=C2=A0Denys,<br><br=
>Tested this locally and it fixes the following issue:<br><br>| make[1]: **=
* No rule to make target &#39;fitImage&#39;.=C2=A0 Stop.<br>| make: *** [/b=
uild/tmp/work-shared/am64xx-evm/kernel-source/Makefile:185: __sub-make] Err=
or 2<br>| ERROR: oe_runmake failed<br>| WARNING: exit code 1 from a shell c=
ommand.<br>| ERROR: Execution of &#39;/build/tmp/work/am64xx_evm-poky-linux=
/linux-ti-staging/5.10.158+gitAUTOINC+14d010266b-r0b/temp/run.do_compile.20=
76&#39; failed with exit code 1<br>ERROR: Task (/build/../work/meta-ti/reci=
pes-kernel/linux/linux-ti-staging_5.10.bb:do_compile) failed with exit code=
 &#39;1&#39;<br><br>Tested-by: Jose Quaresma &lt;<a href=3D"mailto:jose.qua=
resma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank"=
>denis@denix.org</a>&gt; escreveu no dia ter=C3=A7a, 13/12/2022 =C3=A0(s) 2=
1:06:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Deny=
s Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" target=3D"_blank">d=
enys@konsulko.com</a>&gt;<br>
<br>
In order to support fitImage image type, kernel-fitimage class is needed.<b=
r>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" =
target=3D"_blank">denys@konsulko.com</a>&gt;<br>
Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" target=3D"=
_blank">reatmon@ti.com</a>&gt;<br>
(cherry picked from kirkstone/master commit 48b22e8266ba0358b5b7319faa75ad7=
31a350db7)<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsulko.com" =
target=3D"_blank">denys@konsulko.com</a>&gt;<br>
---<br>
=C2=A0conf/machine/include/k3.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc<br>
index 349f4fda..81139571 100644<br>
--- a/conf/machine/include/k3.inc<br>
+++ b/conf/machine/include/k3.inc<br>
@@ -16,6 +16,7 @@ PREFERRED_PROVIDER_u-boot =3D &quot;u-boot-ti-staging&quo=
t;<br>
<br>
=C2=A0KERNEL_IMAGETYPE =3D &quot;Image&quot;<br>
=C2=A0KERNEL_IMAGETYPES =3D &quot;Image fitImage&quot;<br>
+KERNEL_CLASSES +=3D &quot;kernel-fitimage&quot;<br>
<br>
=C2=A0UBOOT_ARCH =3D &quot;arm&quot;<br>
=C2=A0UBOOT_ENTRYPOINT =3D &quot;0x80008000&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15474): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15474" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15474</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95653946/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/95653946/5052612</a><br>
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

--00000000000028c9f105f1752ad1--

