Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1FFC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 08:34:24 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.19734.1703234059974957034
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Dec 2023 00:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+w3PJtw;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: bremenpl@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cc7ba7d12eso17401171fa.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 22 Dec 2023 00:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703234058; x=1703838858; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
         :date:cc:subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9UAGLY63vs0IEbxiwfqiwrQmKkZtChWkBRo1XoY3Z0=;
        b=T+w3PJtw6UF42yd/Vyz58jR5ZMim4Be3CJNt8Imvs04XEZsPGEswlrU/iTrSa2XoFQ
         McErBoRbUuzQUjDOGcfSvCSJs+Ghv6SICQ5/pRwN2+2SJOXSvE/udVFgbh0NG91h9IgY
         qy3Gwck/js4NVI5ZFTN/3EA6PPdwmXVvlKNzQnM1Og56o86whLjvaKdjEqVCciJB/Cu8
         rQ0T3GDFsFgzsUjoPRLoViUVs1xl7O55EQ9vWQ4KepZ+qb4JmQHmt5jJhTIBVvnF+8xF
         jMLRANY5h9U692LB3P+Zwan49b1+PcPaIkduwTH9ho1S8GIu7gxlng6FijZK157erCXp
         slcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703234058; x=1703838858;
        h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
         :date:cc:subject:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9UAGLY63vs0IEbxiwfqiwrQmKkZtChWkBRo1XoY3Z0=;
        b=gFsmPmKQOzB/RHMnpIVoQ6Jfb7DYKYIfu0Ll7a0TkrCtAYDuDStBJ/t3wREg/ALnO+
         j244QOARm+Py37rvYabIPLnCy8yg2arWiYHBobHLXP9KGTddpbaPS2qUmGCOyxCDhzxk
         iUSeklddhSzJBwBIWB/iUwe6PHw4ohQC/nExXtitkV/aPb7FOs67g3mEuqBbf/MW1xwh
         7eb8hJCCZpwrlavAjdwb1uyfHlKO183/cmVeoqQmbgyb5iL7hsn60n4scFe9isU+CcNJ
         /0XKuDHdm37DxxALwU1CcTviLEPS4yhwKxFw7bjSaZ7SHI1hUW1SwaxdT41K3L8qEahY
         HNDg==
X-Gm-Message-State: AOJu0YxievPU3OR1aJH5GfpV8GxS7lmwfukkdj1h5WTX0jQLVabmSaRw
	SwROyBF70IDxpVyr3FiCeKk=
X-Google-Smtp-Source: AGHT+IEHbeoWBplhsQDE5IsKEIgj2V/iox8bSTp1FcVpVef+aWv1vNPrzrne8oOha8JvUkjg7nSvDA==
X-Received: by 2002:a05:651c:308:b0:2cc:a504:7ca3 with SMTP id a8-20020a05651c030800b002cca5047ca3mr276500ljp.78.1703234057692;
        Fri, 22 Dec 2023 00:34:17 -0800 (PST)
Received: from [192.168.7.17] (eqj153.neoplus.adsl.tpnet.pl. [83.20.77.153])
        by smtp.gmail.com with ESMTPSA id g26-20020a2e9cda000000b002cc4385729dsm533774ljj.27.2023.12.22.00.34.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Dec 2023 00:34:17 -0800 (PST)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: "Denys Dmytriyenko" <denis@denix.org>
Subject: Re[2]: [meta-ti] Custom device tree overlay for BBB
Cc: "Jon Cormier" <jcormier@criticallink.com>, meta-ti@lists.yoctoproject.org
Date: Fri, 22 Dec 2023 08:34:16 +0000
Message-Id: <em1018559f-c228-4883-b996-9c80784a44ce@ffb2c130.com>
In-Reply-To: <20231222070356.GN11745@denix.org>
References: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
 <CADL8D3bhvg4CjJrGdniJmX4QPf2-Y08_fKTaZVkN1_P0ebecfA@mail.gmail.com>
 <18c8ce702d8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3YqbznfEqs2O9Bcf3iqHYZMHGxDHOqHZjcL6EE7cMBUzQ@mail.gmail.com>
 <emfb88b8f2-4501-4fef-8010-1618c71d24e1@ffb2c130.com>
 <20231222014935.GM11745@denix.org>
 <18c8ff29cf8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <20231222070356.GN11745@denix.org>
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
User-Agent: eM_Client/9.2.2157.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------=_MBE318D16B-BB40-4E2F-B3B3-55E27E48B87D"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Dec 2023 08:34:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17371

--------=_MBE318D16B-BB40-4E2F-B3B3-55E27E48B87D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks for the follow up Denys,
It's difficult for me to derive optimal solutions here, as I am only=20
learning the Yocto environment. Eventually I would like to create a=20
"custom OS" that would just build all needed ecosystem for the end=20
device.

At this point I am trying to make a proof of concept approach in which I=20
(via device tree overlay) will be able to deinitialize the HDMI pins and=20
configure at least one pin as a PRU mapped (mode 5 or 6 if I recall=20
correctly).

I will try to make something out of your's and Jon's answers for that=20
end. Thank you again.

--
=C5=81ukasz Przenios=C5=82o


------ Original Message ------
From "Denys Dmytriyenko" <denis@denix.org>
To "Lukasz Przenioslo" <bremenpl@gmail.com>
Cc "Jon Cormier" <jcormier@criticallink.com>;=20
meta-ti@lists.yoctoproject.org
Date 2023-12-22 08:03:56
Subject Re: [meta-ti] Custom device tree overlay for BBB

>Sorry, this got a bit out of context - one of the solutions from Jon was
>talking about adding a bbappend to a kernel recipe, which would then
>automatically handle KERNEL_DEVICETREE list via kernel-devicetree,bbclass
>
>Alternatively, if you add a standalne recipe, all you need is to add your
>overlay to SRC_URI and inherit devicetree.bbclass
>
>
>On Fri, Dec 22, 2023 at 06:14:51AM +0100, Lukasz Przenioslo wrote:
>>  Hi Denys,
>>  Should be easy enough to test it quickly as a proof of concept,
>>  thank you. Will bitbake know to compile this overlay, tell the
>>  u-boot to load it and so on?
>>
>>  On December 22, 2023 02:49:39 Denys Dmytriyenko <denis@denix.org> wrote=
:
>>
>>  >You could simply add your overlay in one of the conf files, such as
>>  >local.conf:
>>  >
>>  >KERNEL_DEVICETREE +=3D "your-overlay.dtbo"
>>  >
>>  >Check the existing machine conf files for examples.
>>  >
>>  >
>>  >On Thu, Dec 21, 2023 at 08:51:49PM +0000, Lukasz Przenioslo wrote:
>>  >>Hi Jon,
>>  >>I guess the first option is more feasible, as I would not like to
>>  >>modify any files provided by the Poky repo, but rather create my own
>>  >>recipe that would somehow cover the default settings during the
>>  >>build. There is still a lot ahead for me to understand though...
>>  >>
>>  >>Thank you for the useful links.
>>  >>
>>  >>--
>>  >>=C5=81ukasz Przenios=C5=82o
>>  >>
>>  >>
>>  >>------ Original Message ------
>>  >>From "Jon Cormier" <jcormier@criticallink.com>
>>  >>To "Bremenpl" <bremenpl@gmail.com>
>>  >>Cc meta-ti@lists.yoctoproject.org
>>  >>Date 2023-12-21 16:17:38
>>  >>Subject Re: [meta-ti] Custom device tree overlay for BBB
>>  >>
>>  >>>This solution seems like a good place to start. I haven't tried it
>>  >>>myself but it looks clean and easy to implement.
>>  >>>https://stackoverflow.com/a/68650774
>>  >>>
>>  >>>The alternative would be to bbappend the kernel and patch your
>>  >>>overlay into the correct folder.
>>  >>>https://stackoverflow.com/a/39343720
>>  >>>
>>  >>>On Thu, Dec 21, 2023 at 10:03=E2=80=AFAM Bremenpl <bremenpl@gmail.co=
m> wrote:
>>  >>>>Hi and thank you for the answer Jonathan!
>>  >>>>
>>  >>>>Do you happen to also know a good reference on how to
>>  >>>>incorporate an overlay into the yocto build?
>>  >>>>
>>  >>>>On December 21, 2023 15:58:56 Jon Cormier
>>  >>>><jcormier@criticallink.com> wrote:
>>  >>>>
>>  >>>>>Here is a possible example overlay that configures pinmuxes
>>  >>>>>with the expectation that the pru's will use them.  There is
>>  >>>>>likely a similar example in that long list of overlays that
>>  >>>>>disables hdmi.
>>  >>>>>
>>  >>>>>https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm=
/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts
>>  >>>>>
>>  >>>>>Note its entirely possible these examples won't build or apply
>>  >>>>>correctly on a different kernel version, but they should still
>>  >>>>>be a decent starting point.
>>  >>>>>
>>  >>>>>On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo
>>  >>>>><bremenpl@gmail.com> wrote:
>>  >>>>>>Hello there,
>>  >>>>>>
>>  >>>>>>I was able to compile the Poky image (Dunfell) with meta-ti
>>  >>>>>>included for the BBB. I am working on an open source project
>>  >>>>>>intended for home automation based on the BBB:
>>  >>>>>>https://github.com/Beaglenode/BeagleNodeHW
>>  >>>>>>
>>  >>>>>>The next step I am trying to make is to prepare a proper
>>  >>>>>>device tree overlay that would align with the HW
>>  >>>>>>requirements of this project (or "cape"). I need to:
>>  >>>>>>- Disable the HDMI pins,
>>  >>>>>>- configure multiple pins as either PRU0 or PRU1 controlled.
>>  >>>>>>
>>  >>>>>>For that I thought the best approach would be to prepare a
>>  >>>>>>DTO, instead of modifying the default one for BBB. I don't
>>  >>>>>>know how to prepare that DTO yet and I don't know how to
>>  >>>>>>include it in my build. I would like to ask for some help in
>>  >>>>>>this manner, especially the prior part (how to load the
>>  >>>>>>custom DTO). Right now I am still modifying everything in
>>  >>>>>>the local.conf, as I do not have the knowledge yet to build
>>  >>>>>>my own distro for this device (that's the end plan).
>>  >>>>>>
>>  >>>>>>I would appreciate all help!
>>  >>>>>>
>>  >>>>>>
--------=_MBE318D16B-BB40-4E2F-B3B3-55E27E48B87D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

<style id=3D"css_styles" type=3D"text/css"><!--blockquote.cite { margin-lef=
t: 5px; margin-right: 0px; padding-left: 10px; padding-right:0px; border-le=
ft: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: center; '], li[s=
tyle=3D'text-align: right;'], li[style=3D'text-align: right; '] {  list-sty=
le-position: inside;}
body { font-family: Verdana; font-size: 12pt; }
.quote { margin-left: 1em; margin-right: 1em; border-left: 5px #ebebeb soli=
d; padding-left: 0.3em; }
--></style></head>
<body><div>Thanks for the follow up Denys,</div><div>It's difficult for me=
 to derive optimal solutions here, as I am only learning the Yocto environme=
nt. Eventually I would like to create a "custom OS" that would just build a=
ll needed ecosystem for the end device.=C2=A0</div><div><br /></div><div>At =
this point I am trying to make a proof of concept approach in which I (via =
device tree overlay) will be able to deinitialize the HDMI pins and config=
ure at least one pin as a PRU mapped (mode 5 or 6 if I recall correctly).=
=C2=A0</div><div><br /></div><div>I will try to make something out of your'=
s and Jon's answers for that end. Thank you again.</div>
<div><br /></div><div id=3D"signature_old" style=3D"clear:both">--<div>=C5=
=81ukasz Przenios=C5=82o</div></div><div style=3D"clear:both"><br /></div>
<div><br /></div>
<div>
<div>------ Original Message ------</div>
<div>From "Denys Dmytriyenko" &lt;<a href=3D"mailto:denis@denix.org">denis@=
denix.org</a>&gt;</div>
<div>To "Lukasz Przenioslo" &lt;<a href=3D"mailto:bremenpl@gmail.com">breme=
npl@gmail.com</a>&gt;</div>
<div>Cc "Jon Cormier" &lt;<a href=3D"mailto:jcormier@criticallink.com">jcor=
mier@criticallink.com</a>&gt;; <a href=3D"mailto:meta-ti@lists.yoctoproject=
.org">meta-ti@lists.yoctoproject.org</a></div>
<div>Date 2023-12-22 08:03:56</div>
<div>Subject Re: [meta-ti] Custom device tree overlay for BBB</div></div><d=
iv><br /></div>
<div id=3D"x9be1692649db45d" class=3D"plain"><blockquote cite=3D"2023122207=
0356.GN11745@denix.org" type=3D"cite" class=3D"cite2">

<div class=3D"plain_line">Sorry, this got a bit out of context - one of the =
solutions from Jon was</div>
<div class=3D"plain_line">talking about adding a bbappend to a kernel recip=
e, which would then</div>
<div class=3D"plain_line">automatically handle KERNEL_DEVICETREE list via k=
ernel-devicetree,bbclass</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Alternatively, if you add a standalne recipe, all =
you need is to add your</div>
<div class=3D"plain_line">overlay to SRC_URI and inherit devicetree.bbclass=
</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">On Fri, Dec 22, 2023 at 06:14:51AM +0100, Lukasz=
 Przenioslo wrote:</div>
<blockquote type=3D"cite" class=3D"cite">
<div class=3D"plain_line"> Hi Denys,</div>
<div class=3D"plain_line"> Should be easy enough to test it quickly as a pr=
oof of concept,</div>
<div class=3D"plain_line"> thank you. Will bitbake know to compile this ove=
rlay, tell the</div>
<div class=3D"plain_line"> u-boot to load it and so on?</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> On December 22, 2023 02:49:39 Denys Dmytriyenko=
 &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> &gt;You could simply add your overlay in one of=
 the conf files, such as</div>
<div class=3D"plain_line"> &gt;local.conf:</div>
<div class=3D"plain_line"> &gt;</div>
<div class=3D"plain_line"> &gt;KERNEL_DEVICETREE +=3D "your-overlay.dtbo"</=
div>
<div class=3D"plain_line"> &gt;</div>
<div class=3D"plain_line"> &gt;Check the existing machine conf files for ex=
amples.</div>
<div class=3D"plain_line"> &gt;</div>
<div class=3D"plain_line"> &gt;</div>
<div class=3D"plain_line"> &gt;On Thu, Dec 21, 2023 at 08:51:49PM +0000, Lu=
kasz Przenioslo wrote:</div>
<div class=3D"plain_line"> &gt;&gt;Hi Jon,</div>
<div class=3D"plain_line"> &gt;&gt;I guess the first option is more feasibl=
e, as I would not like to</div>
<div class=3D"plain_line"> &gt;&gt;modify any files provided by the Poky re=
po, but rather create my own</div>
<div class=3D"plain_line"> &gt;&gt;recipe that would somehow cover the defa=
ult settings during the</div>
<div class=3D"plain_line"> &gt;&gt;build. There is still a lot ahead for me =
to understand though...</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;Thank you for the useful links.</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;--</div>
<div class=3D"plain_line"> &gt;&gt;=C5=81ukasz Przenios=C5=82o</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;------ Original Message ------</div>
<div class=3D"plain_line"> &gt;&gt;From "Jon Cormier" &lt;<a href=3D"mailto=
:jcormier@criticallink.com">jcormier@criticallink.com</a>&gt;</div>
<div class=3D"plain_line"> &gt;&gt;To "Bremenpl" &lt;<a href=3D"mailto:brem=
enpl@gmail.com">bremenpl@gmail.com</a>&gt;</div>
<div class=3D"plain_line"> &gt;&gt;Cc <a href=3D"mailto:meta-ti@lists.yocto=
project.org">meta-ti@lists.yoctoproject.org</a></div>
<div class=3D"plain_line"> &gt;&gt;Date 2023-12-21 16:17:38</div>
<div class=3D"plain_line"> &gt;&gt;Subject Re: [meta-ti] Custom device tree =
overlay for BBB</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;This solution seems like a good plac=
e to start. I haven't tried it</div>
<div class=3D"plain_line"> &gt;&gt;&gt;myself but it looks clean and easy t=
o implement.</div>
<div class=3D"plain_line"> &gt;&gt;&gt;<a href=3D"https://stackoverflow.com=
/a/68650774">https://stackoverflow.com/a/68650774</a></div>
<div class=3D"plain_line"> &gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;The alternative would be to bbappend =
the kernel and patch your</div>
<div class=3D"plain_line"> &gt;&gt;&gt;overlay into the correct folder.</di=
v>
<div class=3D"plain_line"> &gt;&gt;&gt;<a href=3D"https://stackoverflow.com=
/a/39343720">https://stackoverflow.com/a/39343720</a></div>
<div class=3D"plain_line"> &gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;On Thu, Dec 21, 2023 at 10:03=E2=80=
=AFAM Bremenpl &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.com=
</a>&gt; wrote:</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;Hi and thank you for the answer=
 Jonathan!</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;Do you happen to also know a goo=
d reference on how to</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;incorporate an overlay into the=
 yocto build?</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;On December 21, 2023 15:58:56 Jo=
n Cormier</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&lt;<a href=3D"mailto:jcormier@c=
riticallink.com">jcormier@criticallink.com</a>&gt; wrote:</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;Here is a possible example o=
verlay that configures pinmuxes</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;with the expectation that th=
e pru's will use them.  There is</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;likely a similar example in=
 that long list of overlays that</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;disables hdmi.</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;<a href=3D"https://github.co=
m/beagleboard/bb.org-overlays/blob/master/src/arm/AM335X-PRU-RPROC-4-19-TI-=
PRUCAPE-00A0.dts">https://github.com/beagleboard/bb.org-overlays/blob/maste=
r/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts</a></div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;Note its entirely possible t=
hese examples won't build or apply</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;correctly on a different ker=
nel version, but they should still</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;be a decent starting point.<=
/div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;On Thu, Dec 21, 2023 at 6:34=
=E2=80=AFAM Lukasz Przenioslo</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&lt;<a href=3D"mailto:bremen=
pl@gmail.com">bremenpl@gmail.com</a>&gt; wrote:</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;Hello there,</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;I was able to compile th=
e Poky image (Dunfell) with meta-ti</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;included for the BBB. I=
 am working on an open source project</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;intended for home automa=
tion based on the BBB:</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;<a href=3D"https://githu=
b.com/Beaglenode/BeagleNodeHW">https://github.com/Beaglenode/BeagleNodeHW</=
a></div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;The next step I am tryin=
g to make is to prepare a proper</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;device tree overlay that =
would align with the HW</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;requirements of this pro=
ject (or "cape"). I need to:</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;- Disable the HDMI pins,=
</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;- configure multiple pin=
s as either PRU0 or PRU1 controlled.</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;For that I thought the b=
est approach would be to prepare a</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;DTO, instead of modifyin=
g the default one for BBB. I don't</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;know how to prepare that =
DTO yet and I don't know how to</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;include it in my build.=
 I would like to ask for some help in</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;this manner, especially=
 the prior part (how to load the</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;custom DTO). Right now I =
am still modifying everything in</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;the local.conf, as I do=
 not have the knowledge yet to build</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;my own distro for this d=
evice (that's the end plan).</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;I would appreciate all h=
elp!</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;&gt;&gt;&gt;&gt;</div>
</blockquote>
</blockquote></div>


</body></html>
--------=_MBE318D16B-BB40-4E2F-B3B3-55E27E48B87D--


