Return-Path: <eric.seuret@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63BA4E006C6
	for <meta-ti@yoctoproject.org>; Wed, 19 Feb 2014 01:30:03 -0800 (PST)
Received: by mail-oa0-f51.google.com with SMTP id h16so128843oag.10
	for <meta-ti@yoctoproject.org>; Wed, 19 Feb 2014 01:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LUr8WQCpggvd2v2+3K+xuCJuWUSCa5fy4iGV8H/5zMg=;
	b=RSQlaT/YJAF2n328bD4kUKlx+YOeocS8ROs/ouczy56t7KCGcuKin5xtQLgVBizikm
	YrZ1AkOgGUw0ThTISEHfNeDdl7upJ0C/bbf8+gXpc4wrYjzJUsnHjb36nngRN/WBZrV5
	TqOG3uDXJgzc6d0bJy+Tmj24WYA+KaWX4ClxZmHiOrEZRZhsEbOQTNGJofyhON7QcKzA
	JNpolT4Cmp4VG2PdqZOqJECrWAn9FTmgcdfKyJwoTjVHe025NNTg8Vk5/5rZRwv467AU
	JF4EJZSE/Z2lKaZ3KUkNWZArKKEJ4m7T/Q5wHDkJm/xKWMer50laj0/xQwzz8AUQNmgl
	vXyw==
MIME-Version: 1.0
X-Received: by 10.182.166.40 with SMTP id zd8mr29983667obb.25.1392802201409;
	Wed, 19 Feb 2014 01:30:01 -0800 (PST)
Received: by 10.182.115.10 with HTTP; Wed, 19 Feb 2014 01:30:01 -0800 (PST)
Date: Wed, 19 Feb 2014 10:30:01 +0100
Message-ID: <CA+ujt=q+j7sBLqCFaAwomZepAah2R-y7=bp_H38otNvBUNznyg@mail.gmail.com>
From: Eric Seuret <eric.seuret@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Support for capemgr
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Feb 2014 09:30:06 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1ce0275226a04f2bf083b

--e89a8ff1ce0275226a04f2bf083b
Content-Type: text/plain; charset=UTF-8

Hello,

I have been toying around with yocto and the meta-ti layer for my
beaglebone black and I am able to build and boot an image (I made
core-image-basic). However i don't seem to see the capemgr in my
/sys/devices.

I guess this means that meta-ti doesn't support the capemgr, but maybe I am
doing something wrong... Is there a way to activate the capemgr support in
the meta-ti layer or is it just not supported ?

For the config I just activated the meta-ti, yocto and yocto-bsp layers in
my bblayers.conf

I have meta-ti at the tag: ti2013.12.00
and yocto at the tag: yocto-1.5.1.final

Thanks,

Eric

--e89a8ff1ce0275226a04f2bf083b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I have been toying around with y=
octo and the meta-ti layer for my beaglebone black and I am able to build a=
nd boot an image (I made core-image-basic). However i don&#39;t seem to see=
 the capemgr in my /sys/devices.=C2=A0</div>
<div><br></div><div>I guess this means that meta-ti doesn&#39;t support the=
 capemgr, but maybe I am doing something wrong... Is there a way to activat=
e the capemgr support in the meta-ti layer or is it just not supported ?</d=
iv>
<div><br></div><div><div>For the config I just activated the meta-ti, yocto=
 and yocto-bsp layers in my bblayers.conf<br></div><div><br></div><div>I ha=
ve meta-ti at the tag: ti2013.12.00</div><div>and yocto at the tag: yocto-1=
.5.1.final</div>
</div><div><br></div><div>Thanks,</div><div><br></div><div>Eric</div><div><=
br></div><div><br></div></div>

--e89a8ff1ce0275226a04f2bf083b--
