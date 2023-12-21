Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F6DC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:03:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.53209.1703171002437581683
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 07:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G5pwSyN2;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: bremenpl@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3367601a301so810187f8f.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 07:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703171001; x=1703775801; darn=lists.yoctoproject.org;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L3WeXYL6sA/Hy5bYf1n/7+ns7+AvmiUWmpExkN731jY=;
        b=G5pwSyN2LkDg1G+zF2Z/kiOLCKRiqvCnllFJhOc9TZPj02wU/pqEKhoOU1I7ZlY7NZ
         HXCDSFyo4mAHfIzBVrtWy+8XT3M+uhNj7MVosmrbCJTAPBQaGiE2gYPoRoCdu0IhJH+a
         B+TO02CXvi5MLWh/rI2jPHoOm7ALQ3jSkDQCVECMKBN+lNIMXNH92T5l7j+/SFtRWWAL
         gucpx9MmQI8T7b6OmrKXhH7c4kj2ZQnCdWcGkffcQNRHxB/qTxDXmeLJL3GWVpbN/Xm0
         9Vn3V7cdOLBZGz72vdpJrThDWt7x7YooCV3e6/Rnu1D3eUszBJV0yoFXC/obFPyG6t4U
         DRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703171001; x=1703775801;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3WeXYL6sA/Hy5bYf1n/7+ns7+AvmiUWmpExkN731jY=;
        b=GFFnUCtIHQHq/p6CWMDTxUYjaKbQtlYQ3/ZR2NgsOrOBAKxK5MOBD5deSzX1xf1xq8
         BnMgAKZnxml1uMbmYHCP3lJh8La5mZQrx6YVI3kzttRw8gNQ8SZniNqN+Zkon8ldgrY/
         HUcpy2eUc5MiN7/Fhc0yXwSwvbqikrNCEWSMkLTE+I3FqvhopgRz1exuSWbNaKyMd1sW
         NA5es7WQfcdhscPZfe4/vpzLM9EpTsJ6IW5ZRu8HnTasD1gd+2wv47dWm3Uw/WWPafoW
         +531C1MUifxtDHTt325bpzJpbLLDO8FsKo9TGP2V+LhzrtZuzZfSXWpb89DhHs+dU876
         jw+A==
X-Gm-Message-State: AOJu0Yx+u29NlM0sTn14O4jcPyrqW0c/QTp9fU3iLDe3hjk7HWhO2zqq
	oeVf3ibSoN890gNGipGsvII=
X-Google-Smtp-Source: AGHT+IHG3vbKvIeylnCNDx7slJUUVtRvVFtrrzF1BE2gUdltluQ/w5NYguP12gF/pyNaH7zlKJ0N6g==
X-Received: by 2002:adf:f1cf:0:b0:333:4d2b:9951 with SMTP id z15-20020adff1cf000000b003334d2b9951mr563246wro.44.1703171000553;
        Thu, 21 Dec 2023 07:03:20 -0800 (PST)
Received: from [192.0.0.4] (public-gprs389938.centertel.pl. [37.47.154.115])
        by smtp.gmail.com with ESMTPSA id c9-20020a056000104900b003368849129dsm1598466wrx.15.2023.12.21.07.03.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Dec 2023 07:03:20 -0800 (PST)
From: Bremenpl <bremenpl@gmail.com>
To: Jon Cormier <jcormier@criticallink.com>
CC: <meta-ti@lists.yoctoproject.org>
Date: Thu, 21 Dec 2023 16:03:20 +0100
Message-ID: <18c8ce702d8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <CADL8D3bhvg4CjJrGdniJmX4QPf2-Y08_fKTaZVkN1_P0ebecfA@mail.gmail.com>
References: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
 <CADL8D3bhvg4CjJrGdniJmX4QPf2-Y08_fKTaZVkN1_P0ebecfA@mail.gmail.com>
User-Agent: AquaMail/1.49.0 (build: 104900403)
Subject: Re: [meta-ti] Custom device tree overlay for BBB
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="18c8ce706d0633284eb1de2c4"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 15:03:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17363

This is a multi-part message in MIME format.
--18c8ce706d0633284eb1de2c4
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi and thank you for the answer Jonathan!

Do you happen to also know a good reference on how to incorporate an 
overlay into the yocto build?

On December 21, 2023 15:58:56 Jon Cormier <jcormier@criticallink.com> wrote:
> Here is a possible example overlay that configures pinmuxes with the 
> expectation that the pru's will use them.  There is likely a similar 
> example in that long list of overlays that disables hdmi.
>
>
> https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts
>
> Note its entirely possible these examples won't build or apply correctly on 
> a different kernel version, but they should still be a decent starting point.
>
>
>
> On Thu, Dec 21, 2023 at 6:34 AM Lukasz Przenioslo <bremenpl@gmail.com> wrote:
>
> Hello there,
>
> I was able to compile the Poky image (Dunfell) with meta-ti included for 
> the BBB. I am working on an open source project intended for home 
> automation based on the BBB: https://github.com/Beaglenode/BeagleNodeHW
>
> The next step I am trying to make is to prepare a proper device tree 
> overlay that would align with the HW requirements of this project (or 
> "cape"). I need to:
> - Disable the HDMI pins,
> - configure multiple pins as either PRU0 or PRU1 controlled.
>
> For that I thought the best approach would be to prepare a DTO, instead of 
> modifying the default one for BBB. I don't know how to prepare that DTO yet 
> and I don't know how to include it in my build. I would like to ask for 
> some help in this manner, especially the prior part (how to load the custom 
> DTO). Right now I am still modifying everything in the local.conf, as I do 
> not have the knowledge yet to build my own distro for this device (that's 
> the end plan).
>
> I would appreciate all help!
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17360): 
> https://lists.yoctoproject.org/g/meta-ti/message/17360
> Mute This Topic: https://lists.yoctoproject.org/mt/103298715/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub 
> [jcormier@criticallink.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
>
> --
>
> Jonathan Cormier
> Software Engineer
>
> Voice:  315.425.4045 x222
>
>
>
>
>
>
> http://www.CriticalLink.com
>
> 6712 Brooklawn Parkway, Syracuse, NY 13211


--18c8ce706d0633284eb1de2c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body style=3D"font-family: Arial, Myriad, 'Liberation Sans', sans-serif;">
<div dir=3D"auto">
<div dir=3D"auto">Hi and thank you for the answer Jonathan!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Do you happen to also know a good ref=
erence on how to incorporate an overlay into the yocto build?</div><div dir=
=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black; font-family: sans-serif;">
<!-- body start -->
<div class=3D"aqm-original-body">
<div style=3D"color: black;">
<p style=3D"color: black; font-size: 10pt; font-family: sans-serif; margin:=
 8pt 0;">On December 21, 2023 15:58:56 Jon Cormier &lt;jcormier@criticallin=
k.com&gt; wrote:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"ltr"><div>Here is a possible example overlay that configures pi=
nmuxes with the expectation that the pru's will use them.&nbsp; There is li=
kely a similar example in that long list of overlays that disables hdmi.<br=
></div><div><br></div><div><a href=3D"https://github.com/beagleboard/bb.org=
-overlays/blob/master/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts">ht=
tps://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/AM335X-PRU=
-RPROC-4-19-TI-PRUCAPE-00A0.dts</a></div><div><br></div><div>Note its entir=
ely possible these examples won't build or apply correctly on a different k=
ernel version, but they should still be a decent starting point.<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo &lt;<a href=3D"mai=
lto:bremenpl@gmail.com">bremenpl@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hello there,<br>
<br>
I was able to compile the Poky image (Dunfell) with meta-ti included for th=
e BBB. I am working on an open source project intended for home automation =
based on the BBB: <a href=3D"https://github.com/Beaglenode/BeagleNodeHW" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Beaglenode/BeagleNode=
HW</a><br>
<br>
The next step I am trying to make is to prepare a proper device tree overla=
y that would align with the HW requirements of this project (or "cape"). I =
need to:<br>
- Disable the HDMI pins,<br>
- configure multiple pins as either PRU0 or PRU1 controlled.<br>
<br>
For that I thought the best approach would be to prepare a DTO, instead of =
modifying the default one for BBB. I don't know how to prepare that DTO yet=
 and I don't know how to include it in my build. I would like to ask for so=
me help in this manner, especially the prior part (how to load the custom D=
TO). Right now I am still modifying everything in the local.conf, as I do n=
ot have the knowledge yet to build my own distro for this device (that's th=
e end plan).<br>
<br>
I would appreciate all help!<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17360): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17360" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17360</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/103298715/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/103298715/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">j=
cormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><span style=3D"color: #000000;">Voice:&nbsp;&nbsp;<=
a value=3D"+13154254045">315.425.4045</a>&nbsp;x222</span></div><div><span =
style=3D"color: #000000;"><br></span></div><div><span style=3D"color: #0000=
00;"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4xml75fJPK=
YF7M9X5Dux4IrbtzZk0RB6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></spa=
n></div></div></div><div><div><span style=3D"color: #1155cc;"><br></span></=
div><div><a href=3D"http://www.criticallink.com/" target=3D"_blank"><span s=
tyle=3D"color: #1155cc;">http://www.CriticalLink.com</span></a><br></div><d=
iv>6712 Brooklawn Parkway,&nbsp;Syracuse, NY 13211&nbsp;</div></div></div><=
div><div><br></div><div><span style=3D"color: #1155cc;"><span style=3D"colo=
r: #1155cc;"><a href=3D"https://www.linkedin.com/company/critical-link-llc"=
 target=3D"_blank"><img src=3D"https://docs.google.com/uc?export=3Ddownload=
&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D0B2vNSnu-aYu6RHNZUnhNbFp=
ER1l3emNQY2VoaHA0RDdudWlFPQ"></a>&nbsp;&nbsp;<a href=3D"https://twitter.com=
/Critical_Link" target=3D"_blank"><img alt=3D"" src=3D"https://docs.google.=
com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revid=3D=
0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ"></a></span></span></di=
v></div></div></div></div></div></div></div></div></div></div></div></div><=
/div>
</blockquote>
</div>
</div>
<!-- body end -->

</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--18c8ce706d0633284eb1de2c4--


