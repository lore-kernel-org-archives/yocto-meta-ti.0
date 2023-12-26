Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A765EC46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 21:59:04 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.89609.1703627936838771067
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Dec 2023 13:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YKhBp2ve;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: bremenpl@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ccaf5955aeso28883471fa.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 26 Dec 2023 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703627934; x=1704232734; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:reply-to:message-id:date:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FL+9F1n4BemLsv4kKvCUIMh0oWMlWy3tg1oxlB70Ehw=;
        b=YKhBp2ve6ndIUdMTRX/01WQ4QHOtUWm6jiSAx+aaSGzh5DhNtwGlWSYdSELpM/DBrh
         26zRlli553vH35gnIeJosyQbN7RBezXwQs4bkPTEzbJtoumigTGwYJwc3qpGUQiQNqky
         tMEI6+B2jvEi/isRECqYca+4F8g9WUTB8+TsspwRv8B4+s36j9W/PGARjbEfmIvBJZIc
         i6HD0R1m54oykciXrghlxTgg54NnBJ486Rd1fok5f+QNES/AKHCZfOKloQHptG5SQ78l
         2hzZrUFSidMGtObkfOX/jvv29oMwtsy+ZBufu2uANcQx8h5Uk5zcE/LKA+ekx8mWRhVs
         SGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703627934; x=1704232734;
        h=mime-version:user-agent:reply-to:message-id:date:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FL+9F1n4BemLsv4kKvCUIMh0oWMlWy3tg1oxlB70Ehw=;
        b=MQTzpOhotWwbB1n+1bI06ErcojgUi9NLDQjs+jgFBi46S41EzkIYymLy19ZD1UOx+g
         prtmOLokeLtXejD5kNjV5i69J2kGGNZ8qyipjMunkFYmSWcW/FOWc7h6Z3PseXajNk3A
         hEBX16F0aP6/3nMSG4SGRzPp1O0J3FowdHbO0qeGile5/vvaV+OwTGiwM2A54IXpxD3A
         Wk4TwO82xdQAn27NeKSk9YYJrz2HB+gKNyKViuLtuEp7ZRXmUkIaZX5kt3nAba/iQX0g
         Gak1rgj1Xc+l6dHUoQ8cjeIlUGBPitjE4fet56Z+10j8hzCr/owPGDUkHEks4wGH164N
         f43Q==
X-Gm-Message-State: AOJu0Ywz6SCBh+or2TPiZkr/MTsTKFNr70OWw1xR6TyDf4KIoyZjxQUW
	x5SSkL34JqDq9l0AGEQj3V26BolPjGw=
X-Google-Smtp-Source: AGHT+IGtghDwSbLFOGqbmC3EMiERnSDyzwmi2agtM3Cfxz5mmOgT4BlRbuNSJeb7t9AISY/u33gegQ==
X-Received: by 2002:a05:6512:3c95:b0:50e:7437:163c with SMTP id h21-20020a0565123c9500b0050e7437163cmr2405958lfv.119.1703627933950;
        Tue, 26 Dec 2023 13:58:53 -0800 (PST)
Received: from [192.168.7.144] (epe193.neoplus.adsl.tpnet.pl. [83.20.46.193])
        by smtp.gmail.com with ESMTPSA id w6-20020ac25986000000b0050e7663a31csm1051921lfn.223.2023.12.26.13.58.52
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Dec 2023 13:58:53 -0800 (PST)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: How to find out which *.dts is used?
Date: Tue, 26 Dec 2023 21:58:52 +0000
Message-Id: <em4d40669c-67e5-4e8a-823d-e2d56c17a6f2@2eaa81f9.com>
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
User-Agent: eM_Client/9.2.2157.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------=_MBBCBB9AB4-8FFC-4C68-9FEB-10EC0EE6120B"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Dec 2023 21:59:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17372

--------=_MBBCBB9AB4-8FFC-4C68-9FEB-10EC0EE6120B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,
I am currently learning about the Poky and meta-ti. I am trying to build=20
a custom image for the BBB. What I cannot get my head around right now=20
(amongst really many things related to this work), is how to figure out=20
which "am335x-boneblack.dts" file exactly is used by my build... When do=20
a search in the compiled build directory I get multiple sources:

lukasz@vmks:~/udemy-yocto/src/build-ti$ find . -name=20
"am335x-boneblack.dts"
./tmp/work-shared/beaglebone/kernel-source/arch/arm/boot/dts/am335x-bonebla=
ck.dts
./tmp/work/beaglebone-poky-linux-gnueabi/u-boot-ti-staging/1_2021.01+gitAUT=
OINC+3a5205e980-r33/git/arch/arm/dts/am335x-boneblack.dts
./tmp/work/armv7at2hf-neon-poky-linux-gnueabi/linux-libc-headers/5.4-r0/lin=
ux-5.4/arch/arm/boot/dts/am335x-boneblack.dts
./tmp/work/x86_64-linux/qemu-native/4.2.0-r0/qemu-4.2.0/roms/u-boot/arch/ar=
m/dts/am335x-boneblack.dts

The layers I am using right now are:

lukasz@vmks:~/udemy-yocto/src/build-ti$ bitbake-layers show-layers
NOTE: Starting bitbake server...
layer                 path                                      priority
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
meta                  /home/lukasz/udemy-yocto/src/poky/meta    5
meta-poky             /home/lukasz/udemy-yocto/src/poky/meta-poky  5
meta-arm-toolchain   =20
/home/lukasz/udemy-yocto/src/meta-arm/meta-arm-toolchain  30
meta-arm              /home/lukasz/udemy-yocto/src/meta-arm/meta-arm  6
meta-ti               /home/lukasz/udemy-yocto/src/meta-ti      6
meta-oe              =20
/home/lukasz/udemy-yocto/src/meta-openembedded/meta-oe  6

My MACHINE in local.conf is: beaglebone

I am trying to write a custom device tree overlay for the=20
am335x-boneblack.dts, but I have no clarity which am335x-boneblack.dts=20
is the one I am writing the overlay for (that is, which of the available=20
am335x-boneblack.dts is compiled during bitbake to the=20
am335x-boneblack.dtb and copied over to the images dir). All these files=20
are a bit different from one another (probably come in different=20
versions). How to check which one is used by the build?

I would appreciate all help!

--
=C5=81ukasz Przenios=C5=82o

--------=_MBBCBB9AB4-8FFC-4C68-9FEB-10EC0EE6120B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

<style id=3D"css_styles">=20
blockquote.cite { margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc }
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

 </style>
</head>
<body><div>Hello,</div><div>I am currently learning about the Poky and meta=
-ti. I am trying to build a custom image for the BBB. What I cannot get my=
 head around right now (amongst really many things related to this work), is =
how to figure out which "am335x-boneblack.dts" file exactly is used by my=
 build... When do a search in the compiled build directory I get multiple so=
urces:</div><div><br /></div><div><font face=3D"Consolas" size=3D"2" style=
=3D"font-size: 10pt;">lukasz@vmks:~/udemy-yocto/src/build-ti$ find . -name=
 "am335x-boneblack.dts"
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">./tmp/work-shared/beaglebone/kernel-source/arch/arm/boot/dts/am335x-bo=
neblack.dts
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">./tmp/work/beaglebone-poky-linux-gnueabi/u-boot-ti-staging/1_2021.01+g=
itAUTOINC+3a5205e980-r33/git/arch/arm/dts/am335x-boneblack.dts
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">./tmp/work/armv7at2hf-neon-poky-linux-gnueabi/linux-libc-headers/5.4-r=
0/linux-5.4/arch/arm/boot/dts/am335x-boneblack.dts
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">./tmp/work/x86_64-linux/qemu-native/4.2.0-r0/qemu-4.2.0/roms/u-boot/ar=
ch/arm/dts/am335x-boneblack.dts
</font></div><div><br /></div><div>The layers I am using right now are:</di=
v><div><br /></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-si=
ze: 10pt;">lukasz@vmks:~/udemy-yocto/src/build-ti$ bitbake-layers show-laye=
rs
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">NOTE: Starting bitbake server...
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">layer=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=
=C2=A0 path=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=
=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =
=C2=A0=C2=A0 =C2=A0=C2=A0 priority
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">meta=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=
=C2=A0 =C2=A0/home/lukasz/udemy-yocto/src/poky/meta=C2=A0 =C2=A0 5
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">meta-poky=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0 /home/lu=
kasz/udemy-yocto/src/poky/meta-poky=C2=A0 5
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">meta-arm-toolchain=C2=A0 =C2=A0 /home/lukasz/udemy-yocto/src/meta-arm/=
meta-arm-toolchain=C2=A0 30
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">meta-arm=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 /ho=
me/lukasz/udemy-yocto/src/meta-arm/meta-arm=C2=A0 6
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">meta-ti=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=
=A0/home/lukasz/udemy-yocto/src/meta-ti=C2=A0 =C2=A0=C2=A0 =C2=A06
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">meta-oe=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 =C2=
=A0/home/lukasz/udemy-yocto/src/meta-openembedded/meta-oe=C2=A0 6</font></d=
iv><div><br /></div><div>My MACHINE in local.conf is: beaglebone</div><div>=
<br /></div><div>I am trying to write a custom device tree overlay for the=
=C2=A0<span>am335x-boneblack.dts, but I have no clarity which=C2=A0</span><=
span>am335x-boneblack.dts is the one I am writing the overlay for (that is, =
which of the available=C2=A0</span><span>am335x-boneblack.dts is compiled=
 during bitbake to the=C2=A0</span><span>am335x-boneblack.dtb and copied ove=
r to the images dir). All these files are a bit different from one another=
 (probably come in different versions). How to check which one is used by th=
e build?</span></div><div><span><br /></span></div><div><span>I would appre=
ciate all help!</span></div>
<div><br /></div><div id=3D"signature_old" style=3D"clear:both">--<div>=C5=
=81ukasz Przenios=C5=82o</div></div><div><br /></div>
</body></html>
--------=_MBBCBB9AB4-8FFC-4C68-9FEB-10EC0EE6120B--


