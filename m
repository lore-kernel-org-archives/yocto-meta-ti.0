Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E2CC636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 13:51:51 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web11.83759.1675777908197664009
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 05:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=AecT/34d;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71]) by mx-outbound8-152.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 07 Feb 2023 13:51:42 +0000
Received: by mail-lf1-f71.google.com with SMTP id k3-20020a05651239c300b004cca10c5ae6so6264474lfu.9
        for <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 05:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1dsXrz+Sprjg8C/se7H3BNo3nH73XhmjJyprTU6Sh2Y=;
        b=AecT/34dSPODPB4xYqV8HpxJF3J23WHDMfQWwSq83u3bYoyi9vvr9MP/RZpMQEUlmp
         fFKf0e3vC/+6vRUZPHUvsY2XedtmGDZ2Y7rZfua8noGyc9Z4VcNoaTsmefsKLEocRNZg
         WBC3QqgzBoynUWyCQIpC1Ef7+4E06BPWGWibw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dsXrz+Sprjg8C/se7H3BNo3nH73XhmjJyprTU6Sh2Y=;
        b=EfGf5TKRcn9Kpi+GjT63tqfcahaYNTBeEH492kGYa3vyj/I2fAmirM3DGo6q4Xg/m5
         FNMVm3XFjKs1yedlqRM7kbBz9pNWhDdwxjVVZMOKADkJ8mgHZWzMc43ycTgyASVfjYRE
         TGAbxZCKkA+NG8ZPCXhn5RB9ORFR8KwGcC/IIUqCEj3568hhRT8B62W3TtV9PbJwdy3I
         XDq+U9K1dYnhtYzL8SXKOD8tHTMBptHhnoUYKU4YvEveeUGUMC28P8ryoSMg9WEhjSsb
         dQbTFreLzdsbfLJqKmXp7BYOHzcOhuTe+nAdY9+8YLuRYsqwRvuYtrrWiCd8pLW351wo
         8JBw==
X-Gm-Message-State: AO0yUKXDyUrSOdOKSP81IxsWKYeer0goZW04eM0Qf1Fou9xAXyXFjVDd
	m3m6nYPjZIcw/8bvoSXku/HMPsMRSbI4tmJJfr8U4Sfu4BV37dUj/1KFpejXmV3DLLoLVzJmT/T
	UsRC5gYJoO8zX0yWz9lSAlqSCQyUfWpUZug3LMUPkpPjS683/PFE7SGlA0X0z/wiPUIRKn5WVDz
	i+VZs=
X-Received: by 2002:ac2:5d4f:0:b0:4d5:72fd:5348 with SMTP id w15-20020ac25d4f000000b004d572fd5348mr495977lfd.88.1675777902422;
        Tue, 07 Feb 2023 05:51:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+qjUmoInr/vN5+OHXEOmKd5dkh+hCUqmfJsWkCuiiC745ZOg6tBvvZWdiRV/z5CDkaoLycJwe6pHPxf/ewfLU=
X-Received: by 2002:ac2:5d4f:0:b0:4d5:72fd:5348 with SMTP id
 w15-20020ac25d4f000000b004d572fd5348mr495968lfd.88.1675777902013; Tue, 07 Feb
 2023 05:51:42 -0800 (PST)
MIME-Version: 1.0
References: <17418F02A2590049.20960@lists.yoctoproject.org>
In-Reply-To: <17418F02A2590049.20960@lists.yoctoproject.org>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Tue, 7 Feb 2023 19:21:30 +0530
Message-ID: <CAEd-yTQDmrgD5Hek3MEccg429YTZWWQs=huNcdpGa=8yg8xq1A@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
To: sinthu.raja@mistralsolutions.com
Cc: denys@ti.com, detheridge@ti.com, meta-ti@lists.yoctoproject.org, 
	Sinthu Raja <sinthu.raja@ti.com>, Ryan Eatmon <reatmon@ti.com>
Content-Type: multipart/alternative; boundary="000000000000928cda05f41c7212"
X-BESS-ID: 1675777902-302200-5389-2770-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.167.71
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245981 [from 
	cloudscan23-143.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 HTML_MESSAGE           BODY: HTML included in message 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.50 BSF_SC0_SA_TO_FROM_ADDR_MATCH META: Sender Address Matches Recipient Address  
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=HTML_MESSAGE, BSF_BESS_OUTBOUND, BSF_SC0_SA_TO_FROM_ADDR_MATCH, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 13:51:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15731

--000000000000928cda05f41c7212
Content-Type: text/plain; charset="UTF-8"

+Ryan Eatmon <reatmon@ti.com>

On Tue, Feb 7, 2023 at 7:19 PM Sinthu Raja M via lists.yoctoproject.org
<sinthu.raja=mistralsolutions.com@lists.yoctoproject.org> wrote:

> From: Sinthu Raja <sinthu.raja@ti.com>
>
> The AM68 SK has PWM output pins connected to its RPi headers. Add
> overlay file to enable PWM pins.
>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>  conf/machine/j721s2-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 7c120dcc..7e0f1246 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
>      ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
>      ti/k3-am68-sk-fpdlink-fusion.dtbo \
> +    ti/ k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
>      ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
>      ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
>      ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
> --
> 2.36.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15730):
> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-ti%2fmessage%2f15730&c=E,1,P1Nx2HUetGxnoh1_Ym8ZfLWjazv54M4vpR5iqEHnCIpRt36lwhBezrW2ioOw3zDtg95J_HJJSXkUWWC9YbrgFJfdMIVjst9_pNjZYkrrWA,,&typo=1
> Mute This Topic:
> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fmt%2f96807109%2f6034914&c=E,1,YFF_Z3rxZduaQfxaaaW66hV0EX82uOTJE3th2iT5EWr5luLisPzGITzTBEKd1YoLcFsOfH9Jmaov3X3rv8T3Mfd8yxhGBUDU-hSEhd6ELpZkKDmwvRL7iTRW7O5z&typo=1
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:
> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-ti%2funsub&c=E,1,Vp5jBjV4askKehuiaAtU2vfovANB3Z5DvJUkYIlIMM1vH9m13jbtgu5vPEwI7pWWa5PgyubYkTxzUsBQdv5VC3UokMLiJYLqxQGqwYoG_AyuAQ,,&typo=1
> [sinthu.raja@mistralsolutions.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
With Regards
Sinthu Raja

--000000000000928cda05f41c7212
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:reatmon@ti.com" tabindex=3D"-1">+Ryan Eatmon</a>=C2=A0<br></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Feb 7, 2023 at 7:19 PM Sinthu Raja M via <a href=3D"http://lists.yoctopro=
ject.org">lists.yoctoproject.org</a> &lt;sinthu.raja=3D<a href=3D"mailto:mi=
stralsolutions.com@lists.yoctoproject.org">mistralsolutions.com@lists.yocto=
project.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Sinthu Raja &lt;<a href=3D"mailto:sinthu.raja@ti.com" targ=
et=3D"_blank">sinthu.raja@ti.com</a>&gt;<br>
<br>
The AM68 SK has PWM output pins connected to its RPi headers. Add<br>
overlay file to enable PWM pins.<br>
<br>
Signed-off-by: Sinthu Raja &lt;<a href=3D"mailto:sinthu.raja@ti.com" target=
=3D"_blank">sinthu.raja@ti.com</a>&gt;<br>
---<br>
=C2=A0conf/machine/j721s2-evm.conf | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf<br=
>
index 7c120dcc..7e0f1246 100644<br>
--- a/conf/machine/j721s2-evm.conf<br>
+++ b/conf/machine/j721s2-evm.conf<br>
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0ti/k3-am68-sk-bb-csi2-ov5640.dtbo \<br>
=C2=A0 =C2=A0 =C2=A0ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \<br>
=C2=A0 =C2=A0 =C2=A0ti/k3-am68-sk-fpdlink-fusion.dtbo \<br>
+=C2=A0 =C2=A0 ti/ k3-am68-sk-rpi-hdr-ehrpwm.dtbo \<br>
=C2=A0 =C2=A0 =C2=A0ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \<br>
=C2=A0 =C2=A0 =C2=A0ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \<br>
=C2=A0 =C2=A0 =C2=A0ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \<br>
-- <br>
2.36.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15730): <a href=3D"https://linkprotect.cudasvc.com/url?=
a=3Dhttps%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-ti%2fmessage%2f15730&am=
p;c=3DE,1,P1Nx2HUetGxnoh1_Ym8ZfLWjazv54M4vpR5iqEHnCIpRt36lwhBezrW2ioOw3zDtg=
95J_HJJSXkUWWC9YbrgFJfdMIVjst9_pNjZYkrrWA,,&amp;typo=3D1" rel=3D"noreferrer=
" target=3D"_blank">https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fl=
ists.yoctoproject.org%2fg%2fmeta-ti%2fmessage%2f15730&amp;c=3DE,1,P1Nx2HUet=
Gxnoh1_Ym8ZfLWjazv54M4vpR5iqEHnCIpRt36lwhBezrW2ioOw3zDtg95J_HJJSXkUWWC9Ybrg=
FJfdMIVjst9_pNjZYkrrWA,,&amp;typo=3D1</a><br>
Mute This Topic: <a href=3D"https://linkprotect.cudasvc.com/url?a=3Dhttps%3=
a%2f%2flists.yoctoproject.org%2fmt%2f96807109%2f6034914&amp;c=3DE,1,YFF_Z3r=
xZduaQfxaaaW66hV0EX82uOTJE3th2iT5EWr5luLisPzGITzTBEKd1YoLcFsOfH9Jmaov3X3rv8=
T3Mfd8yxhGBUDU-hSEhd6ELpZkKDmwvRL7iTRW7O5z&amp;typo=3D1" rel=3D"noreferrer"=
 target=3D"_blank">https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fli=
sts.yoctoproject.org%2fmt%2f96807109%2f6034914&amp;c=3DE,1,YFF_Z3rxZduaQfxa=
aaW66hV0EX82uOTJE3th2iT5EWr5luLisPzGITzTBEKd1YoLcFsOfH9Jmaov3X3rv8T3Mfd8yxh=
GBUDU-hSEhd6ELpZkKDmwvRL7iTRW7O5z&amp;typo=3D1</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f=
%2flists.yoctoproject.org%2fg%2fmeta-ti%2funsub&amp;c=3DE,1,Vp5jBjV4askKehu=
iaAtU2vfovANB3Z5DvJUkYIlIMM1vH9m13jbtgu5vPEwI7pWWa5PgyubYkTxzUsBQdv5VC3UokM=
LiJYLqxQGqwYoG_AyuAQ,,&amp;typo=3D1" rel=3D"noreferrer" target=3D"_blank">h=
ttps://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org=
%2fg%2fmeta-ti%2funsub&amp;c=3DE,1,Vp5jBjV4askKehuiaAtU2vfovANB3Z5DvJUkYIlI=
MM1vH9m13jbtgu5vPEwI7pWWa5PgyubYkTxzUsBQdv5VC3UokMLiJYLqxQGqwYoG_AyuAQ,,&am=
p;typo=3D1</a> [<a href=3D"mailto:sinthu.raja@mistralsolutions.com" target=
=3D"_blank">sinthu.raja@mistralsolutions.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">With Regards<div>Sinthu Raja<br=
></div></div></div>

--000000000000928cda05f41c7212--

