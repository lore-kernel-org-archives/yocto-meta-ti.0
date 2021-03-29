Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1352.1617043357795922683
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 11:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B75540C2A;
	Mon, 29 Mar 2021 18:42:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKLrW8r4J1m4; Mon, 29 Mar 2021 18:42:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1710340952;
	Mon, 29 Mar 2021 18:42:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CBB27174567; Mon, 29 Mar 2021 14:42:35 -0400 (EDT)
Date: Mon, 29 Mar 2021 14:42:35 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: tagliapietra.alessandro@gmail.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] No serial output on a custom AM3352 board
Message-ID: <20210329184235.GC14886@denix.org>
References: <28ma.1617003789931138360.Mb2u@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <28ma.1617003789931138360.Mb2u@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Just a follow up from our IRC discussion with more clarifications.

* This is an industrial board/product from a 3rd-party manufacturer, base=
d on=20
AM3352 SoC. It's custom enough, as obviously EVM images don't boot.

* The manufacturer did not provide sources or instructions with the board=
,=20
only SD card binary images.

* Boot log from those images indicate U-boot 2014.07 and kernel 3.14.43, =
which=20
are quite ancient

Getting recent u-boot and kernel working on this board will require recre=
ating=20
board configs and updating old DTS. Not sure mixing old u-boot with new k=
ernel=20
is a good idea either - still need to massage DTS...

Maybe our BSP experts here can pitch in and comment on feasibility of thi=
s=20
effort. It's definitely not Yocto specific though.


On Mon, Mar 29, 2021 at 12:43:09AM -0700, tagliapietra.alessandro@gmail.c=
om wrote:
> Hello everyone,
>=20
> first time yocto user here, I'm trying to get a very minimal image to b=
oot=20
> on a AM3352 based device that a local company made, however when it boo=
ts=20
> there is no output on the serial port.
>=20
> These are the steps I've tried:
> - added meta-ti and dependent layers
> - removed these features from the minimal image "alsa ext2 api-document=
ation=20
> bluetooth ipv6 opengl pcmcia ppp ptest wayland wifi x11 vulkan" as I do=
n't=20
> think are needed for our basic test
> - taken the dtb file from the manufacturer sd card, converted to dts us=
ing=20
> dtc, added to the kernel using a layer and changed=A0KERNEL_DEVICETREE =
=3D=20
> "device-name-here.dtb"=A0 (name replaced)
> - I've cloned their SD card to make sure the partitions are the same (F=
AT16=20
> first partition with boot flag + ext4 second partition)
> - bitbake build
> - replaced MLO/u-boot.img in the boot partition
> - extracted rootfs into the ext4 partition, copied zImage and the dtb f=
iles=20
> in the /boot folder
>=20
> I've also tried to use am335x-hs-evm as the machine (using also the UAR=
T=20
> variants of MLO and U-boot) but no luck.
> In case it's needed, these are the env variables from their working SD =
card=20
> u-boot
>=20
> https://gist.github.com/alex88/5e8d604ab15540b84353040a83bc0606
>=20
> What should I try to at least be able to get u-boot to output something=
 in the console?
>=20
> Thank you in advance

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
